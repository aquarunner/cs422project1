import QtQuick 1.0
import "common"

Page {
    id: container


    Text {
        id: noItemsMessage
        text: translator.noItemsMessageText
        visible: settings.totalCartItems == 0
        color: "white"
        font.bold: true
        anchors.centerIn: parent
    }



    Page {
        visible: settings.totalCartItems !== 0

        Item {
            id: cartHeader
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.left: parent.left
            height: 40
            clip: true

            Rectangle {
                id: cartHeaderTab
                width: parent.width - 20
                height: parent.height
                anchors.horizontalCenter: parent.horizontalCenter
                color: "darkslategray"
                radius: 6
                y: 5

                Text {
                    id: cartHeaderMessage
                    text: translator.cartHeaderMessageText
                    anchors.centerIn: parent
                    color: "black"
                    font.bold: true
                }


            }



        }
    }

}
