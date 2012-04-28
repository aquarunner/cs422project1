/*
 * File: BackButton.qml
 * Description: Reusable QML item.
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0

Button {
    id: backButton
    label: cartShowing ? translator.backToCartText : translator.backToItemsText

    property bool cartShowing: itemsPage.currentPage === "Cart"

    onClicked: {
        itemsContainer.showPage("ItemsPage");
    }
}
