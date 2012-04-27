/*
 * File: Complaints.qml
 * Author: dyoung24
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0
import "../common"

SimplePage {
    id: container

    SimplePage {
        fill: false
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: closeButton.top
        anchors.margins: 5

        Column {
            anchors.fill: parent
            anchors.topMargin: 20



            TextBox {

            }
            TextBox {

            }
            TextBox {

            }
        }
    }

    Button {
        id: cancelButton
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 10
        width: 140
        label: translator.cancelText

        onClicked: {
            playArea.showPage("Itmes");
        }
    }


    Button {
        id: closeButton
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 10
        width: 140
        label: translator.saveAndCloseText

        onClicked: {
            playArea.showPage("Itmes");
        }
    }

}
