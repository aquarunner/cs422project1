import QtQuick 1.0
import "common"

Page {

    Button {
        id: backButton
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 10
        label: translator.backToItems

        onClicked: {
            playArea.showPage("Items");
        }
    }
}
