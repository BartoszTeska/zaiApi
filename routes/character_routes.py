from sqlite3.dbapi2 import Connection, Error
from sys import exec_prefix
from typing import Tuple, final
from flask import json
from flask.blueprints import Blueprint
from flask.cli import with_appcontext
from flask.globals import current_app
from flask.helpers import make_response
from flask.json import jsonify
from flask.wrappers import Response
from flask_jwt_extended.utils import get_jwt
from flask_jwt_extended.view_decorators import jwt_required
from flask import request
from database.database_util import DatabaseUtils
from model.character import RCharacter
from markupsafe import escape

"""
    Flask bluepring containing charater management routes
"""
characters = Blueprint('characters', __name__, None)


def checkRaceClass(database: Connection, raceClass: Tuple[str, str]) -> bool:
    """Function checking if provided race class combo is valid

    Args:
        database (Connection): database connection object
        raceClass (Tuple[str, str]): race class combo

    Returns:
        bool: True if combo is valid False otherwise
    """
    query = 'select * from race_class_dict where race_id=(select id from race_dict where name=?) and class_id=(select id from class_dict where name=?)'
    isRaceClassValid = DatabaseUtils.query_db(database, query, raceClass, True)
    return isRaceClassValid is not None


def checkClassSpec(database: Connection, classSpec: Tuple[str, str]) -> bool:
    """Function checking if provided class spec combo is valid

    Args:
        database (Connection): database connection object
        classSpec (Tuple[str, str]): class spec combo

    Returns:
        bool: True if combo is valid False otherwise
    """
    query = 'select * from spec_dict where class_id=(select id from class_dict where name=?) and name=?'
    isClassSpecValid = DatabaseUtils.query_db(database, query, classSpec, True)
    return isClassSpecValid is not None


@with_appcontext
@characters.route('/characters', methods=["GET", "POST"])
@jwt_required()
def manage_characters() -> Response:
    """Method allowing fetching all characters and adding new character

    Request body:

        POST: {name:string, class:string, spec:string, race:string, server:string, level:number, ilvl:number }

    Raises:
        Error: database error

    Returns:

        - Response:
            - GET: 
                - 500 (database error): {message: string}
                - 200 (fetched characters): {characters: Character[]}

            - POST:
                - 400 (class spec|race class combo not valid): {message:string}
                - 500 (database error): {message:string}
                - 201 (created charaacter): {message:string}
    """
    dbConnection = DatabaseUtils(current_app.config.get("DATABASE")).get_db()
    if request.method == "GET":
        query = 'select * from character'
        try:
            characters = DatabaseUtils.query_db(dbConnection, query)
            responseObject = {"characters": characters}
            return make_response(jsonify(responseObject), 200)
        except Error as e:
            responseObject = {"message": "Failed while fetching characters"}
            return make_response(jsonify(responseObject), 500)
        finally:
            dbConnection.close()
    if request.method == "POST":
        postData = request.get_json()
        userId = get_jwt()['userId']
        try:
            character = RCharacter(postData.get('name'), postData.get('race'), postData.get('class'), postData.get(
                'server'), postData.get('spec'), postData.get('level'), postData.get('ilvl'), userId)
        except ValueError as error:
            responseObject = {"message": error.args[0]}
            dbConnection.close()
            return make_response(jsonify(responseObject), 400)
        raceClass = (escape(character.race), escape(character.cclass),)
        classSpec = (escape(character.cclass), escape(character.spec),)
        if not checkClassSpec(dbConnection, classSpec):
            responseObject = {
                "message": "Provided class doesn't have this spec"}
            dbConnection.close()
            return make_response(jsonify(responseObject), 400)
        if not checkRaceClass(dbConnection, raceClass):
            responseObject = {
                "message": "Provided race can't be of this class"}
            dbConnection.close()
            return make_response(jsonify(responseObject), 400)
        try:
            query = "insert into character(name, race, server,class,spec,user_id,level,item_level) values (?, (select id from race_dict where name=?),?,(select id from class_dict where name=?),(select id from spec_dict where name=?),?,?,?)"
            valuesTuple = (escape(character.name), escape(character.race), escape(character.server), escape(character.cclass),
                           escape(character.spec), escape(character.user), escape(character.level), escape(character.ilvl),)
            charId = DatabaseUtils.modify_db(dbConnection, query, valuesTuple)
            if charId:
                responseObject = {"message": "Created character"}
                return make_response(jsonify(responseObject), 201)
            else:
                raise Error("Couldn't create character")
        except Error as e:
            responseObject = {"message": "Error while creating character"}
            return make_response(jsonify(responseObject), 500)
        finally:
            dbConnection.close()


@with_appcontext
@characters.route('/characters/<userId>', methods=["GET"])
@jwt_required()
def user_characters(userId: int) -> Response:
    """Fetches characters belonging to provided user

    Args:
        userId (int)

    Raises:
        Error: database error

    Returns:

        - Response: 
            - 500 (database error): {message:string}
            - 200 (fetched characters): {characters:Character[]}

    """
    query = 'select * from character where user_id=?'
    dbConnection = DatabaseUtils(current_app.config.get("DATABASE")).get_db()
    try:
        userCharacters = DatabaseUtils.query_db(dbConnection, query, (userId,))
        if not userCharacters:
            raise Error("Couldn't fetch characters")
        responseObject = {"characters": userCharacters}
        return make_response(jsonify(responseObject), 200)
    except Error as e:
        responseObject = {"message": "Couldn't fetch characters"}
        return make_response(jsonify(responseObject), 500)
    finally:
        dbConnection.close()


@with_appcontext
@characters.route('/characters/<userId>/<characterId>', methods=["GET", "DELETE"])
@jwt_required()
def manage_single_char(userId: int, characterId: int) -> Response:
    """Fetches one character of user or deletes user's character

    Args:
        userId (int)
        characterId (int)

    Raises:
        Error: database error

    Returns:

       - Response:
            - GET:
                - 500 (database error or character not found): {message:string}
                - 200 (fetched character): {character:Character}
            - DELETE:
                - 403 (character doesn't belong to logged user): {message:string}
                - 500 (database error or character not found): {message:string}
                - 200 (deleted character): {message:string}

    """
    if request.method == "GET":
        # that's ugly but sqlite didn't want to make joins this day
        query = 'select c.name, c.server, (select name from race_dict where id=c.race) as race, (select name from class_dict where id=c.class) as class, (select name from spec_dict where id=c.spec) as spec ,c.level, c.item_level from character c where c.id=? and c.user_id=?'
        queryParams = (characterId, userId,)
        dbConnection = DatabaseUtils(
            current_app.config.get("DATABASE")).get_db()
        try:
            character = DatabaseUtils.query_db(
                dbConnection, query, queryParams, True)
            if not character:
                raise Error("This user doesn't have that character")
            else:
                responseObject = {"character": character}
                return make_response(jsonify(responseObject), 200)
        except Error as e:
            responseObject = {"message": e.args[0]} if str(e.args[0]).startswith(
                'This user') else {"message": "Couldn't fetch this character"}
            return make_response(jsonify(responseObject), 500)
        finally:
            dbConnection.close()
    if request.method == "DELETE":
        if int(userId) != int(get_jwt()['userId']):
            responseObject = {"message": "Can't delete other users characters"}
            return make_response(jsonify(responseObject), 403)
        query = "delete from character where user_id=? and id=?"
        queryParams = (userId, characterId,)
        dbConnection = DatabaseUtils(
            current_app.config.get("DATABASE")).get_db()
        try:
            deletedId = DatabaseUtils.modify_db(
                dbConnection, query, queryParams)
            if deletedId is None:
                raise Error("Couldn't remove character")
            responseObject = {"message": "Deleted character"}
            return make_response(jsonify(responseObject), 200)
        except Error as e:
            responseObject = {"message": "Couldn't remove character"}
            return make_response(jsonify(responseObject), 500)
        finally:
            dbConnection.close()
