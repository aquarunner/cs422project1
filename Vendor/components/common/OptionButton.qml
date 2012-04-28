/*
 * File: OptionButton.qml
 * Description: Reusable QML item
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0

Rectangle {
    id: container

    property string label: "Button"

    property string fontName: "Arial"
    property color fontColor: "black"
    property int fontSize: 14

    property alias text: container.label
    signal clicked()

    property color topColor: "lightcyan"
    property color bottomColor: "grey"


    anchors.right: parent.right
    anchors.rightMargin: 20
    height: 30
    width: 140
    border.width: 1
    radius: 4
    smooth: true

    gradient: Gradient {
        GradientStop {
            position: 0.0
            color: topColor
        }
        GradientStop {
            position: 1.0
            color: !mouseArea.pressed ? bottomColor : topColor
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: container.clicked()
    }

    Text {
        id: buttonLabel
        text: container.label
        wrapMode: Text.WordWrap
        anchors.centerIn: parent
        font.family: container.fontName
        font.pointSize: container.fontSize
        color: container.fontColor

    }
}
