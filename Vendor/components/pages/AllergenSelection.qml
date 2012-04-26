import QtQuick 1.0
import "../common"

SimplePage {
    id: container

    Column {
        anchors.fill: parent
        //anchors.horizontalCenter: parent.horizontalCenter


        Item {
            id: filler
            width: parent.width
            height: 20
        }


        OptionText {
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            text: translator.allergenHintText
        }



        GridView {
            id: allergenGridView
            //anchors.fill: parent
            width: container.width
            height: container.height
            clip: true
            cellWidth: container.width / 2
            cellHeight: 50
            model: ListModel {
                id: allergenListModel

                ListElement { name: "Corn" }
                ListElement { name: "Fruit" }
                ListElement { name: "Garlic" }
                ListElement { name: "Oats" }
                ListElement { name: "Milk" }
                ListElement { name: "Peanut" }
                ListElement { name: "Shellfish" }
                ListElement { name: "Seafood" }
                ListElement { name: "Soy" }
                ListElement { name: "Treenut" }
                ListElement { name: "Wheat" }
                ListElement { name: "Egg" }
                ListElement { name: "MSG" }
                ListElement { name: "Sulphites" }
                ListElement { name: "Gluten" }
            }

            delegate: Item {
                id: allergenDelegate
                width: allergenGridView.cellWidth
                height: allergenGridView.cellHeight


                SelectionButton {
                    id: allergenButton
                    anchors.centerIn: parent
                    label: name
                    onClicked: {
                        if (selected) {
                            main.addAllergen(name);
                        } else {
                            main.removeAllergen(name);
                        }

                    }

                    Component.onCompleted: {
                        if (main.isRestricted(name)) {
                            allergenButton.selected = true;
                        }
                    }
                }
            }
        }

    }


    Button {
        id: complaintButton
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 10
        fontSize: 9
        fontBold: true
        label: translator.complaintMessageText

        onClicked: {
            //optionsContainer.showPage("OptionsPage");
        }
    }



    Button {
        id: closeButton
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 10
        width: 140
        label: translator.closeText

        onClicked: {
            optionsContainer.showPage("OptionsPage");
        }
    }

}
