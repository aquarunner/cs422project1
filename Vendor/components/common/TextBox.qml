// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1


Rectangle {
    id: container
    width: 120
    height: 30 * container.lineHeight
    radius: 6
    border.color: borderColor
    border.width: 4

    property color borderColor: "darkcyan"
    property string exampleText: "Example text..."
    property int lineHeight: 1
    property string input: ""

    Text {
        id: exampleText
        opacity: 0.5
        visible: !container.input
        text: container.exampleText
        anchors.fill: parent
        anchors.margins: 5
        font.italic: true
    }
    TextEdit {
        id: textInput
        text: container.input
        anchors.fill: parent
        anchors.margins: 5

        onTextChanged: {
            container.input = text;
        }
    }
}
