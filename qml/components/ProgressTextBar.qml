import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Item {
    //Properties
    property url iconPath: ""
    property string message: ""
    property int iconWidth: 30
    property int iconHeight: 30

    width: 720
    height: 50

    //Background Component
    Rectangle {
        id: background
        width: 720
        height: 50
        color: "#1C1C1C"
        radius: 15

        //Icon Background Component
        Rectangle {
            id: iconBackground
            width: 40
            height: 40
            color: "#00000000"
            anchors {
                left: background.left
                leftMargin: 5
                verticalCenter: background.verticalCenter
            }

            //Icon Component
            Image {
                id: icon
                width: iconWidth
                height: iconHeight
                source: iconPath
                smooth: true
                antialiasing: true
                anchors {
                    verticalCenter: iconBackground.verticalCenter
                    horizontalCenter: iconBackground.horizontalCenter
                }
            }
        }

        //Text Background Component
        Rectangle {
            id: textBackground
            width: 670
            height: 40
            radius: 10
            color: "#292929"
            anchors {
                left: iconBackground.right
                right: background.right
                leftMargin: 5
                rightMargin: 5
                verticalCenter: background.verticalCenter
            }

            //TODO: You need to fix it!

            //Text Component
            Text {
                id: messageText
                text: message
                color: "#DCDCDC"
                font {
                    bold: true
                    family: "JetBrainsMono NF Medium"
                    pointSize: 15
                }
                anchors {
                    verticalCenter: textBackground.verticalCenter
                    horizontalCenter: textBackground.horizontalCenter
                }
            }
        }
    }
}