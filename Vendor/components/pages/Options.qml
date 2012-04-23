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

    FlickablePage {
        id: optionsFlickable
        anchors.bottom: optionsBackButton.top

        Column {
            id: optionsContainer
            anchors.top: parent.top
            //anchors.horizontalCenter: parent.horizontalCenter
            anchors.fill: parent
            property int optionItemHeight: 100
            property int optionDescWidth: parent.width * 0.7
            property int optionValueWidth: parent.width * 0.3
            spacing: 5


            // Each row has a pair of elemens.  Option description and option value
            Row {
                width: parent.width
                spacing: 5

                Item {
                    width: optionsContainer.optionDescWidth
                    height: optionsContainer.optionItemHeight
                }
                Item {
                    width: optionsContainer.optionValueWidth
                    height: optionsContainer.optionItemHeight
                }
            }

        }
    }

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
