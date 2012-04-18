/*
 * File:
 * Description:
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0

Item {
    anchors.fill: parent
    ListView {
        anchors.fill: parent
        model: ListModel { id: testModel }

        Component.onCompleted: {
            dbi.initialize();
            var p = dbi.getProducts();

            for (var i = 0; i < p.length; i++) {
                testModel.append({
                                     "name": p.item(i).name,
                                     "price": p.item(i).price,
                                     "image": p.item(i).image
                                 });

            }
        }


        delegate: Item {
            id: testDel
            anchors.left: parent.left
            anchors.right: parent.right
            height: 100

            Text {
                //id: name
                text: qsTr("%1 %2 %3").arg(name).arg(price).arg(image)
                anchors.centerIn: parent
            }
        }
    }
}
