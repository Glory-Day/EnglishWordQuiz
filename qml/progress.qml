import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "components"

Window {
    id: progress
    width: 300
    height: 300
    color: "#00000000"
    visible: true
    title: qsTr("LOADING...")

    // Remove title bar
    flags: Qt.Window | Qt.FramelessWindowHint

    ProgressBar {
        text: "% loaded..."
        progressColor: "#ff007f"
        progressWidth: 6
        strokeWidth: 2
        isRound: true
        isShadow: true
        value: slider.value
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Slider {
        id: slider
        to: 100
        value: 30
    }
}
