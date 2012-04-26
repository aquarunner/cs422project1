import QtQuick 1.0
import "../common"

SimplePage {
    id: container

    FlickablePage {
        id: optionsFlickable
        fill: false
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: moreImage.top
        clip: true
        contentHeight: optionsColumn.height// * 1.1//parent.height * 1.5


        Column {
            id: optionsColumn
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            property int optionItemHeight: 100
            property int optionDescWidth: parent.width * 0.7
            property int optionValueWidth: parent.width * 0.3
            spacing: 5


            Item {
                id: filler
                width: parent.width
                height: 20
            }


            Text {
                text: translator.preferencesText
                font.bold: true
                font.pointSize: settings.canvasPointSize
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
            }




            Item {
                id: spacer
                height: optionsColumn.optionItemHeight / 3
                width: parent.width
            }


            // Each row has a pair of elemens.  Option description and option value
            Row {
                width: parent.width
                spacing: 5

                Item {
                    width: optionsColumn.optionDescWidth
                    height: optionsColumn.optionItemHeight


                    OptionText {
                        text: translator.languageText
                    }
                }
                Item {
                    width: optionsColumn.optionValueWidth
                    height: optionsColumn.optionItemHeight



                    OptionButton {
                        label: settings.preferredLanguage

                        onClicked: {
                            optionsContainer.showPage("LanguageSelection");
                        }
                    }



                }
            }








            Row {
                width: parent.width
                spacing: 5

                Item {
                    width: optionsColumn.optionDescWidth
                    height: optionsColumn.optionItemHeight


                    OptionText {
                        text: translator.currencyText
                    }
                }
                Item {
                    width: optionsColumn.optionValueWidth
                    height: optionsColumn.optionItemHeight



                    OptionButton {
                        label: settings.preferredCurrencyCode
                        onClicked: {

                            optionsContainer.showPage("CurrencySelection");
                        }
                    }



                }
            }

















            Row {
                width: parent.width
                spacing: 5

                Item {
                    width: optionsColumn.optionDescWidth
                    height: optionsColumn.optionItemHeight


                    OptionText {
                        text: translator.restrictedItemsText
                    }

                }
                Item {
                    width: optionsColumn.optionValueWidth
                    height: optionsColumn.optionItemHeight



                    OptionButton {
                        label: settings.restrictedItems ? translator.setText : translator.notSetText
                        onClicked: {
                            optionsContainer.showPage("AllergenSelection");
                        }
                    }




                }
            }










            Row {
                width: parent.width
                spacing: 5

                Item {
                    width: optionsColumn.optionDescWidth
                    height: optionsColumn.optionItemHeight


                    OptionText {
                        text: translator.paymentMethodText
                    }

                }
                Item {
                    width: optionsColumn.optionValueWidth
                    height: optionsColumn.optionItemHeight



                    OptionButton {
                        label: settings.storedCCNumber ? translator.setText : translator.notSetText
                        onClicked: {
                            optionsContainer.showPage("PaymentForm");
                        }
                    }




                }
            }






            Row {
                width: parent.width
                spacing: 5

                Item {
                    width: optionsColumn.optionDescWidth
                    height: optionsColumn.optionItemHeight


                    OptionText {
                        text: translator.purchaseHistoryText
                    }

                }
                Item {
                    width: optionsColumn.optionValueWidth
                    height: optionsColumn.optionItemHeight



                    OptionButton {
                        label: translator.clearText

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
                        width: optionsColumn.width * 0.7
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





    Image {
        id: moreImage
        source: "../images/down.png"
        anchors.bottom: optionsBackButton.top
        anchors.bottomMargin: 5
        anchors.left: parent.left
        visible: !optionsFlickable.atYEnd
    }


    Button {
        id: optionsBackButton
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 10
        label: translator.backToItemsText

        onClicked: {
            playArea.showPage("Items");
        }
    }
}
