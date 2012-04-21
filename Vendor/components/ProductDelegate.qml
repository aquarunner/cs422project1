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

Item {
    id: container
    anchors.left: parent.left
    anchors.right: parent.right
    height: 100


    Image {
        id: productImage
        source: image
        width: 70
        height: 70
        anchors.left: parent.left
        anchors.top: parent.top

        ImageUnavailable {
            visible: productImage.status !== Image.Ready
        }
    }

    Text {
        id: productName
        text: name
        color: "white"
        font.bold: true
        anchors.left: parent.left
        anchors.top: productImage.bottom
        width: productImage.width
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.Wrap

    }


    ProductFunctionButton {
        id: cautionButton
        anchors.right: favoriteButton.left
        anchors.rightMargin: 20
        anchors.verticalCenter: parent.verticalCenter
        source: "../images/caution.png"

        opacity: hasAllergens ? 1 : 0.1

        property bool hasAllergens: allergens
        onClicked: {
            hasAllergens = !hasAllergens
        }
    }

    ProductFunctionButton {
        id: favoriteButton
        anchors.right: directionsButton.left
        anchors.rightMargin: 20
        anchors.verticalCenter: parent.verticalCenter
        source: "../images/favorite.png"

        opacity: isFavorite ? 1 : 0.1

        property bool isFavorite: favorite
        onClicked: {
            isFavorite = !isFavorite
        }

        Behavior on opacity {
            NumberAnimation {
                duration: 300
            }
        }
    }

    ProductFunctionButton {
        id: directionsButton
        anchors.right: productInfoButton.left
        anchors.rightMargin: 20
        anchors.verticalCenter: parent.verticalCenter
        source: "../images/directions.png"
    }



    ProductFunctionButton {
        id: productInfoButton
        anchors.right: buyButton.left
        anchors.rightMargin: 20
        anchors.verticalCenter: parent.verticalCenter
        source: "../images/document.png"
    }

    Button {
        id: buyButton
        label: parseFloat(price).toFixed(2)
        width: 70
        height: 30
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        onClicked: {
            settings.totalCartItems += 1
            settings.totalPrice += parseFloat(price);

            notificationPop.show(qsTr("Added %1 to cart...").arg(name));
        }
    }
}
