/*
 * File: ProductFunctionButton.qml
 * Description: Reusable QML item.
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0

Item {
    id: container
    width: 25
    height: 25
    scale: functionButtonMouseArea.pressed ? 0.9 : 1
    opacity: functionButtonMouseArea.pressed ? 1 : 0.5

    property string source: ""

    signal clicked()

    Image {
        id: productInfoImage
        source: container.source
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
    }


    MouseArea {
        id: functionButtonMouseArea
        anchors.fill: parent
        onClicked: container.clicked();
    }

    Behavior on opacity {
        NumberAnimation {
            duration: 200
        }
    }

}
