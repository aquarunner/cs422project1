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

    Component.onCompleted: showPage("Items");


    Page {
        pageName: "Items"

        Flipper {
            id: itemsPage
            anchors.bottomMargin: cartPreviewArea.height
            front: ProductsContainer {}
            back: CartContainer {}
        }

        CartPreview {
            id: cartPreviewArea
        }
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
