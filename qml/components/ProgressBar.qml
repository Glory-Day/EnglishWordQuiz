import QtQuick 2.15
import QtQuick.Shapes 1.15
import QtGraphicalEffects 1.15

Item {
    id: progressBar
    implicitWidth: 250
    implicitHeight: 250

    // Properties
    // General
    property bool isRound: true
    property int defaultAngle: -90
    property real maxValue: 100
    property real value: 50
    property int samples: 12

    // Drop Shadow
    property bool isShadow: false
    property color shadowColor: "#000000"
    property int shadowRadius: 10

    // Background Circle
    property color backgroundColor: "transparent"
    property color strokeColor: "#7e7e7e"
    property int strokeWidth: 16

    // Progress Circle
    property color progressColor: "#55aaff"
    property int progressWidth: 16

    // Text
    property string text: "%"
    property bool textShowValue: true
    property string textFontFamily: "Segoe UI"
    property int textSize: 12
    property color textColor: "#FFFFFF"

    // Internal Properties/Functions
    QtObject{
        id: internal

        property Component dropShadow: DropShadow{
            color: progressBar.shadowColor
            fast: true
            verticalOffset: 0
            horizontalOffset: 0
            samples: progressBar.samples
            radius: progressBar.shadowRadius
        }
    }

    Shape {
        id: shape
        anchors.fill: parent
        layer.enabled: true
        layer.samples: progressBar.samples
        layer.effect: progressBar.isShadow ? internal.dropShadow : null

        ShapePath {
            id: pathBG
            fillColor: progressBar.backgroundColor
            strokeColor: progressBar.strokeColor
            strokeWidth: progressBar.strokeWidth
            capStyle: progressBar.isRound ? ShapePath.RoundCap : ShapePath.FlatCap

            PathAngleArc {
                radiusX: (progressBar.width / 2) - (progressBar.progressWidth / 2)
                radiusY: (progressBar.height / 2) - (progressBar.progressWidth / 2)
                centerX: progressBar.width / 2
                centerY: progressBar.height / 2
                startAngle: progressBar.defaultAngle
                sweepAngle: 360
            }
        }

        ShapePath {
            id: path
            fillColor: "transparent"
            strokeColor: progressBar.progressColor
            strokeWidth: progressBar.progressWidth
            capStyle: progressBar.isRound ? ShapePath.RoundCap : ShapePath.FlatCap

            PathAngleArc {
                radiusX: (progressBar.width / 2) - (progressBar.progressWidth / 2)
                radiusY: (progressBar.height / 2) - (progressBar.progressWidth / 2)
                centerX: progressBar.width / 2
                centerY: progressBar.height / 2
                startAngle: progressBar.defaultAngle
                sweepAngle: (360 / progressBar.maxValue * progressBar.value)
            }
        }

        Text {
            id: textProgress
            text: progressBar.textShowValue ? parseInt(progressBar.value) + progressBar.text : progressBar.text
            color: progressBar.textColor
            font.pointSize: progressBar.textSize
            font.family: progressBar.textFontFamily
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}