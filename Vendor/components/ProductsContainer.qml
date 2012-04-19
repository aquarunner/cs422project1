import QtQuick 1.0
import "common"

MultiPage {
    id: container

    Component.onCompleted: showPage("Products")

    Products {
        pageName: "Products"
    }

    ProductMap {
        pageName: "ProductMap"
    }

    ProductFacts {
        pageName: "ProductFacts"
    }
}
