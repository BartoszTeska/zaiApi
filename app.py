from logging import DEBUG
from sqlite3.dbapi2 import Error
from typing import Any

from flask_jwt_extended.jwt_manager import JWTManager
from util_functions import UtilFunctions
from database.database_util import DatabaseUtils
from flask import Flask, g
from flask_cors import CORS
from routes.user_routes import users
from routes.character_routes import characters
"""
Application to store users world of warcraft characters
"""


app = Flask(__name__)
app.config.from_json("./config.json")
cors = CORS(app, resources={r'/*': {'origins': '*'}})
dbUtil = DatabaseUtils(app.config.get("DATABASE"))
util = UtilFunctions()
jwt = JWTManager(app)
with app.app_context():
    app.register_blueprint(users)
    app.register_blueprint(characters)


@app.before_first_request
def init_db():
    with app.app_context():
        db = dbUtil.get_db()
        res = db.execute(
            "select count(*) from sqlite_master where type = 'table' and name != 'sqlite_sequence'")
        result = util.flatmap(lambda x: x, res.fetchall())
        if result[0] == 0:
            with app.open_resource('./database/create.sql', mode='r') as f:
                try:
                    db.cursor().executescript(f.read())
                except Error as e:
                    print(e)

            with app.open_resource('./database/insert_dicts.sql', mode='r') as f:
                try:
                    db.cursor().executescript(f.read())
                except Error as e:
                    print(e)
            db.commit()
        db.close()


@app.teardown_appcontext
def close_db(e: Exception) -> None:
    db = getattr(g, '__database', None)
    if db is not None:
        db.close()


@jwt.token_in_blocklist_loader
def check_if_token_revoked(jwt_header: str, jwt_payload: Any) -> bool:
    jti = jwt_payload["jti"]
    query = 'select jti from token_blacklist where jti=?'
    dbConnection = dbUtil.get_db()
    tokenBlacklist = DatabaseUtils.query_db(dbConnection, query, (jti,), True)
    return tokenBlacklist is not None
