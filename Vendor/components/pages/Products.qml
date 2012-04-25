/*
 * File: Products.qml
 * Description: Displays a products listview as well as selection filters (favorites, categories).
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0
import "../common"

SimplePage {
    id: container


    function showCategory(cat) {
        categoriesTab.selected = false;
        categoriesTab.selected = true;
    }

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

            onSelectedChanged: {
                if (selected) {
                    productsArea.refresh("All");
                }
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

            onSelectedChanged: {
                if (selected) {
                    productsArea.refresh("Favorites");
                }

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
                productsContainer.showPage("CategorySelection");
            }

            onSelectedChanged: {
                if (selected) {
                    allItemsTab.selected = false;
                    favoritesTab.selected = false;
                    categoriesTab.selected = true;

                    label = "[ " + settings.selectedCategory + " ]"

                    productsArea.refresh("Category", settings.selectedCategory);
                } else {
                    label = translator.categoriesText
                }
            }
        }

    }  //  filterArea


    SimplePage {

        pageName: "ProductsArea"

        id: productsArea
        fill: false
        anchors.margins: 5
        anchors.top: filterArea.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right


        ListView {
            id: productsListView
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: moreImage.top
            clip: true
            model: ListModel { id: productsListModel }
            delegate: ProductDelegate { id: productDelegate }

            Component.onCompleted: dbi.importProducts(productsListModel, "All");
        }

        Image {
            id: moreImage
            source: "../images/down.png"
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            visible: !productsListView.atYEnd
        }


        property string refreshType: ""
        property string selectedCategory: ""
        property bool refreshing: false
        function refresh(type, category) {
            refreshType = type ? type : "";
            selectedCategory = category ? category : ""
            refreshing = true;
            //visible = false;
            hide();
        }

        Behavior on opacity {
            NumberAnimation {
                duration: 200
            }
        }

        onOpacityChanged: {
            if (!refreshing || opacity !== 0)
                return;
            refreshing = false;
            dbi.importProducts(productsListModel, refreshType, selectedCategory);
            show();
        }
    }
}
