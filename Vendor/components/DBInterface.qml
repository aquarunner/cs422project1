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
    id: container

    property string productDataSource //: "models/" + settings.language + "/Products.qml"

    onProductDataSourceChanged: {
        if (productDataSource === "")
            return;
    }


    property string machineDataSource //: "models/Machines.qml"

    onMachineDataSourceChanged: {

    }
}
