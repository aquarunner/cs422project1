import QtQuick 1.0
import "common"

Rectangle {
    id: container
    width: parent.width / 2
    height: 100
    color: "#222222"
    radius: 4
    border.color: "black"
    border.width: 2
    anchors.centerIn: parent
    opacity: showing ? 1 : 0

    property bool showing: false

    function show(message) {
        popText.text = message;
        showing = true;
    }

    Text {
        id: popText
        text: ""
        anchors.fill: parent
        anchors.centerIn: parent
        anchors.margins: 10
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.Wrap
        font.bold: true
        color: white
    }

    Behavior on opacity {
        NumberAnimation {
            duration: 500
        }
    }

    onShowingChanged: {
        if (showing) {
            popTimer.start();
        }
    }

    Timer {
        id: popTimer
        running: false
        repeat: false
        interval: 5000
        onTriggered: {
            showing = false;
        }
    }

}
