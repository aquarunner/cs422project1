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

        Text {
            //id: name
            anchors.centerIn: parent
            text: qsTr("text")
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
            notificationPop.show(playArea.currentPage);
        }
    }

}
