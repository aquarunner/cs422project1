/*
 * File: Cart.qml
 * Description: Contains the cart list view and cart control buttons.
 * Author: dyoung24
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
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: moreImage.top
                clip: true
                model: ListModel { id: cartListModel }
                delegate: CartDelegate { id: cartDelegate }

                onVisibleChanged: {
                    if (cartListView.visible)   {
                        dbi.importCartItems(cartListModel, settings.cartItems);
                    }
                }

            }

            Image {
                id: moreImage
                source: "../images/down.png"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                visible: !cartListView.atYEnd
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
                //itemsPage.showFront();
                container.dismissed();
            }
        }

        Button {
            id: checkoutButton
            visible: settings.totalCartItems !== 0
            anchors.margins: 10
            width: 160
            label: translator.checkoutText

            onClicked: {
                container.accepted();
            }
        }
    }


}
