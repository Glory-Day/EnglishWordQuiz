import sqlite3
import os

from sqlite3 import Error
from utility.message import message


class Database:
    def __init__(self, path: str) -> None:
        """
        Initialize database class.
        Args:
            path (str): Sqlite3 database file path.
        """
        def is_existed() -> bool:
            """
            Check database file existed.

            Returns:
                bool: Returned whether the file exists on the path.
            """
            return os.path.isfile(path=path)
        
        if is_existed():
            # Connect to database file.
            self.__connection = sqlite3.connect(path)
        else:
            # Turn on error message box.
            message.database_load_failed(path=path)
        