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

    property int spacing: 20


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
        anchors.rightMargin: container.spacing
        anchors.verticalCenter: parent.verticalCenter
        source: "../images/caution.png"

        opacity: hasAllergens ? 1 : 0.1

        property bool hasAllergens: allergens
        onClicked: {
            if (!hasAllergens) {
                notificationPop.show(translator.noAllergensText);
            } else {
                var message = translator.allergensContainedText + allergens
                notificationPop.show(message);
            }
        }
    }

    ProductFunctionButton {
        id: favoriteButton
        anchors.right: directionsButton.left
        anchors.rightMargin: container.spacing
        anchors.verticalCenter: parent.verticalCenter
        source: "../images/favorite.png"

        opacity: isFavorite ? 1 : 0.1

        property bool isFavorite: favorite
        onClicked: {
            isFavorite = !isFavorite
            if (isFavorite) {
                dbi.addFavorite(id);
                notificationPop.show(qsTr("%1:  %2").arg(translator.addFavoriteText).arg(name));
            } else {
                dbi.removeFavorite(id);
                notificationPop.show(qsTr("%1:  %2").arg(translator.removeFavoriteText).arg(name));
            }
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
        anchors.rightMargin: container.spacing
        anchors.verticalCenter: parent.verticalCenter
        source: "../images/directions.png"

        onClicked: {
            settings.selectedProductID = id
            productsContainer.showPage("ProductMap");
        }
    }



    ProductFunctionButton {
        id: productInfoButton
        anchors.right: buyButton.left
        anchors.rightMargin: container.spacing
        anchors.verticalCenter: parent.verticalCenter
        source: "../images/document.png"

        onClicked: {
            settings.selectedProductID = id
            productsContainer.showPage("ProductFacts");
        }
    }

    Button {
        id: buyButton
        label: dbi.currencyExchange(price, settings.preferredCurrencyCode)
        width: 70
        height: 30
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        onClicked: {
            if (allergens) {
                settings.selectedProductID = id;
                productsContainer.showPage("AllergenWarning");
            } else {
                productsPage.addToCart(id);
            }
        }
    }
}
