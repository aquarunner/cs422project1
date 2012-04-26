/*
 * File: MachinesModel.qml
 * Description: Data to simulate vending machines.
 *              Inventory role indicates which product IDs that machine has in stock.
 *              roduct IDs range from 1 to 20.
 * Author: dyoung24
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0

ListModel{

    ListElement {
        map: "../images/"
        description: "Vendor 1"
        inventory: "1 3 5 7 9 11 13 15 17 19"
    }

    ListElement {
        map: ""
        description: "Vendor 2"
        inventory: "2 4 6 8 10 12 14 16 18 20"
    }

    ListElement {
        map: ""
        description: "Vendor 3"
        inventory: "1 2 4 5 7 8 10 11 13 14 16 17 19 20"
    }

    ListElement {
        map: ""
        description: "Vendor 4"
        inventory: "2 3 6 7 9 10 13 14 16 17 19 20"
    }

    ListElement {
        map: ""
        description: "Vendor 5"
        inventory: "1 4 7 10 14 18 20"
    }

    ListElement {
        map: ""
        description: "Vendor 6"
        inventory: "5 10 15 20"
    }

}
