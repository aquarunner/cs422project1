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

MultiPage {
    id: container

    Component.onCompleted: showPage("Items");


    SimplePage {
        pageName: "Items"

        FlipablePage {
            id: itemsPage
            anchors.bottomMargin: cartPreviewArea.height
            front: ProductsContainer { id: productsContainer }
            back: CartContainer { id: cartContainer }
        }

        CartPreview {
            id: cartPreviewArea
        }
    }




    ProductMap {
        id: productMapPage
        pageName: "ProductMap"
    }




    ProductFacts {
        id: productFactsPage
        pageName: "ProductFacts"
    }



    AllergenWarning {
        id: allergenWarningPage
        pageName: "AllergenWarning"
    }
}
