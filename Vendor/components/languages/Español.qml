import QtQuick 1.0


Item {
    id: container

    property string purchaseCompleteText: "Compra completo"
    property string purchaseCanceledText: "Compra cancelada"
    property string logoHintText: "Deliciosos Platos Cerca De Ti"
    property string yesText: "Sí"
    property string noText: "No"
    property string welcomeText: "Bienvenido al Administrador de proveedores"
    property string welcomeHint: "¿Te gustaría para almacenar su información de pago ahora?"
    property string reportIssuesText: "Cuestiones de informe"
    property string cancelText: "Cancelar"
    property string continueText: "Continuar"
    property string futureSaveText: "Guardar información de pago"
    property string paymentCVVText: "Código CVV"
    property string paymentExpiryText: "caducidad de la tarjeta de crédito"
    property string paymentNumberText: "Número de Tarjeta de Crédito"
    property string paymentNameText: "Nombre en la tarjeta"
    property string paymentFormHintText: "Detalles de pago"
    property string confirmChargeText: "Confirmar la carga"
    property string confirmText: "Confirmar la carga de la tarjeta de crédito guardada"
    property string currencyHintText: "Selección de divisas"
    property string saveAndCloseText: "Guardar y cerrar"
    property string closeText: "Cerrar"
    property string resetText: "Reset"
    property string saveText: "Guardar"
    property string complaintMessageText: "Los productos que faltan enviar tu sugerencia aquí?"
    property string allergenHintText: "Evitar Estos Ingredientes"
    property string backToOptionsText: "Volver a las opciones"
    property string emptyHistoryText: "No hay elementos de la Historia"
    property string clearText: "Clear"
    property string purchaseHistoryText: "Historial de compras"
    property string notSetText: "No establecido"
    property string setText: "Saved"
    property string paymentMethodText: "Método de Pago"
    property string restrictedItemsText: "Selección de alérgenos"
    property string currencyText: "Moneda"
    property string preferencesText: "Preferencias"
    property string languageText: "Idioma"
    property string quitText: "Salir"
    property string checkoutText: "Caja"
    property string backToItemsText: "Volver a los elementos"
    property string noItemsMessageText: "No hay elementos seleccionados"
    property string cartHeaderMessageText: "Los productos Ready to Checkout"
    property string totalPriceMessageText: "Total:"
    property string totalItemsMessageText: "Total de artículos:"
    property string allItemsText: "Todos Los Elementos"
    property string favoritesText: "Mis Favoritos"
    property string categoriesText: "Categorías"
    property string imageUnavailableText: "LA IMAGEN NO DISPONIBLE"
    property string noAllergensText: "No hay advertencias de alergenos presentes."
    property string addFavoriteText: "Favorito"
    property string removeFavoriteText: "Quitado de los favoritos"
    property string addToCartText: "Se Agregó A La Cesta"
    property string removeFromCartText: "Eliminado del carrito"
    property string categorySelectionMessageText: "Por favor, elija de las categorías disponibles"
    property string allergensContainedText: "Los alérgenos Contenido: "
    property string directions: "Direcciones"
    property string productInfo: "Información sobre el producto"
    property string allergenWarning: "¿Está seguro que desea comprar esto a pesar de los siguientes alérgenos se encuentran?"
    property string warningFor: "Advertencia para "
    property string warningYes: "Sí - ¡Cómpralo ya!"
    property string warningNo: "No - Volver a los elementos"
    property string backToCartText: "Volver a la cesta"
    property string outOfStockText: "Agotado"
    property string mapHintText: "Usted puede encontrar este tema en "
    property string helpText: "
<html>
<center><h1> Ayuda del Vendor Manager</h1> </center>
<p> Esta aplicación te permitirá localizar rápidamente los alimentos y comprarlos en cerca de las máquinas expendedoras. </ p>

<table width='100%' cellspacing='10'>
<tr>
<td valign='middle'> <b> Opciones </b>. Toque este icono para abrir el panel de opciones. </td>
<td width='40' width='40' align='right'> <img height='40' src='../images/options.png' /> </td>
</tr>

<tr>
<td valign='middle'> <b> todos los artículos </b>. Tocar aquí se volverá a organizar los elementos de vista para que todos los elementos disponibles de todas las máquinas expendedoras pueden ser seleccionados. </td>
<td align='right'> <img height='30' src='../images/help_allitems.png' /> </td>
</tr>

<tr>
<td valign='middle'> <b> favoritos </b>. Pulse aquí para ocultar todas sus temas favoritos en la selección de artículos. </td>
<td align='right'> <img height='30' src='../images/help_favorites.png' /> </td>
</tr>

<tr>
<td valign='middle'> <b> las categorías </b>. Esto le proporcionará con una selección de categorías de artículos. Sólo los artículos de la categoría seleccionada se muestran. </td>
<td align='right'> <img height='30' src='../images/help_categories.png' /> </td>
</tr>

<tr>
<td valign='middle'> <b> Comprar </b>. El texto de este botón indica que los precios del producto en esa fila, de acuerdo a su preferencia de moneda. Presione este botón para añadir el artículo a su carrito. </td>
<td align='right'> <img height='30' src='../images/help_buy.png' /> </td>
</tr>

<tr>
<td valign='middle'> <b> Atención </b>. Este icono se iluminará si el producto en esa fila contiene alergenos que desea evitar. Pulse el icono para obtener más detalles. </td>
<td align='right'> <img height='30' src='../images/caution.png' /> </td>
</tr>

<tr>
<td valign='middle'> <b> Añadir / Quitar favorito </b>. Utilice este botón para cambiar los elementos favoritos. </td>
<td align='right'> <img height='30' src='../images/favorite.png' /> </td>
</tr>

<tr>
<td valign='middle'> <b> llegar </b>. Pulse este botón para averiguar dónde se encuentra el objeto. Desde un punto se puede situar en múltiples máquinas, las direcciones a la primera se muestra. </td>
<td align='right'> <img height='30' src='../images/directions.png' /> </td>
</tr>

<tr>
<td valign='middle'> <b> Información Nutricional </b>. Tocar aquí le mostrará los datos de información de nutrición para ese producto, de manera que pueda ser informado antes de hacer la compra. </td>
<td align='right'> <img height='30' src='../images/document.png' /> </td>
</tr>

<tr>
<td valign='middle'> <b> compra </b>. El botón del carro cambia el punto de vista entre los elementos y el carro, para que pueda alternar en cualquier momento, y rápidamente a la caja. </td>
<td align='right'> <img height='40' src='../images/cart.png' /> </td>
</tr>

</table>

<p> Para obtener asistencia adicional póngase en contacto con support@example.com o visite nuestro sitio web en http://code.google.com/p/cs422project1/ </ p>
</html>
"
}
