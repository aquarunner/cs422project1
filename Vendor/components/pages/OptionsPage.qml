import QtQuick 1.0
import "../common"

FlickablePage {
    id: container
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 5
    contentHeight: optionsContainer.height * 1.1//parent.height * 1.5


    Column {
        id: optionsContainer
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        property int optionItemHeight: 100
        property int optionDescWidth: parent.width * 0.7
        property int optionValueWidth: parent.width * 0.3
        spacing: 5




        Text {
            text: translator.preferencesText
            font.bold: true
            font.pointSize: settings.canvasPointSize
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
        }




        Item {
            id: spacer
            height: optionsContainer.optionItemHeight / 3
            width: parent.width
        }


        // Each row has a pair of elemens.  Option description and option value
        Row {
            width: parent.width
            spacing: 5

            Item {
                width: optionsContainer.optionDescWidth
                height: optionsContainer.optionItemHeight


                OptionText {
                    text: translator.languageText
                }
            }
            Item {
                width: optionsContainer.optionValueWidth
                height: optionsContainer.optionItemHeight



                OptionButton {
                    label: settings.preferredLanguage
                }



            }
        }








        Row {
            width: parent.width
            spacing: 5

            Item {
                width: optionsContainer.optionDescWidth
                height: optionsContainer.optionItemHeight


                OptionText {
                    text: translator.currencyText
                }
            }
            Item {
                width: optionsContainer.optionValueWidth
                height: optionsContainer.optionItemHeight



                OptionButton {
                    label: settings.preferredCurrencyCode
                }



            }
        }

















        Row {
            width: parent.width
            spacing: 5

            Item {
                width: optionsContainer.optionDescWidth
                height: optionsContainer.optionItemHeight


                OptionText {
                    text: translator.restrictedItemsText
                }

            }
            Item {
                width: optionsContainer.optionValueWidth
                height: optionsContainer.optionItemHeight



                OptionButton {
                    label: settings.preferredLanguage
                }




            }
        }










        Row {
            width: parent.width
            spacing: 5

            Item {
                width: optionsContainer.optionDescWidth
                height: optionsContainer.optionItemHeight


                OptionText {
                    text: translator.paymentMethodText
                }

            }
            Item {
                width: optionsContainer.optionValueWidth
                height: optionsContainer.optionItemHeight



                OptionButton {
                    label: qsTr("[ %1 ]").arg(settings.storedCCNumber ? translator.setText : translator.notSetText)
                }




            }
        }






        Row {
            width: parent.width
            spacing: 5

            Item {
                width: optionsContainer.optionDescWidth
                height: optionsContainer.optionItemHeight


                OptionText {
                    text: translator.purchaseHistoryText
                }

            }
            Item {
                width: optionsContainer.optionValueWidth
                height: optionsContainer.optionItemHeight



                OptionButton {
                    label: qsTr("[ %1 ]").arg(translator.clearText)

                    onClicked: {
                        historyListModel.clear();
                        dbi.clearHistory();
                    }
                }




            }
        }





        Column {
            id: historyArea
            anchors.horizontalCenter: parent.horizontalCenter

            onVisibleChanged: {
                if (historyArea.visible) {
                    dbi.importHistory(historyListModel);
                }
            }

            Text {
                id: historyHintText
                text: translator.emptyHistoryText
                color: "white"
                visible: historyListModel.count === 0
            }

            Repeater {
                model: ListModel { id: historyListModel }

                Item {
                    id: historyDelegate
                    width: container.width * 0.7
                    height: 20

                    Row {
                        Text {
                            text: name
                            color: "white"
                            width: 100
                        }
                        Text {
                            text: timestamp
                            color: "white"
                        }
                    }
                }
            }

        }





    }  //  Column






}
