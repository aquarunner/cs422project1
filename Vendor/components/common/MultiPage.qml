/*
 * File: Multipage.qml
 * Description: Reusable QML item
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0

Item {
    id: container
    anchors.fill: container.fill ? parent : undefined
    property bool fill: true

    Component.onCompleted: {
        hideAll();
    }

    function hideAll() {
        var i = 0;
        var o = container.children[i];
        while (o !== undefined) {
            if (o.pageName) {
                o.hide();
                //o.visible = false;
            }

            i++;
            o = container.children[i];
        }
    }


    function showPage(page) {

        container.hideAll();

        var i = 0;
        var o = container.children[i];
        while (o !== undefined) {
            if (o.pageName === page) {
                o.show();
                //o.visible = true;
                return;
            }

            i++;
            o = container.children[i];
        }

    }
}
