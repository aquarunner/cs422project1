/*
 * File: ProductMap.qml
 * Description: Controls display of a map to any vending machine.
 * Author: dyoung24
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0
import "../common"

SimplePage {
    id: container

    onVisibleChanged: {
        if (!container.visible)
            return;

        if (!settings.selectedProductID)
            return;

        container.showMapText(settings.selectedProductID);


    }


    function showMapText(prodID) {

        var machine;

        // Iterate through six vending machines
        // Return the first one that has this product in stock
        for (var i = 1; i < 7; ++i) {
            machine = dbi.getMachineInfo(i);

            if (machine.inventory.indexOf(prodID) !== -1) {

                break;
            }
        }


        // Not found anywhere?
        if (machine === undefined) {
            mapText.text = translator.outOfStockText
            return;
        }

        mapText.text = translator.mapHintText + machine.description

    }

    Header {
        id: mapHeader
        label: translator.directions
    }



    Text {
        id: mapText
        //visible: mapImage.status === Image.Ready
        text: ""
        color: "white"
        anchors.centerIn: parent
        font.pointSize: settings.canvasPointSize
        font.bold: true
    }


    BackButton {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 10
    }
}
