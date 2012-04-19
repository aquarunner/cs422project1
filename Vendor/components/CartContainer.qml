/*
 * File:
 * Description:
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0
import "common"

Page {
    id: container
    anchors.fill: parent

    Cart {

    }

    Button {
        id: cartBackButton
        anchors.bottom: parent.bottom
        anchors.left: settings.totalCartItems == 0 ? undefined : parent.left
        anchors.horizontalCenter: settings.totalCartItems == 0 ? parent.horizontalCenter : undefined
        anchors.margins: 10
        width: 160
        label: translator.backToItemsText
        onClicked: {
            itemsPage.flip();
        }
    }

    Button {
        id: checkoutButton
        visible: settings.totalCartItems !== 0
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 10
        width: 160
        label: translator.checkoutText
    }

}
