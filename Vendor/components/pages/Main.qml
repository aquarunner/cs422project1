/*
 * File:
 * Description:
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0
import "../common"

Rectangle {
    id: container
    color: settings.vendorColor
    anchors.fill: parent






    Rectangle {
        id: headerArea
        width: parent.width
        height: 50
        anchors.top: parent.top
        color: "darkslategrey"

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



        ItemsContainer {
            id: itemsContainer
            pageName: "Items"
        }



        FlipablePage {
            //id: optionsPage
            pageName: "Options"
            front: Options {}
            //back: PersonalInfo {}
        }



        FlipablePage {
            //id: helpPage
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
            scale: optionsButtonMouseArea.pressed ? 0.9 : 1

            Image {
                id: optionsButtonImage
                source: "../images/options.png"
                anchors.centerIn: parent
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
            }

            MouseArea {
                id: optionsButtonMouseArea
                anchors.fill: parent
                onClicked: {
                    //playArea.flip()
                    playArea.showPage("Options");
                }
            }
        }



        Rectangle {
            id: helpButton
            width: 45
            height: 45
            anchors.left: optionsButton.right
            anchors.top: optionsButton.top
            anchors.leftMargin: 10
            color: settings.vendorColor
            radius: 4
            scale: helpMouseArea.pressed ? 0.9 : 1
            border.color: "black"
            border.width: 2

            Text {
                //id: name
                text: "?"
                anchors.centerIn: parent
                font.pointSize: 20
                font.bold: true
                color: "grey"
            }

            MouseArea {
                id: helpMouseArea
                anchors.fill: parent
                onClicked: playArea.showPage("Help");
            }
        }


        Rectangle {
            id: quitButton
            color: settings.vendorColor
            border.color: "black"
            border.width: 0
            width: 60
            height: 40
            radius: 4
            //anchors.bottom: parent.bottom
            anchors.top: optionsButton.top
            anchors.right: parent.right
            anchors.bottomMargin: 10
            anchors.rightMargin: 10
            scale: quitButtonMouseArea.pressed ? 0.9 : 1


            Text {
                id: quitText
                text: translator.quitText
                anchors.centerIn: parent
                font.pointSize: 14
            }

            MouseArea {
                id: quitButtonMouseArea
                anchors.fill: parent
                onClicked: Qt.quit();
            }
        }
    }





    PopUp {
        id: notificationPop
    }







    function addToCart(id) {
        settings.totalCartItems += 1
        var prod = dbi.getProductInfo(id);
        settings.totalPrice += parseFloat(prod.price);

        settings.cartItems += " " + prod.id;
        //notificationPop.show(settings.cartItems)
        //var i = "this is    a test".replace(/  +/g, " ").split(" ");
        notificationPop.show(qsTr("%1:  %2").arg(translator.addToCartText).arg(prod.name));
    }


}
