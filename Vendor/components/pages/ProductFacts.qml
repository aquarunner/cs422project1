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
    property string source: ""

    onVisibleChanged:  {
        if (!container.visible)
            return;

        if (!settings.selectedProductID)
            return;


        var prod = dbi.getProductInfo(settings.selectedProductID);

        container.source = prod.nutritionData
    }


    Header {
        id: factsHeader
        label: translator.productInfo
    }


    Item {
        anchors.top: factsHeader.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: backButton.top
        anchors.margins: 5

        Image {
            id: factsImage
            source: container.source
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
        }
    }


    Text {
        id: mapText
        visible: factsImage.status == Image.Ready
        text: ""
        color: "white"
        anchors.centerIn: parent
        font.pointSize: settings.canvasPointSize
        font.bold: true
    }

    BackButton {
        id: backButton
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 10
    }
}
