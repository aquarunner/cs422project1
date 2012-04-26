/*
 * File: CartContainer.qml
 * Description: Organizational helper for the cart and checkout pages.
 * Author: dyoung24
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0
import "../common"

MultiPage {
    id: container

    onVisibleChanged: {
        if (container.visible)    {
            showPage("Cart");
        }
    }

    Cart {
        id: cartPage
        pageName: "Cart"

        onAccepted: {
            cartContainer.showPage("CheckoutPage");

        }

        onDismissed: {
            itemsPage.showFront();
        }
    }


    FlipablePage {
        id: checkoutPage
        pageName: "CheckoutPage"
        front: CheckoutConfirm { id: checkoutConfirm }
    }
}
