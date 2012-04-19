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

MultiPage {
    id: container

    Component.onCompleted: showPage("Products")

    Products {
        pageName: "Products"
    }

    ProductMap {
        pageName: "ProductMap"
    }

    ProductFacts {
        pageName: "ProductFacts"
    }
}
