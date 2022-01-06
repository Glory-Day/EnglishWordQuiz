import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15
import "components"

// Main Window Component
Window {
    id: window
    width: 1280
    height: 720
    visible: true
    color: "#00000000"
    title: qsTr("English Words Quiz - Python Version")

    // Remove Title Bar
    flags: Qt.Window | Qt.FramelessWindowHint

    // Background Component
    Rectangle {
        id: background
        color: "#181A26"
        radius: 15
        z: 1
        anchors.fill: parent

        // Top Bar Component
        Rectangle {
            id: topBar
            width: background.width
            height: 30
            color: "#00000000"
            anchors {
                top: background.top
                left: background.left
                right: background.right
            }

            // Top Bar Round Part Component
            Rectangle {
                id: topPart
                width: topBar.width
                height: topBar.height
                color: "#00010D"
                radius: 15
                anchors {
                    fill: topBar
                }
            }

            // Top Bar Rectangle Part Component
            Rectangle {
                id: bottomPart
                width: topBar.width
                height: topBar.height / 2
                color: "#00010D"
                anchors {
                    bottom: topBar.bottom
                    left: topBar.left
                    right: topBar.right
                }
            }

            // DragHandler To Move Main Window
            DragHandler {
                onActiveChanged: if (active) {
                    window.startSystemMove()
                }
            }
        }
    }
}