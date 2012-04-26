/*
 * File:ItemsContainer.qml
 * Description: Organizational helper for product views, including the cart, the map and nutrition information.
 * Author: dyoung24
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0
import "../common"

MultiPage {
    id: container

    Component.onCompleted: {
        container.showPage("ItemsPage");
    }

    onVisibleChanged: {
        if (container.visible) {
            container.showPage("ItemsPage");
        }
    }


    SimplePage {
        pageName: "ItemsPage"

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
