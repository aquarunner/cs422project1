/*
 * File: QMLSettings.qml
 * Description: Global application variables (read and write)
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0

Item {
    id: container

    property string appName: "SnackMaster"
    property string language: "English"
    property color vendorColor: "#222222"
    property bool firstRun: true
    property bool initDBOnLoad: true
    property int totalCartItems: 0
    property real totalPrice: 0.0
}
