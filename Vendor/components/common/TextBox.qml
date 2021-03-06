/*
 * File: SimplePage.qml
 * Description: Reusable QML item.
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 *
 * Inspired by http://jryannel.wordpress.com/2010/02/17/using-textinput/
 */


import QtQuick 1.0


Rectangle {
    id: container
    width: 120
    height: 25 * container.lineHeight
    radius: 6
    border.color: borderColor
    border.width: 4
    clip: true

    property color borderColor: "darkcyan"
    property string exampleText: "Example text..."
    property int lineHeight: 1
    property alias input: textInput.text
    property bool fontBold: true
    property int fontPointSize: 10

    Text {
        id: exampleText
        enabled: false
        opacity: 0.3
        visible: !container.input
        text: container.exampleText
        anchors.fill: parent
        anchors.margins: 5
        font.italic: true
        font.pointSize: container.fontPointSize
        wrapMode: Text.Wrap
    }
    TextInput {
        id: textInput
        anchors.fill: parent
        anchors.margins: 5
        font.bold: container.fontBold
        font.pointSize: container.fontPointSize
        //wrapMode: Text.Wrap
        //maximumLength: 10

    }
}
