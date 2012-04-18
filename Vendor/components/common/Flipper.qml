/*
 * File: Flipper.qml
 * Description: Reusable QML item
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0

Flipable {
    id: container
    anchors.fill: container.fill ? parent : undefined
    visible: container.opacity !== 0
    opacity: container.showing ? 1 : 0

    property string pageName: ""
    property bool showing: true
    property int angle: 0
    property bool flipped: false
    property bool fill: true

    Behavior on opacity {
        NumberAnimation {
            duration: 250
        }
    }

    function show() {
        //container.visible = true
        container.showing = true
    }

    function hide() {
        //container.visible = false
        container.showing = false
    }

    function flip() {
        container.flipped = !flipped
    }

    function showFront() {
        container.flipped = false
    }

    function showBack() {
        container.flipped = true
    }

    transform: Rotation {
        origin.x: container.width/2
        origin.y: container.height/2
        axis.x: 0
        axis.y: 1
        axis.z: 0
        angle: container.angle
    }

    states: State {
        name: "back"
        when: container.flipped
        PropertyChanges {
            target: container
            angle: 180
        }
    }

    transitions: Transition {
        NumberAnimation{
            property: "angle";
            duration: 250
        }
    }
}
