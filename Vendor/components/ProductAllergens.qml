/*
 * File: ProductAllergens.qml
 * Description:
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0
import "common"

SimplePage {
    id: container
    clip: true

    signal dismissed()
    signal confirmed()

    MouseArea {
        id: catcher
        anchors.fill: parent
        enabled: container.visible
        onClicked: {
            container.hide();
            container.dismissed();
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: 5

        Text {
            id: categorySelectionMessage
            text: translator.categorySelectionMessageText
            color: "white"
            font.bold: true
            font.pointSize: settings.canvasPointSize
            width: container.width
            horizontalAlignment: Text.AlignHCenter
            //anchors.horizontalCenter: col.horizontalCenter
        }

        Repeater {
            model: ListModel { id: categoryListModel }
            Component.onCompleted: {
                dbi.importCategories(categoryListModel);
            }

            Item {
                width: container.width
                height: categoryButton.height

                Button {
                    id: categoryButton
                    height: 50
                    anchors.horizontalCenter: parent.horizontalCenter

                    label: name

                    onClicked: {
                        container.hide();
                        settings.selectedCategory = name;
                        container.confirmed();
                    }
                }
            }
        }
    }

}
