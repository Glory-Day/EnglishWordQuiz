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

        //Type Mode Selection Background Component
        Rectangle {
            id: typeModeSelectionBackground
            color: "#212121"
            width: 530
            height: 160
            radius: 15
            anchors {
                top: background.top
                topMargin: 170
                horizontalCenter: background.horizontalCenter
            }

            //Type Mode Selection Text Background Component
            Rectangle {
                id: typeModeSelectionTextBackground
                color: "#00000000"
                width: 490
                height: 50
                anchors {
                    top: typeModeSelectionBackground.top
                    topMargin: 20
                    horizontalCenter: typeModeSelectionBackground.horizontalCenter
                }

                //Type Mode Selection Text Component
                Text {
                    id: typeModeSelectionText
                    color: "#DCDCDC"
                    text: qsTr("Language Type Select")
                    font {
                        bold: true
                        family: "JetBrainsMono NF Medium"
                        pointSize: 18
                    }
                    anchors {
                        verticalCenter: typeModeSelectionTextBackground.verticalCenter
                        horizontalCenter: typeModeSelectionTextBackground.horizontalCenter
                    }
                }
            }

            //Type Mode Selection Buttons Component
            Row {
                id: typeModeSelectionButtons
                width: 490
                height: 50
                spacing: 20
                anchors {
                    top: typeModeSelectionTextBackground.bottom
                    topMargin: 20
                    horizontalCenter: typeModeSelectionBackground.horizontalCenter
                }

                //Type Mode Selection Button Component For Select Only Korean Mode
                TextButton {
                    id: onlyKoreanModeButton
                    buttonWidth: 150
                    buttonHeight: 50
                    buttonName: qsTr("Only Ko")
                    buttonTextSize: 18
                }

                //Type Mode Selection Button Component For Select Only English Mode
                TextButton {
                    id: onlyEnglishModeButton
                    buttonWidth: 150
                    buttonHeight: 50
                    buttonTextSize: 18
                    buttonName: qsTr("Only Eng")
                }

                //Type Mode Selection Button Component For Select Random Mode
                TextButton {
                    id: randomLanguageModeButton
                    buttonWidth: 150
                    buttonHeight: 50
                    buttonName: qsTr("Random")
                    buttonTextSize: 18
                }
            }
        }

        //Count Mode Selection Background Component
        Rectangle {
            id: countModeSelectionBackground
            color: "#212121"
            width: 530
            height: 160
            radius: 15
            anchors {
                top: typeModeSelectionBackground.bottom
                topMargin: 20
                horizontalCenter: typeModeSelectionBackground.horizontalCenter
            }

            //Count Mode Selection Text Background Component
            Rectangle {
                id: countModeSelectionTextBackground
                color: "#00000000"
                width: 490
                height: 50
                anchors {
                    top: countModeSelectionBackground.top
                    topMargin: 20
                    horizontalCenter: countModeSelectionBackground.horizontalCenter
                }

                //Count Mode Selection Text Component
                Text {
                    id: countModeSelectionText
                    color: "#DCDCDC"
                    text: qsTr("Language Select")
                    font {
                        bold: true
                        family: "JetBrainsMono NF Medium"
                        pointSize: 18
                    }
                    anchors {
                        verticalCenter: countModeSelectionTextBackground.verticalCenter
                        horizontalCenter: countModeSelectionTextBackground.horizontalCenter
                    }
                }
            }

            //Count Mode Selection Buttons Component
            Row {
                id: countModeSelectionButtons
                width: 490
                height: 50
                spacing: 20
                anchors {
                    top: countModeSelectionTextBackground.bottom
                    topMargin: 20
                    horizontalCenter: countModeSelectionBackground.horizontalCenter
                }

                //Count Mode Selection Button Component For Select Tag Mode
                TextButton {
                    id: tagModeButton
                    buttonWidth: 150
                    buttonHeight: 50
                    buttonName: qsTr("Only Ko")
                    buttonTextSize: 18
                }

                //Count Mode Selection Button Component For Select Random Mode
                TextButton {
                    id: randomModeButton
                    buttonWidth: 150
                    buttonHeight: 50
                    buttonTextSize: 18
                    buttonName: qsTr("Only Eng")
                }

                //Count Mode Selection Button Component For Select All Mode
                TextButton {
                    id: allModeButton
                    buttonWidth: 150
                    buttonHeight: 50
                    buttonName: qsTr("Random")
                    buttonTextSize: 18
                }
            }
        }
    }
}