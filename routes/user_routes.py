from datetime import datetime
import json
from sqlite3.dbapi2 import Error
import bcrypt
from flask import current_app
from flask.cli import with_appcontext
from flask.helpers import make_response
from flask.wrappers import Response
from flask_jwt_extended.utils import get_jwt
from flask_jwt_extended.view_decorators import jwt_required
from database.database_util import DatabaseUtils
from flask.globals import request
from model.user import RUser
from flask.json import jsonify
from flask.blueprints import Blueprint
from bcrypt import hashpw, checkpw
from markupsafe import escape
from flask_jwt_extended import create_access_token

"""
    Flask blueprint containing user management routes
"""
users = Blueprint('users', __name__, None)


@with_appcontext
@users.route('/users/register', methods=["POST"])
def register_user() -> Response:
    """Register endpoint allowing to create new users

    Request Body:
        {username:str, password:str}

    Raises:
        Error: database error

    Returns:
        Response: response object with information on user creation
    """
    db = DatabaseUtils(current_app.config.get("DATABASE"))
    postData = request.get_json()
    dbConnection = db.get_db()
    queryCheck = 'select username from user where username=?'
    queryRegister = 'insert into user(username, hash) values(?,?)'
    queriedUser = DatabaseUtils.query_db(
        dbConnection, queryCheck, (postData.get('username'),))
    if queriedUser:
        responseObject = {"message": "There's already user with that username"}
        return make_response(jsonify(responseObject), 400)
    try:
        user = RUser(postData.get('username'), postData.get('password'))
        passwordHash = hashpw(bytes(user.password, 'utf-8'),
                              bcrypt.gensalt(12))
        addedId = DatabaseUtils.modify_db(
            dbConnection, queryRegister, (escape(user.username), passwordHash,))
        if addedId:
            responseObject = {"message": "Created user"}

            return make_response(jsonify(responseObject), 201)
        else:
            raise Error("User not created")
    except BaseException as _:
        responseObject = {"message": "Couldn't create user"}

        return make_response(jsonify(responseObject), 500)
    finally:
        dbConnection.close()


@with_appcontext
@users.route('/users/login', methods=["POST"])
def login_user() -> Response:
    """Login endpoint allowing users to login to new session

    Request Body:
        {username:str, password:str}

    Returns:
        Response: response object with error info on failure and jwt token on succes
    """
    db = DatabaseUtils(current_app.config.get("DATABASE"))
    postData = request.get_json()
    dbConnection = db.get_db()
    query = 'select id,hash from user where username=?'
    user = RUser(escape(postData.get('username')),
                 escape(postData.get('password')))
    passwordHash = DatabaseUtils.query_db(
        dbConnection, query, (escape(user.username),), True)
    dbConnection.close()
    if not passwordHash:
        responseObject = {"message": "User not found"}
        return make_response(jsonify(responseObject), 404)
    isHashValid = checkpw(bytes(user.password, 'utf-8'), passwordHash['hash'])
    if not isHashValid:
        responseObject = {"message": "Wrong password"}
        return make_response(jsonify(responseObject), 401)
    additionalClaims = {"userId": passwordHash['id']}
    token = create_access_token(
        identity=user.username, additional_claims=additionalClaims)
    responseObject = {
        "message": "Logged in succesfully", "token": token}
    return make_response(jsonify(responseObject), 200)


@with_appcontext
@users.route('/users/logout', methods=["DELETE"])
@jwt_required()
def logout_user():
    """Logouts user, revokes it's token

    Raises:
        Error: database error

    Returns:
        Response: response object with error info or succes message
    """
    jti = get_jwt()["jti"]
    now = datetime.utcnow()
    query = 'insert into token_blacklist(jti, created_at) values (?,?)'
    try:
        dbConnection = DatabaseUtils(
            current_app.config.get("DATABASE")).get_db()
        tokenId = DatabaseUtils.modify_db(dbConnection, query, (jti, now,))
        if tokenId:
            responseObject = {"message": "Token revoked"}
            return make_response(jsonify(responseObject), 200)
        else:
            raise Error("Error while revoking token")
    except Error as e:
        responseObject = {
            "message": "Something went wrong while revoking token"}
        return make_response(jsonify(responseObject), 500)
    finally:
        dbConnection.close()
