/*
 * File:
 * Description:
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0
import "../common"

SimplePage {




    Header {
        id: mapHeader
        label: translator.directions
    }



    BackButton {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 10
    }
}
