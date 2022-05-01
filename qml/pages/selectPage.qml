import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15
import "../components"

Item {
    //Background Component
    Rectangle {
        id: background
        width: 980
        height: 680
        color: "#00000000"

        Rectangle {
            id: optionsBackground
            width: 600
            height: 260
            color: "#212121"
            radius: 15
            anchors {
                top: background.top
                topMargin: 120
                horizontalCenter: background.horizontalCenter
            }

            Column {
                id: languageOptions
                width: 560
                height: 70
                spacing: 10
                anchors {
                    top: optionsBackground.top
                    topMargin: 20
                    horizontalCenter: optionsBackground.horizontalCenter
                }

                Text {
                    id: languageOptionsText
                    text: qsTr("Selete Language Option")
                    color: "#DCDCDC"
                    font {
                        bold: true
                        family: "JetBrainsMono NF Medium"
                        pointSize: 10
                    }
                    anchors {
                        left: languageOptions.left
                    }
                }

                ComboBox {
                    id: languageOptionComboBox
                    width: 560
                    height: 50
                    model: ["Only Korean", "Only English", "Random Language"]
                }
            }

            Column {
                id: modeOptions
                width: 560
                height: 130
                spacing: 10
                anchors {
                    top: languageOptions.bottom
                    topMargin: 20
                    horizontalCenter: optionsBackground.horizontalCenter
                }

                Text {
                    id: modeOptionsText
                    text: qsTr("Selete Mode Option")
                    color: "#DCDCDC"
                    font {
                        bold: true
                        family: "JetBrainsMono NF Medium"
                        pointSize: 10
                    }
                    anchors {
                        left: modeOptions.left
                    }
                }

                ComboBox {
                    id: modeOptionComboBox
                    width: 560
                    height: 50
                    model: ["Select Mode", "All Mode"]
                }

                Row {
                    width: 560
                    height: 50
                    spacing: 20

                    Slider {
                        id: modeOptionSlider
                        width: 470
                        height: 50
                        from: 1
                        to: 100
                        value: 1
                        snapMode: Slider.SnapAlways
                        stepSize: 1
                    }

                    Rectangle {
                        id: modeOptionSliderValueBackground
                        width: 70
                        height: 50
                        color: "#333333"
                        radius: 15

                        Text {
                            id: modeOptionSliderValue
                            text: modeOptionSlider.value
                            color: "#DCDCDC"
                            font {
                                bold: true
                                family: "JetBrainsMono NF Medium"
                                pointSize: 15
                            }
                            anchors {
                                verticalCenter: modeOptionSliderValueBackground.verticalCenter
                                horizontalCenter: modeOptionSliderValueBackground.horizontalCenter
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            id: buttonBackground
            width: 600
            height: 160
            color: "#212121"
            radius: 15
            anchors {
                top: optionsBackground.bottom
                topMargin: 20
                horizontalCenter: background.horizontalCenter
            }

            Column {
                width: 440
                height: 120
                spacing: 20
                anchors {
                    top: buttonBackground.top
                    left: buttonBackground.left
                    topMargin: 20
                    leftMargin: 20
                }

                Rectangle {
                    id: seletedLanguageTextBackground
                    width: 420
                    height: 50
                    color: "#333333"
                    radius: 15

                    Text {
                        id: seletedLanguageText
                        text: qsTr("Seleted Language Text")
                        color: "#DCDCDC"
                        font {
                            bold: true
                            family: "JetBrainsMono NF Medium"
                            pointSize: 15
                        }
                        anchors {
                            verticalCenter: seletedLanguageTextBackground.verticalCenter
                            horizontalCenter: seletedLanguageTextBackground.horizontalCenter
                        }
                    }
                }

                Rectangle {
                    id: seletedModeTextBackground
                    width: 420
                    height: 50
                    color: "#333333"
                    radius: 15

                    Text {
                        id: seletedModeText
                        text: qsTr("Seleted Mode Text")
                        color: "#DCDCDC"
                        font {
                            bold: true
                            family: "JetBrainsMono NF Medium"
                            pointSize: 15
                        }
                        anchors {
                            verticalCenter: seletedModeTextBackground.verticalCenter
                            horizontalCenter: seletedModeTextBackground.horizontalCenter
                        }
                    }
                }
            }

            TextButton {
                id: nextButton
                buttonWidth: 120
                buttonHeight: 120
                buttonName: qsTr("OK")
                buttonTextSize: 20
                anchors {
                    top: buttonBackground.top
                    right: buttonBackground.right
                    topMargin: 20
                    rightMargin: 20
                }
            }
        }
    }   
}