/*
 * File: PaymentForm.qml
 * Description: Displays the user input fields for credit card info
 * Author: dyoung24
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0
import "../common"

SimplePage {
    id: container

    property string parentPage: ""

    onVisibleChanged: {
        if (container.visible) {
            saveButton.selected = container.parentPage !== "Items";

            if (settings.paymentNumber) {
                paymentName.input = settings.paymentName;
                paymentCVV.input = settings.paymentCVV;
                paymentExpiry.input = settings.paymentExpiry;
                paymentNumber.input = settings.paymentNumber;

            } else {
                paymentName.input = "";
                paymentCVV.input = "";
                paymentExpiry.input = "";
                paymentNumber.input = "";
            }
        }

    }

    SimplePage {
        id: formArea
        fill: false
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: closeButton.top
        anchors.margins: 5


        Column {
            anchors.fill: parent
            spacing: 10

            Item {
                id: filler
                width: parent.width
                height: 50


                OptionText {
                    text: translator.paymentFormHintText
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    anchors.top: parent.top
                    anchors.topMargin: 20
                }
            }

            TextBox {
                id: paymentName
                width: parent.width * 0.9
                anchors.leftMargin: 20
                anchors.left: parent.left
                exampleText: "John Doe"
                input: settings.paymentName
            }

            Text {
                anchors.left: parent.left
                anchors.leftMargin: 20
                text: translator.paymentNameText
                font.bold: true
                color: "white"

            }




            TextBox {
                id: paymentNumber
                width: parent.width * 0.9
                anchors.leftMargin: 20
                anchors.left: parent.left
                exampleText: "4086 2222 1234 7890"
                input: settings.paymentNumber
            }

            Text {
                anchors.left: parent.left
                anchors.leftMargin: 20
                text: translator.paymentNumberText
                font.bold: true
                color: "white"
            }




            TextBox {
                id: paymentExpiry
                width: parent.width * 0.9
                anchors.leftMargin: 20
                anchors.left: parent.left
                exampleText: "01/13"
                input: settings.paymentExpiry
            }

            Text {
                anchors.left: parent.left
                anchors.leftMargin: 20
                text: translator.paymentExpiryText
                font.bold: true
                color: "white"
            }




            TextBox {
                id: paymentCVV
                width: parent.width * 0.9
                anchors.leftMargin: 20
                anchors.left: parent.left
                exampleText: "123"
                input: settings.paymentCVV
            }

            Text {
                anchors.left: parent.left
                anchors.leftMargin: 20
                text: translator.paymentCVVText
                font.bold: true
                color: "white"
            }


            SelectionButton {
                id: saveButton
                label: translator.saveText
                anchors.horizontalCenter: parent.horizontalCenter
                visible: container.parentPage === "Items"

            }
        }

    }

    Button {
        id: resetButton
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 10
        width: 100
        label: translator.resetText

        onClicked: {
            //notificationPop.show(playArea.currentPage);

            paymentName.input = "";
            paymentCVV.input = "";
            paymentExpiry.input = "";
            paymentNumber.input = "";
        }
    }

    Button {
        id: cancelButton
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 10
        width: 100
        label: translator.cancelText

        onClicked: {
            container.dismissed();
        }
    }


    Button {
        id: closeButton
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 10
        width: 100
        //visible: paymentNumber.input
        label: container.parentPage === "Items" ? translator.continueText : translator.saveText

        onClicked: {
            //notificationPop.show(playArea.currentPage);

            if (saveButton.selected) {
                //saveButton.selected = false;
                settings.paymentName = paymentName.input;
                settings.paymentCVV = paymentCVV.input;
                settings.paymentExpiry = paymentExpiry.input;
                settings.paymentNumber = paymentNumber.input;
            }

            container.accepted()
        }
    }

}
