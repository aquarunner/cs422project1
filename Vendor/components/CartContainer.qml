import QtQuick 1.0
import "common"

Page {
    id: container
    anchors.fill: parent

    Cart {

    }

    Button {
        id: backButton
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        //anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 10
        width: 160
        label: "Back To Items"
        onClicked: {
            productsPage.flip();
        }
    }

    Button {
        id: checkoutButton
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        //anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 10
        width: 160
        label: "Checkout"
    }

}
