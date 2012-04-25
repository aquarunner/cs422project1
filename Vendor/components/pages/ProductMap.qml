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

    onVisibleChanged: {
        if (!container.visible)
            return;

        if (!settings.selectedProductID)
            return;

        container.showMapText(settings.selectedProductID);


    }


    function showMapText(prodID) {
        var prod = dbi.getProductInfo(settings.selectedProductID);
        var machines = main.trim(prod.machines).split(" ");

        if (machines.length === 0) {
            mapText.text = translator.outOfStockText
            return;
        }


        var machineID = machines[0];
        var random = Math.floor(Math.random()*machines.length);
        // Uncomment the below line to choose a random vending machine
        //var machineID = machines[random];

        var machine = dbi.getMachineInfo(machineID);

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
