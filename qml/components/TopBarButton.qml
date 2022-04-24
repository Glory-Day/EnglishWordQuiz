import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: topBarButton

    //General Properties
    property url iconPath: ""

    //Color Properties
    property color backgroundColor: "#00000000"

    //Opacity Properties
    property real opacityDown: 1
    property real opacityHovered: 0.5

    QtObject {
        id: internal

        property var dynamicOpacity: if (topBarButton.down) {
                                         topBarButton.down ? opacityDown : opacityHovered
                                     } else {
                                         topBarButton.hovered ? opacityHovered : 0
                                     }
    }

    width: 16
    height: 16

    //Background Component
    background: Rectangle {
        id: background
        color: backgroundColor
        radius: 15

        //Icon Image Component
        Image {
            id: icon
            width: 10
            height: 10
            source: iconPath
            fillMode: Image.PreserveAspectFit
            visible: true
            opacity: internal.dynamicOpacity
            antialiasing: true
            anchors {
                verticalCenter: background.verticalCenter
                horizontalCenter: background.horizontalCenter
            }
        }
    }
}