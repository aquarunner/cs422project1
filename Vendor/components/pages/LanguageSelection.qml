import QtQuick 1.0
import "../common"

SimplePage {
    id: container

    FlickablePage {
        id: languageSelectionArea
        fill: false
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: backButton.top
        anchors.margins: 5
        contentHeight: parent.height
        clip: true


        Column {
            id: languageSelectionColumn
            //y: parent.height / 2
            x: parent.width / 2 - 50
            //anchors.centerIn: parent
            //clip: true
            spacing: 20
            //anchors.horizontalCenter: back.horizontalCenter

            Repeater {
                model: ListModel {
                    id: languageSelectionModel

                    ListElement {
                        language: "English"
                        buttonLabel: "English"
                    }
                    ListElement {
                        language: "Español"
                        buttonLabel: "Español"
                    }
                    ListElement {
                        language: "English"
                        buttonLabel: "中文"
                    }
                    ListElement {
                        language: "English"
                        buttonLabel: "Française"
                    }
                    ListElement {
                        language: "English"
                        buttonLabel: "Deutsch"
                    }
                    ListElement {
                        language: "English"
                        buttonLabel: "한국어"
                    }
                    ListElement {
                        language: "English"
                        buttonLabel: "Suomi"
                    }
                    ListElement {
                        language: "English"
                        buttonLabel: "Czech"
                    }
                    ListElement {
                        language: "English"
                        buttonLabel: "Klingon"
                    }
                    ListElement {
                        language: "English"
                        buttonLabel: "Farci"
                    }
                }


                delegate: OptionButton {
                    id: languageSelectionDelegate
                    //anchors.margins: 5

                    label: buttonLabel

                    onClicked: {
                        settings.preferredLanguage = language;
                        optionsContainer.showPage("OptionsPage");
                    }
                }

            }
        }
    }


    Button {
        id: backButton
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 10
        label: translator.backToOptionsText

        onClicked: {
            //optionsContainer.showPage("OptionsPage");
            container.dismissed();
        }
    }



}
