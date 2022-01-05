import sys

import tkinter
import tkinter.messagebox as messageBox

from PyQt5.QtGui import QGuiApplication

class Message:
    def __init__(self) -> None:
        # Main application.
        self.__application = None
        
        # Message box root.
        self.__window = tkinter.Tk()
        self.__window.withdraw()
        
        # Application name.
        self.__application_name = "EnglishWordsQuiz.exe - Application Error"
    
    # Error message box for database load failed.
    def database_load_failed(self, path: str) -> None:
        # Error message text.
        error = f"SQLite3 Error: Failed to connect {path}"
        messageBox.showerror(self.__application_name, error)
        sys.exit(-1)
        
    # Main application setter property.
    def set_application(self, application: QGuiApplication) -> None:
        self.__application = application
        
message = Message()