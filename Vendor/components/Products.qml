/*
 * File:
 * Description:
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0
import "common"

Flipper {
    id: container

    Item {
        id: filterTab
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 50

        Text {
            id: filterText
            text: qsTr("filter text")
            anchors.centerIn: parent
        }
    }



}
