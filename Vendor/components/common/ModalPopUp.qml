/*
 * File: ModelPopUp.qml
 * Description: Reusable QML item.  Stripped down version of FlipablePage.qml.
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0

Item {
    id: container
    anchors.fill: container.fill ? parent : undefined
    visible: container.opacity !== 0
    opacity: 0

    property string pageName: ""
    property bool fill: true


    signal lostFocus()

    MouseArea {
        id: mouseCatcher
        anchors.fill: parent
        enabled: container.opacity
        onClicked: {
            container.hide();
            container.lostFocus();
        }
    }

    Behavior on opacity {
        NumberAnimation {
            duration: 250
        }
    }

    function show() {
        container.opacity = 1
    }

    function hide() {
        container.opacity = 0
    }

}
