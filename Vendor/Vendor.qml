import QtQuick 1.0
import "components"
import Custom 1.0

Item {
    //width: 640
    //height: 960
    // custom
    width: 360
    height: 640

    QMLSettings {
        id: qmlsettings
    }

    Loader {
        id: lang
        source: "./components/languages/"+qmlsettings.language+".qml"
    }

    Flipper {
        id: vendorFlip
        front: Main {}
        back: Welcome {}
    }

}
