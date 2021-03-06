/*
 * File: Help.qml
 * Description: Built-in help page.
 * Author: dyoung24
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0
import "../common"

SimplePage {
    id: container


    FlickablePage {
        id: helpContainer
        clip: true
        fill: false
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: helpBackButton.top
        anchors.margins: 10
        contentHeight: helpText.paintedHeight

        Text {
            id: helpText
            text: translator.helpText
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            color: "white"
            wrapMode: Text.Wrap
        }
    }


    Image {
        id: moreImage
        source: "../images/down.png"
        anchors.top: helpContainer.bottom
        anchors.left: helpContainer.left
        visible: !helpContainer.atYEnd
    }

    Button {
        id: complaintButton
        width: 140
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 10
        label: translator.reportIssuesText

        onClicked: {
            //playArea.showPage("Complaints");
        }
    }


    Button {
        id: helpBackButton
        width: 140
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 10
        label: translator.backToItemsText

        onClicked: {
            playArea.showPage("Items");
        }
    }
}
