import sys
import os

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject

class Window(QObject):
    def __init__(self):
        QObject.__init__(self)

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    
    # Get context
    main = Window()
    engine.rootContext().setContextProperty("backend", main)
    
    # Set app extra info
    app.setOrganizationName("Glory Day")
    app.setOrganizationDomain("Republic of Korea")
    
    #Load qml file
    engine.load(os.path.join(os.path.dirname(__file__), "main.qml"))
    
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())