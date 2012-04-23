import QtQuick 1.0

Rectangle {
    anchors.fill: parent
    anchors.margins: 5
    color: "grey"
    border.color: "black"
    border.width: 1
    clip: true

    Text {
        text: translator.imageUnavailableText
        anchors.bottom: parent.bottom
        color: "black"
        font.pointSize: 5
        font.letterSpacing: 1
        transform: Rotation { angle: -45 }
    }
}
