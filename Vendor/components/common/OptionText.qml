/*
 * File: OptionText.qml
 * Description: Reusable QML item.
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0


Text {
    text: ""
    font.bold: true
    font.pointSize: settings.canvasPointSize
    color: "white"
    anchors.left: parent.left
}
