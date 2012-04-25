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

SimplePage {
    id: container

    onVisibleChanged: {
        if (container.visible) {
            optionsArea.showPage("OptionsPage");
        }
    }

    MultiPage {
        id: optionsArea
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: buttonArea.top
        anchors.margins: 5
        clip: true

        OptionsPage {
            pageName: "OptionsPage"
            id: optionsPage
        }

        AllergensSelection {
            pageName: "AllergensSelection"

            onAccepted: {
                optionsArea.showPage("OptionsPage");
            }

            onDismissed: {
                optionsArea.showPage("OptionsPage");
            }
        }

        LanguageSelection {
            pageName: "LanguageSelection"

            onAccepted: {
                optionsArea.showPage("OptionsPage");
            }

            onDismissed: {
                optionsArea.showPage("OptionsPage");
            }


        }


        CurrencySelection {
            pageName: "CurrencySelection"

            onAccepted: {
                optionsArea.showPage("OptionsPage");
            }

            onDismissed: {
                optionsArea.showPage("OptionsPage");
            }

        }

        PaymentForm {
            pageName: "PaymentForm"

            onAccepted: {
                optionsArea.showPage("OptionsPage");
            }

            onDismissed: {
                optionsArea.showPage("OptionsPage");
            }

        }



    }




    Image {
        id: moreImage
        source: "../images/down.png"
        anchors.bottom: buttonArea.top
        anchors.bottomMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
        visible: (optionsPage.showing && !optionsPage.atYEnd)
    }

    Rectangle {
        id: buttonArea
        color: settings.canvasColor
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: optionsBackButton.height
        Button {
            id: optionsBackButton
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 10
            label: translator.backToItemsText

            onClicked: {
                playArea.showPage("Items");
            }
        }
    }
}
