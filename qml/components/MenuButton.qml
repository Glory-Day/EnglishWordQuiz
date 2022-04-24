import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: menuButton

    //Properties
    property url iconPath: ""
    property string buttonName: ""
    property color backgroundDefaultColor: "#00FFFFFF"
    property color backgroundDownColor: "#12FFFFFF"
    property color backgroundHoveredColor: "#0DFFFFFF"
    property color backgroundVisitedColor: "#12FFFFFF"
    property bool isVisited: false

    QtObject {
        id: internal

        property var dynamicColor: if (menuButton.down) {
                                       menuButton.down ? backgroundDownColor : backgroundHoveredColor
                                   } else {
                                       menuButton.hovered ? backgroundHoveredColor : backgroundDefaultColor
                                   }
    }

    width: 250
    height: 50

    //Background Component
    background: Rectangle {
        id: background
        color: isVisited ? backgroundVisitedColor : internal.dynamicColor
        radius: 10

        //Icon Image Component
        Image {
            id: icon
            width: 30
            height: 30
            source: iconPath
            smooth: true
            fillMode: Image.PreserveAspectFit
            antialiasing: true
            anchors {
                left: background.left
                leftMargin: 10
                verticalCenter: background.verticalCenter
            }
        }

        //Name Component
        Text {
            id: name
            text: buttonName
            color: "#DCDCDC"
            font {
                bold: true
                family: "JetBrainsMono NF Medium"
                pointSize: 18
            }
            anchors {
                left: icon.right
                leftMargin: 15
                verticalCenter: background.verticalCenter
            }
        }
    }
}