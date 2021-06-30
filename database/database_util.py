from sqlite3.dbapi2 import Connection
from typing import Dict, Tuple, Union
from flask import g, json
import sqlite3


class DatabaseUtils():
    """
        Util class to ease database tasks
    """
    DATABASE = './database.sqlite'

    def __init__(self, dbName: str = "") -> None:
        if dbName != "":
            self.DATABASE = dbName

    def get_db(self) -> Connection:
        """Returns database object

        Returns:
            sqlite3db: database object flask is connected to
        """
        db = getattr(g, '_database', None)
        if db is None:
            db = g._database = sqlite3.connect(self.DATABASE)
        return db

    @staticmethod
    def query_db(database: Connection, query: str, args=(), one=False):
        """Queries database for data

        Args:
            query (str): query string with select
            args (tuple, optional): arguments for query. Defaults to ().
            one (bool, optional): wheather to return first queried element or all of them. Defaults to False.

        Returns:
            tuple|dict: data returned from database
        """
        cur = database.execute(query, args)
        rv = [dict((cur.description[i][0], value)
                   for i, value in enumerate(row)) for row in cur.fetchall()]
        cur.close()
        if rv:
            return rv[0]if one else rv
        else:
            return None

    @staticmethod
    def modify_db(database: Connection, query: str, args=()) -> str:
        """Modifies database (inserts,updates,deletes)

        Args:
            query (str): query string of command to execute onto database
            args (tuple, optional): tuple of arguments for query. Defaults to ().

        Returns:
            int: id of last modified row
        """
        cur = database.execute(query, args)
        last_row_id = cur.lastrowid
        database.commit()
        print(last_row_id)
        return last_row_id
