import QtQuick 1.0
import "components"
//import Custom 1.0

Item {
    //width: 640
    //height: 960
    // custom
    width: 360
    height: 640

    property alias settings: qmlsettings
    QMLSettings {
        id: qmlsettings
    }

    property alias lang: languages.item
    Loader {
        id: languages
        source: "./components/languages/" + settings.language + ".qml"
    }

    property alias db: dbinterface
    DBInterface {
        id: dbinterface
    }

    Flipper {
        id: vendorFlip
        front: Main {}
        back: Welcome {}
    }

}
