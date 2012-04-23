import QtQuick 1.0

Button {
    id: backButton
    label: cartShowing ? translator.backToCartText : translator.backToItemsText

    property bool cartShowing: itemsPage.currentPage === "Cart"

    onClicked: {
        itemsContainer.showPage("Items");
//        if (backButton.cartShowing) {
//            cartContainer.showPage("Cart");
//        } else {
//            productsContainer.showPage("Products");
//        }
    }
}
