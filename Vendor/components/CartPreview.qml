import QtQuick 1.0


Rectangle {
    id: container
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    height: 100
    color: "#111111"
    //color: "black"

    MouseArea {
        anchors.fill: parent
        onClicked: {
            products.showBack();
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
