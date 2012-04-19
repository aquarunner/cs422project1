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


    Text {
        id: noItemsMessage
        text: translator.noItemsMessageText
        visible: settings.totalCartItems == 0
        color: "white"
        font.bold: true
        anchors.centerIn: parent
    }



    Page {
        id: cart
        visible: settings.totalCartItems !== 0

        Item {
            id: cartHeader
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.left: parent.left
            height: 30
            clip: true

            Tab  {
                id: cartHeaderTab
                width: parent.width - 10
                height: parent.height
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.top: parent.top
                anchors.topMargin: 5

                text: translator.cartHeaderMessageText
                selected: true
            }
        } // cartHeader


        Text {
            //id: name
            text: "All your items"
            anchors.centerIn: parent
            color: "white"
        }
    }

}
