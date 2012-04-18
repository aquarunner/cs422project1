/*
 * File: PopUp.qml
 * Description: Reusable QML item
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0

Item {
    id: container
    visible: false
    anchors.fill: parent
    z: 1
    opacity: container.visible == true ? 1 : 0

    property string pageName

    property int posX: 0
    property int posY: 0

    signal clicked()
    signal accepted()
    signal rejected()

    function show() {
        container.visible = true;
    }

    function hide() {
        container.visible = false;
    }

    Behavior on opacity {
        NumberAnimation {
            duration: 300
            easing.type: Easing.InOutQuad
        }
    }

    Item {
        anchors.fill:  parent
        MouseArea {
            anchors.fill: parent
            enabled: container.visible
            onClicked: container.visible = false
        }
    }
}
