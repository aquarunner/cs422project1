/*
 * File: FlickablePage.qml
 * Description: Reusable QML item.  Stripped down version of FlipablePage.qml.
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0

Flickable {
    id: container
    flickableDirection: Flickable.VerticalFlick
    anchors.fill: container.fill ? parent : undefined
    visible: container.opacity !== 0
    //opacity: container.showing ? 1 : 0

    property string pageName: ""
    property bool showing: true
    property bool fill: true

    Behavior on opacity {
        NumberAnimation {
            duration: 250
        }
    }

    function show() {
        //container.visible = true
        //container.showing = true
        container.opacity = 1
    }

    function hide() {
        //container.visible = false
        //container.showing = false
        container.opacity = 0
    }

}
