/*
 * File:
 * Description:
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */
import QtQuick 1.1



Rectangle {
    id: container
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    height: 80
    color: cartMouseArea.pressed ? "black" : "#111111"
    //scale: cartMouseArea.pressed ? 0.9 : 1


    MouseArea {
        id: cartMouseArea
        anchors.fill: parent
        onClicked: {
            itemsPage.flip();
        }
    }


    Image {
        id: cartImage
        source: "images/cart.png" //settings.totalCartItems ? "images/cart_full.png" : "images/cart_empty.png"
        width: 70
        height: 70
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 40
    }

    Item {
        id: cartStatusArea
        //width: parent.width / 2
        height: parent.height
        anchors.left: cartImage.right
        anchors.right: parent.right
        anchors.leftMargin: 40

        Text {
            id: totalItemsMessage
            text: translator.totalItemsMessageText
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 10
            height: parent.height / 2
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            //font.bold: true
            color: "white"
        }

        Text {
            id: totalItemsText
            text: settings.totalCartItems
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.rightMargin: 10
            height: parent.height / 2
            color: "white"
            font.pointSize: 12
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: totalPriceMessage
            text: translator.totalPriceMessageText
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            height: parent.height / 2
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            font.bold: true
            color: "white"
        }

        Text {
            property string exchange: dbi.currencyExchange(settings.totalPrice, settings.preferredCurrencyCode)
            id: totalPriceText
            text: exchange
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.rightMargin: 10
            height: parent.height / 2
            color: "white"
            font.pointSize: 12
            font.bold: true
            verticalAlignment: Text.AlignVCenter
        }

    }

}
