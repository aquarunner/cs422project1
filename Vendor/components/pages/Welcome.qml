/*
 * File: Welcome.qml
 * Description: Greeting shown when the program is first run
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0
import "../common"

SimplePage {
    id: container

    Button {
        onClicked: {
            vendorFlip.showBack();
        }
    }
}