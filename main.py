import sys
import os

from PyQt5.QtGui import QGuiApplication, QIcon
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject

from utility.message import message
from utility.database import Database

class Window(QObject):
    def __init__(self):
        QObject.__init__(self)

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    
    message.set_application(application=app)
    # TODO: Edit code to create instance database class
    
    # Get context
    window = Window()
    engine.rootContext().setContextProperty("backend", window)
    
    # Set application extra infomation
    app.setOrganizationName("Glory Day")
    app.setOrganizationDomain("Republic of Korea")
    
    # Set application icon image
    app.setWindowIcon(QIcon("application_icon.ico"))
    
    # Load QML file
    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))
    
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())