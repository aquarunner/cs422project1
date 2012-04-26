import QtQuick 1.0


Item {
    id: container

    property string cancelText: "Cancel"
    property string continueText: "Continue"
    property string futureSaveText: "Save Payment Info"
    property string paymentCVVText: "CVV Code"
    property string paymentExpiryText: "Credit Card Expiration"
    property string paymentNumberText: "Credit Card Number"
    property string paymentNameText: "Name On Card"
    property string paymentFormHintText: "Payment Details"
    property string confirmChargeText: "Confirm Charge"
    property string confirmText: "Confirm Charge To Saved Payment Info"
    property string currencyHintText: "Currency Selection"
    property string saveAndCloseText: "Save & Close"
    property string closeText: "Close"
    property string resetText: "Reset"
    property string saveText: "Save"
    property string complaintMessageText: "Items missing? Submit your suggestion here."
    property string allergenHintText: "Avoid These Ingredients"
    property string backToOptionsText: "Back To Options"
    property string emptyHistoryText: "No Items In History"
    property string clearText: "Clear"
    property string purchaseHistoryText: "Purchase History"
    property string notSetText: "Not Set"
    property string setText: "Saved"
    property string paymentMethodText: "Payment Method"
    property string restrictedItemsText: "Allergen Selection"
    property string currencyText: "Currency"
    property string preferencesText: "Preferences"
    property string languageText: "Language"
    property string quitText: "Quit"
    property string checkoutText: "Checkout"
    property string backToItemsText: "Back To Items"
    property string noItemsMessageText: "No Items Selected"
    property string cartHeaderMessageText: "Items Ready To Checkout"
    property string totalPriceMessageText: "Order Total:"
    property string totalItemsMessageText: "Total Items:"
    property string allItemsText: "All Items"
    property string favoritesText: "Favorites"
    property string categoriesText: "Categories"
    property string imageUnavailableText: "IMAGE UNAVAILABLE"
    property string noAllergensText: "No allergen warnings present."
    property string addFavoriteText: "Added to favorites"
    property string removeFavoriteText: "Removed from favorites"
    property string addToCartText: "Added to cart"
    property string removeFromCartText: "Removed from cart"
    property string categorySelectionMessageText: "Please Choose From The Available Categories"
    property string allergensContainedText: "Allergens Contained: "
    property string directions: "Directions"
    property string productInfo: "Product Information"
    property string allergenWarning: "Are you sure you want to buy this even though the following allergens are contained?"
    property string warningFor: "Warning for "
    property string warningYes: "Yes - Buy It Now"
    property string warningNo: "No - Back To Items"
    property string backToCartText: "Back To Cart"
    property string outOfStockText: "Out Of Stock"
    property string mapHintText: "You may find this item at "

    property string helpText: "
<html>
<center><h1>Vendor Manager Help</h1></center>
<p>This application will allow you to quickly locate food items and purchase them from nearby vending machines.</p>

<table width='100%' cellspacing='10'>
<tr>
<td valign='middle'><b>Options</b>. Touch this icon to open the options panel.</td>
<td width='40' align='right'><img src='../images/options.png' width='40' height='40' /></td>
</tr>

<tr>
<td valign='middle'><b>All Items</b>.  Touching here will re-organize the items view so that all available items from all vending machines can be selected.</td>
<td align='right'><img src='../images/help_allitems.png' height='30' /></td>
</tr>

<tr>
<td valign='middle'><b>Favorites</b>.  Touch here to hide all but your favorite items in the items selection.</td>
<td align='right'><img src='../images/help_favorites.png' height='30' /></td>
</tr>

<tr>
<td valign='middle'><b>Categories</b>.  This will provide you with a selection of item categories.  Only the items from the selected category will be shown.</td>
<td align='right'><img src='../images/help_categories.png' height='30' /></td>
</tr>

<tr>
<td valign='middle'><b>Buy</b>.  The text of this button indicates the prices of the item in that row, according to your currency preference.  Press this button to add the item to your cart.</td>
<td align='right'><img src='../images/help_buy.png' height='30' /></td>
</tr>

<tr>
<td valign='middle'><b>Caution</b>.  This icon will illuminate if the product in that row contains allergens you wish to avoid.  Press the icon for additional detail.</td>
<td align='right'><img src='../images/caution.png' height='30' /></td>
</tr>

<tr>
<td valign='middle'><b>Add/Remove Favorite</b>.  Use this button to toggle favorite items.</td>
<td align='right'><img src='../images/favorite.png' height='30' /></td>
</tr>

<tr>
<td valign='middle'><b>Directions</b>.  Press this button to find out where the item is located.  Since an item can be located at multiple machines, directions to the first one will be shown.</td>
<td align='right'><img src='../images/directions.png' height='30' /></td>
</tr>

<tr>
<td valign='middle'><b>Nutrition Information</b>.  Touching here will show you the nutrition information details for that product, so that you can be informed before making the purchase.</td>
<td align='right'><img src='../images/document.png' height='30' /></td>
</tr>

<tr>
<td valign='middle'><b>Cart</b>.  The cart button toggles the view between items and the cart, so that you can switch back and forth at any time, and quickly proceed to checkout.</td>
<td align='right'><img src='../images/cart.png' height='40' /></td>
</tr>

</table>

<p>For additional support please contact support@example.com or visit our website at http://code.google.com/p/cs422project1/</p>
</html>
"
}
