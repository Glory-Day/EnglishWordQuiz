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
    title: qsTr("LOADING")

    // Remove title bar
    flags: Qt.Window | Qt.FramelessWindowHint

    ProgressBar {
        text: "% loaded..."
        progressColor: "#4A96D9"
        progressWidth: 16
        strokeWidth: 6
        imageUrl: "../resources/application_logo.png"
        isRound: true
        isShadow: true
        // TODO: Change 'value' to get 'backend'
        value: slider.value
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Slider {
        id: slider
        to: 100
        value: 30
    }

    Connections {
        target: backend
    }
}
