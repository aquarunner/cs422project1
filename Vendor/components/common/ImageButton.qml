/*
 * File: ImageButton.qml
 * Description: Reusable QML item
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0

Rectangle {
    id: container

    property string src
    property int borderWidth: 2
    property int passiveBorderColor: "black"
    property int activeBorderColor: "khaki"

    signal clicked()

    height: 60
    width: 60
    radius: 4
    smooth: true
    color: passiveBorderColor

    Rectangle {

    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: container.clicked()
    }

}
