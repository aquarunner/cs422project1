/*
 * File:
 * Description:
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0
import "common"

Rectangle {
    id: container
    color: settings.vendorColor
    anchors.fill: parent

    Item {
        id: headerArea
        width: parent.width
        height: 100
        anchors.top: parent.top

        Text {
            id: headerText
            text: "center in parent"
            anchors.centerIn: parent
        }

    }

    MultiPage {
        id: playArea
        width: parent.width
        fill: false
        anchors.top: headerArea.bottom
        anchors.bottom: mainControlArea.top

        Component.onCompleted: showPage("Items")

        Flipper {
            pageName: "Items"
            front: Items {}
            back: Cart {}
        }

        Flipper {
            pageName: "Options"
            front: Options {}
            //back: PersonalInfo {}
        }

        Flipper {
            pageName: "Help"
            front: Help {}
            back: Complaints {}
        }

    }

    Item {
        id: mainControlArea
        width: parent.width
        height: 70
        anchors.bottom: parent.bottom




        Item {
            id: optionsButton
            width: 50
            height: 50
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 10
            anchors.bottomMargin: 10

            Image {
                id: optionsButtonImage
                source: "images/options.png"
                anchors.centerIn: parent
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    //playArea.flip()
                    playArea.showPage("Options");
                }
            }
        }



        Item {
            id: helpButton
            width: 40
            height: 40
            anchors.left: optionsButton.right
            anchors.top: optionsButton.top
            anchors.leftMargin: 10
            //color: "black"
            //radius: 4

            Text {
                //id: name
                text: "?"
                anchors.centerIn: parent
                font.pointSize: 20
                font.bold: true
                color: "white"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: playArea.showPage("Help");
            }
        }


        Item {
            id: quitButton
            width: 100
            height: 50
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.bottomMargin: 10
            anchors.rightMargin: 10


            Text {
                id: quitText
                text: translator.quitText
                anchors.centerIn: parent
                font.pointSize: 14
            }

            MouseArea {
                anchors.fill: parent
                onClicked: Qt.quit();
            }
        }
    }
}
