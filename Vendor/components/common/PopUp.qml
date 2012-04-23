import QtQuick 1.0
//import "common"

Rectangle {
    id: container
    width: parent.width / 2
    height: 60
    anchors.horizontalCenter: parent.horizontalCenter
    y: parent.height * 0.2
    color: "#111111"
    radius: 6
    border.color: "#888888"
    border.width: 4
    //anchors.centerIn: parent
    opacity: showing ? 1 : 0

    property bool showing: false

    function show(message) {
        showing = false;
        popTimer.stop();
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
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.bold: true
        font.pointSize: settings.canvasPointSize
        font.letterSpacing: 1
        color: "white"
    }

    Behavior on opacity {
        NumberAnimation {
            duration: 200
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
        interval: 3000
        onTriggered: {
            showing = false;
        }
    }

}
