import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15
import "components"

//Main Window Component
Window {
    id: window
    width: 1280
    height: 720
    visible: true
    color: "#00000000"
    title: qsTr("English Words Quiz - Python Version")

    //Remove Title Bar
    flags: Qt.Window | Qt.FramelessWindowHint

    //Background Component
    Rectangle {
        id: background
        color: "#292929"
        radius: 15
        anchors.fill: parent
        z: 1

        //Menu Background Component
        Rectangle {
            id: menuBackground
            width: 300
            height: 720
            color: "#00000000"
            anchors {
                top: background.top
                bottom: background.bottom
                left: background.left
            }

            //Menu Left Background Component
            Rectangle {
                id: leftPart
                width: 300
                height: 720
                radius: 15
                color: "#333333"
                anchors.fill: menuBackground
            }

            //Menu Right Background Component
            Rectangle {
                id: rightPart
                width: 150
                height: 720
                color: "#333333"
                anchors {
                    top: menuBackground.top
                    bottom: menuBackground.bottom
                    right: menuBackground.right
                }
            }
        }

        //Top Bar Component
        Rectangle {
            id: topBar
            width: 1280
            height: 40
            color: "#00000000"
            anchors {
                top: background.top
                left: background.left
                right: background.right
            }

            //Top Bar Button Component To Close Application
            TopBarButton {
                id: closeButton
                iconPath: "../resources/close_icon.png"
                backgroundColor: "#FF6666"
                anchors {
                    left: topBar.left
                    leftMargin: 25
                    verticalCenter: topBar.verticalCenter
                }
                onClicked: window.close()
            }


            //Top Bar Button Component To Minimize Application
            TopBarButton {
                id: minimizeButton
                iconPath: "../resources/minimize_icon.png"
                backgroundColor: "#FFC300"
                anchors {
                    left: closeButton.left
                    leftMargin: 25
                    verticalCenter: topBar.verticalCenter
                }
                onClicked: window.showMinimized()
            }

            //DragHandler To Move Main Window
            DragHandler {
                onActiveChanged: if (active) {
                    window.startSystemMove()
                }
            }
        }

        //Menu Button Column Component
        Column {
            id: menuButtons
            spacing: 5
            anchors {
                top: topBar.bottom
                topMargin: 30
                horizontalCenter: menuBackground.horizontalCenter
            }

            //Menu Button For Home Page
            MenuButton {
                id: homeButton
                iconPath: "../resources/home.png"
                buttonName: qsTr("Home")
                isVisited: true
            }

            //Menu Button For Quiz Page
            MenuButton {
                id: quizButton
                iconPath: "../resources/quiz.png"
                buttonName: qsTr("Quiz")
            }

            //Menu Button For Database Page
            MenuButton {
                id: databaseButton
                iconPath: "../resources/database.png"
                buttonName: qsTr("Database")
            }

            //Menu Button For History Page
            MenuButton {
                id: historyButton
                iconPath: "../resources/history.png"
                buttonName: qsTr("History")
            }

            //Menu Button For Settings Page
            MenuButton {
                id: settingsButton
                iconPath: "../resources/settings.png"
                buttonName: qsTr("Settings")
            }
        }

        //Contents Column
        Rectangle {
            id: contents
            color: "#00000000"
            clip: true
            anchors {
                top: topBar.bottom
                bottom: background.bottom
                left: menuBackground.right
                right: background.right
                topMargin: 0
                bottomMargin: 0
                leftMargin: 0
                rightMargin: 0
            }

            //Loader Component To Load Page
            Loader {
                id: loader
                anchors.fill: contents
                source: Qt.resolvedUrl("pages/selectPage.qml")
            }
        }
    }
}