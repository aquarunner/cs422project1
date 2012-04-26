/*
 * File: ProductsContainer.qml
 * Description: Controls display of vending machine contents.
 * Author: dyoung24
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0
import "../common"

MultiPage {
    id: container

    Component.onCompleted: showPage("Products")

    onVisibleChanged: {
        if (container.visible) {
            container.showPage("Products");
        }

    }

    Products {
        id: productsPage
        pageName: "Products"
    }


    CategorySelection {
        pageName: "CategorySelection"

        onConfirmed: {
            productsPage.showCategory();
            showPage("Products");
        }

        onDismissed: {
            showPage("Products");
        }
    }
}
