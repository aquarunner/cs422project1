import QtQuick 1.0

Rectangle {
    id: container
    color: container.selected ? "darkslategray" : "#111111"
    radius: 6

    property string label: ""
    property alias text: container.label
    property bool selected: false

    signal clicked()

    Text {
        //id: cartHeaderMessage
        text: container.label
        anchors.centerIn: parent
        color: container.selected ? "black" : "#222222"
        font.bold: true
        font.pointSize: 11
    }


    MouseArea {
        anchors.fill: parent
        onClicked: container.clicked();
    }
}