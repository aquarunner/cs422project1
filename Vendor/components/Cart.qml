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

SimplePage {
    id: container


    Text {
        id: noItemsMessage
        text: translator.noItemsMessageText
        visible: settings.totalCartItems == 0
        color: "white"
        font.bold: true
        anchors.centerIn: parent
    }



    SimplePage {
        id: cart
        visible: settings.totalCartItems !== 0


        ProductHeader {
            id: cartHeader
            label: translator.cartHeaderMessageText
        }


        // Cart list view



    }

}
