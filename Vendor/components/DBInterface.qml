import QtQuick 1.0

Component {
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
