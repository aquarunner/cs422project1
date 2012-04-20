import QtQuick 1.0

Rectangle {
    anchors.fill: parent
    color: "grey"
    border.color: "black"
    border.width: 1

    Text {
        text: translator.imageUnavailableText
        anchors.bottom: parent.bottom
        x: 4
        color: "black"
        font.pointSize: 6
        transform: Rotation { angle: -45 }
    }
}
