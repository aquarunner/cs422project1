import QtQuick 1.0


Rectangle {
    id: container
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    height: 100
    color: cartMouseArea.pressed ? "black" : "#111111"


    MouseArea {
        id: cartMouseArea
        anchors.fill: parent
        onClicked: {
            productsPage.flip();
        }
    }


    Image {
        id: cartImage
        source: "images/cart.png"
        width: 70
        height: 70
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 40
    }

    Item {
        id: cartStatusArea
        //width: parent.width / 2
        height: parent.height
        anchors.left: cartImage.right
        anchors.right: parent.right
        anchors.leftMargin: 40

        Text {
            id: totalItemsMessage
            text: qsTr("Total items:")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 10
            height: parent.height / 2
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            //font.bold: true
            color: "white"
        }

        Text {
            id: subtotalMessage
            text: qsTr("Subtotal:")
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            height: parent.height / 2
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            font.bold: true
            color: "white"
        }
    }

}
