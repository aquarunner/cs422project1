/*
 * File:
 * Description:
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0



Item {
    id: container
    anchors.top: parent.top
    anchors.right: parent.right
    anchors.left: parent.left
    height: 30
    clip: true

    property string label: ""
    property alias  text: container.label

    Tab  {
        id: headerTab
        width: parent.width - 10
        height: parent.height
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 5

        text: container.label
        selected: true
    }
}
