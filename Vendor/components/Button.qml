import QtQuick 1.0

Rectangle {
    id: container

    property string label: "Button"

    property string fontName: "Arial"
    property color fontColor: "black"
    property int fontSize: 14

    property alias text: container.label
    signal clicked()

    property color topColor: "#FFFF66"
    property color bottomColor: "#FFCC00"

    height: 60
    width: 180
    border.width: 1
    radius: 4
    smooth: true

    gradient: Gradient {
        GradientStop {
            position: 0.0
            color: topColor
        }
        GradientStop {
            position: 1.0
            color: !mouseArea.pressed ? bottomColor : topColor
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: container.clicked()
    }

    Text {
        id: buttonLabel
        text: container.label
        wrapMode: Text.WordWrap
        anchors.centerIn: parent
        font.family: container.fontName
        font.pointSize: container.fontSize
        color: container.fontColor

    }
}
