import tkinter
import tkinter.messagebox as messageBox

class Message:
    def __init__(self) -> None:
        self.__window = tkinter.Tk()
        self.__window.withdraw()
        
        # Application name
        self.__application_name = "EnglishWordsQuiz.exe - Application Error"
    
    # 
    def database_load_failed(self, path: str) -> None:
        # Error message text
        error = f"SQLite3 Error: Failed to connect {path}"
        messageBox.showerror(self.__application_name, error)
        
message = Message()