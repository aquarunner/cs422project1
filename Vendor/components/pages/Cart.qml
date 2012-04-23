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


    Text {
        id: noItemsMessage
        text: translator.noItemsMessageText
        visible: settings.totalCartItems == 0
        color: "white"
        font.bold: true
        font.pointSize: settings.canvasPointSize
        anchors.centerIn: parent
    }



    SimplePage {
        id: cart
        fill: false
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: cartControlArea.top


        Header {
            id: cartHeader
            label: translator.cartHeaderMessageText
        }


        SimplePage {
            id: cartArea
            fill: false
            anchors.top: cartHeader.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom



            ListView {
                id: cartListView
                anchors.fill: parent
                clip: true
                model: ListModel { id: cartListModel }
                delegate: CartDelegate { id: cartDelegate }

                onVisibleChanged: {
                    if (cartListView.visible)   {
                        dbi.importCartItems(cartListModel, settings.cartItems);
                    }
                }

            }
        }

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
