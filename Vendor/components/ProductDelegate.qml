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

Item {
    id: container
    anchors.left: parent.left
    anchors.right: parent.right
    height: 100


    Image {
        id: productImage
        source: image
    }

}
