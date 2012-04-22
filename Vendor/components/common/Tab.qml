import QtQuick 1.0

Rectangle {
    id: container
    color: (container.selected || tabMouseArea.pressed) ? "darkslategray" : "#111111"
    radius: 6
    clip: true

    property string label: ""
    property alias text: container.label
    property bool selected: false

    signal clicked()

    Text {
        text: container.label
        anchors.centerIn: parent
        color: container.selected ? "black" : "#333333"
        font.bold: true
        font.pointSize: 10
    }


    MouseArea {
        id: tabMouseArea
        anchors.fill: parent
        onClicked: container.clicked();
    }
}
