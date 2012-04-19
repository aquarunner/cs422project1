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

    Component.onCompleted: showPage("Products");


    Flipper {
        pageName: "Products"

        Flipper {
            id: items
            anchors.bottomMargin: cartPreviewArea.height
            front: Products {}
            back: Cart {}
        }

        CartPreview { id: cartPreviewArea }
    }




    ProductMap {
        id: productMap
        pageName: "ProductMap"
    }




    ProductFacts {
        id: productFacts
        pageName: "ProductFacts"
    }
}
