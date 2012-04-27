/*
 * File: DefaultSettings.qml
 * Description: Global application variables (read and write)
 * Author: dyoung24
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
    property bool showResetButton: false
    property bool alwaysReset: true
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
    property string paymentName: ""
    property string paymentNumber: ""
    property string paymentCVV: ""
    property string paymentExpiry: ""
    property string restrictedItems: ""
}
