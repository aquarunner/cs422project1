import QtQuick 1.0
import "../common"

SimplePage {
    id: container


    SimplePage {
        id: formArea
        fill: false
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: saveButton.top
        anchors.margins: 5


        Column {
            anchors.fill: parent
            spacing: 5

            OptionText {
                text: translator.paymentFormHintText
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
                anchors.topMargin: 20
            }

            TextBox {
                id: paymentName
                width: parent.width * 0.9
                anchors.leftMargin: 20
                anchors.left: parent.left
            }

            Text {
                anchors.left: parent.left
                anchors.leftMargin: 20
                text: translator.paymentNameText
                font.bold: true
                color: "white"
            }
        }

    }

    Button {
        id: resetButton
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 10
        width: 140
        label: translator.resetText

        onClicked: {
            notificationPop.show(playArea.currentPage);
        }
    }


    Button {
        id: saveButton
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 10
        width: 140
        label: translator.saveText

        onClicked: {
            //notificationPop.show(playArea.currentPage);
            container.accepted()
        }
    }

}
