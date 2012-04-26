/*
 * File: CurrencySelection.qml
 * Description: Lists available currencies for selection.
 * Author: dyoung24
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0
import "../common"

SimplePage {
    id: container

    Column {
        anchors.fill: parent
        //anchors.horizontalCenter: parent.horizontalCenter


        Item {
            id: filler
            width: parent.width
            height: 20
        }


        OptionText {
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            text: translator.currencyHintText
        }



        GridView {
            id: currencyGridView
            width: container.width
            height: container.height
            clip: true
            cellWidth: container.width / 2
            cellHeight: 80
            model: ListModel { id: currencyListModel }

            Component.onCompleted: {
                dbi.importCurrencies(currencyListModel);
            }

            delegate: Item {
                id: currencyDelegate
                width: currencyGridView.cellWidth
                height: currencyGridView.cellHeight

                SelectionButton {
                    id: currencyButton
                    anchors.centerIn: parent
                    label: code
                    selected: true
                    onClicked: {
                        selected = true;
                        settings.preferredCurrencyCode = code;
                        //optionsContainer.showPage("OptionsPage");
                        container.accepted();
                    }

                }

                Text {
                    //id: name
                    anchors.top: currencyButton.bottom
                    anchors.horizontalCenter: currencyButton.horizontalCenter
                    text: name
                    color: "white"
                }

            }
        }

    }




    Button {
        id: complaintButton
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 10
        fontSize: 9
        fontBold: true
        label: translator.complaintMessageText

        onClicked: {
            //playArea.showPage("Complaints");
            //helpPage.showBack();
        }
    }



    Button {
        id: closeButton
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 10
        width: 140
        label: translator.closeText

        onClicked: {
            //optionsContainer.showPage("OptionsPage");
            container.dismissed();
        }
    }

}
