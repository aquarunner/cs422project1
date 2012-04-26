/*
 * File: Main.qml
 * Description: Organizational helper for the vendor application.
                Main areas are options, items (including car) and help.
 * Author: dyoung24
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0
import "../common"

Rectangle {
    id: container
    color: settings.canvasColor
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
        anchors.left: parent.left
        anchors.right: parent.right

        Component.onCompleted: showPage("Items")



        ItemsContainer {
            id: itemsContainer
            pageName: "Items"
        }


        OptionsContainer {
            id: optionsContainer
            pageName: "Options"
        }

        Help {
            id: helpContainer
            pageName: "Help"
        }

        Complaints {
            id: complaintsPage
            pageName: "Complaints"
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
            color: settings.canvasColor
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

        // Reset Database
        // Developer function
        Rectangle {
            visible: settings.showResetButton
            id: resetButton
            width: 45
            height: 45
            anchors.right: quitImage.left
            anchors.top: optionsButton.top
            anchors.rightMargin: 10
            color: settings.canvasColor
            radius: 4
            scale: resetMouseArea.pressed ? 0.9 : 1
            border.color: "black"
            border.width: 2

            Text {
                text: "R"
                anchors.centerIn: parent
                font.pointSize: 20
                font.bold: true
                color: "grey"
            }

            MouseArea {
                id: resetMouseArea
                anchors.fill: parent
                onClicked: {
                    dbi.resetDB();
                    dbi.initialize();
                }

            }
        }



        Image {
            id: quitImage
            source: "../images/quit.png"
            width: 40
            height: 40
            anchors.top: optionsButton.top
            anchors.right: parent.right
            anchors.rightMargin: 10
            scale: quitButtonMouseArea.pressed ? 0.9 : 1

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



    function checkout() {
        settings.totalCartItems = 0
        settings.totalPrice = 0
        dbi.addToHistory(settings.cartItems);
        settings.cartItems = ""
        notificationPop.show("Purchase Complete")
    }


    function addAllergen(name) {
        if (settings.restrictedItems.indexOf(name) !== -1) {
            // Found.  Don't do anything.
            return;
        }

        settings.restrictedItems += " " + name;
        //console.log(settings.restrictedItems)
    }


    function isRestricted(allergen) {
        if (settings.restrictedItems.indexOf(allergen) === -1) {
            return false;
        } else {
            return true;
        }
    }

    function removeAllergen(name) {
        if (settings.restrictedItems.indexOf(name) === -1) {
            // Not found.  Don't do anything.
            return;
        }

        settings.restrictedItems = trim(settings.restrictedItems.replace(name, ""));
        //console.log(settings.restrictedItems)

    }


    function hasAllergens(allergens) {

        if (!allergens) {
            return "";
        }

        var allergensFound = "";
        var allergensContained = trim(allergens).split(" ");
        //console.log(allergens, allergensContained.length, allergensContained[0]);
        for (var i = 0; i < allergensContained.length; ++i) {
            if (main.isRestricted(allergensContained[i])) {
                //console.log(allergensContained[i]);
                allergensFound += " " + allergensContained[i];
            }
        }

        return allergensFound;
    }


    function trim(str) {

        str = str.replace(/^\s/,"").replace(/\s+/g," ").replace(/ +$/,"");

        return str;
    }


}
