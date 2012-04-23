/*
 * File:
 * Description:
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0
import "../common"

SimplePage {
    id: container
    anchors.fill: parent

    Cart {
        fill: false
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: cartControlArea.top
    }

    Row {
        id: cartControlArea
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        spacing: 20

        Button {
            id: cartBackButton
            width: 160
            label: translator.backToItemsText
            onClicked: {
                itemsPage.flip();
            }
        }

        Button {
            id: checkoutButton
            visible: settings.totalCartItems !== 0
            anchors.margins: 10
            width: 160
            label: translator.checkoutText
        }
    }

}
