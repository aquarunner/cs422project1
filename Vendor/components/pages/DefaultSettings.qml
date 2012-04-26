/*
 * File: DefaultSettings.qml
 * Description: Global application variables (read and write)
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0

Item {
    id: container

    property string appName: "VendorManager"
    property color canvasColor: "#222222"
    property bool firstRun: false
    property bool initDBOnLoad: true
    property int totalCartItems: 0
    property real totalPrice: 0.0
    property string preferredCurrencyCode: "USD"
    property string preferredLanguage: "English"
    property string selectedCategory: ""
    property string selectedProductID: ""
    property int canvasPointSize: 11
    property string cartItems: ""
    property color productColor: "khaki"
    property bool savedCC: true
    property string storedCCName: ""
    property string storedCCNumber: ""
    property string storedCCCode: ""
    property string storedCCExpiry: ""
    property string restrictedItems: ""
}