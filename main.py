import sys
import os

from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine

from utility.database import Database

class Window():
    pass

if __name__ == "__main__":
    
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    
    database = Database("")
    
    # Get Context
    window = Window()
    engine.rootContext().setContextProperty("backend", window)
    
    # Load QML File
    engine.load(os.path.join(os.path.dirname(__file__), "qml/progress.qml"))
    
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())