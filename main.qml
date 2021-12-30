import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Dialogs 1.3

// Main window
Window {
    id: window
    width: 1280
    height: 720
    visible: true
    color: "#00000000"

    // Remove title bar
    flags: Qt.Window | Qt.FramelessWindowHint

    // Background of main page
    Rectangle {
        id: background
        radius: 20
        color: "#151515"
        anchors.fill: parent
        z: 1

        // Application title bar
        Rectangle {
            id: titleBar
            height: 30
            color: "#151515"
            anchors.left: background.left
            anchors.right: background.right
            anchors.top: background.top
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0

            DragHandler {
                onActiveChanged: {
                    if(active) {
                        window.startSystemMove()
                    }
                }
            }
        }
    }
}