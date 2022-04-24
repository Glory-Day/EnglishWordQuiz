import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: textButton

    //Button Properties
    property string buttonName: ""
    property int buttonWidth: 0
    property int buttonHeight: 0
    property int buttonTextSize: 0

    //Color Properties
    property color backgroundDefaultColor: "#1e90ff"
    property color backgroundHoveredColor: "#4ca5ff"
    property color backgroundDownColor: "#65b3ff"
    property bool isVisited: false

    QtObject {
        id: internal

        property var dynamicColor: if (textButton.down) {
                                       textButton.down ? backgroundDownColor : backgroundHoveredColor
                                   } else {
                                       textButton.hovered ? backgroundHoveredColor : backgroundDefaultColor
                                   }
    }

    width: buttonWidth
    height: buttonHeight

    //Background Component
    background: Rectangle {
        id: background
        color: internal.dynamicColor
        width: buttonWidth
        height: buttonHeight
        radius: 15

        //Text Component
        Text {
            id: text
            text: buttonName
            color: "#DCDCDC"
            font {
                bold: true
                family: "JetBrainsMono NF Medium"
                pointSize: buttonTextSize
            }
            anchors {
                verticalCenter: background.verticalCenter
                horizontalCenter: background.horizontalCenter
            }
        }
    }
}