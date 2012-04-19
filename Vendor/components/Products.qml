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

Page {
    id: container


    Item {
        id: filterArea
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 30
        clip: true


        Tab {
            id: allItemsTab
            width: parent.width * 0.3
            height: parent.height
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 5

            text: translator.allItemsText
            selected: true

            onClicked: {
                allItemsTab.selected = true;
                favoritesTab.selected = false;
                categoriesTab.selected = false;
            }
        }

        Tab {
            id: favoritesTab
            width: parent.width * 0.3
            height: parent.height
            anchors.left: allItemsTab.right
            anchors.leftMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 5

            text: translator.favoritesText

            onClicked: {
                allItemsTab.selected = false;
                favoritesTab.selected = true;
                categoriesTab.selected = false;
            }

        }

        Tab {
            id: categoriesTab
            width: parent.width * 0.3
            height: parent.height
            anchors.left: favoritesTab.right
            anchors.leftMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 5

            text: translator.categoriesText

            onClicked: {
                allItemsTab.selected = false;
                favoritesTab.selected = false;
                categoriesTab.selected = true;
            }

        }

    }



}
