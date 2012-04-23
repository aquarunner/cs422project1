/*
 * File: ProductAllergens.qml
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

    property string prodName: ""
    property string prodAllergens: ""


    onVisibleChanged: {
        if (container.visible) {
            var prod = dbi.getProductInfo(settings.selectedProductID);
            container.prodName = prod.name;
            container.prodAllergens = prod.allergens;
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: 50

        Text {
            text: translator.warningFor + container.prodName
            color: "white"
            font.bold: true
            font.pointSize: settings.canvasPointSize
            width: container.width
            horizontalAlignment: Text.AlignHCenter
        }

        Item {
            width: container.width / 2
            height: categorySelectionMessage.height
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: categorySelectionMessage
                text: translator.allergenWarning
                color: "white"
                font.bold: true
                font.pointSize: settings.canvasPointSize
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
                //horizontalCenter: container.horizontalCenter
                wrapMode: Text.Wrap
            }
        }

        Text {
            id: allergenText
            text: container.prodAllergens
            color: "white"
            font.bold: true
            font.pointSize: settings.canvasPointSize
            width: container.width
            horizontalAlignment: Text.AlignHCenter
        }


        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 5


            Button {
                height: 50
                label: translator.warningYes
                onClicked: {
                    productsPage.addToCart(settings.selectedProductID);
                    productsContainer.showPage("Products");
                }

            }


            Button {
                height: 50
                label: translator.warningNo
                onClicked: {
                    productsContainer.showPage("Products");
                }
            }
        }
    }

}
