/*
 * File: ImageUnavailable.qml
 * Author: dyoung24
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0
import "../common"

Rectangle {
    anchors.fill: parent
    anchors.margins: 5
    color: "grey"
    border.color: "black"
    border.width: 1
    clip: true

    Text {
        text: translator.imageUnavailableText
        anchors.bottom: parent.bottom
        color: "black"
        font.pointSize: 5
        font.letterSpacing: 1
        transform: Rotation { angle: -45 }
    }
}
