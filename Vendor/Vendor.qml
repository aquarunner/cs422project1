/*
 * File: Vendor.qml
 * Description: Launcher for the Vendor application
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Date: 4-26-2012
 */

import QtQuick 1.0
import "components"
import "components/common"
//import Custom 1.0

Item {
    id: vendor

    /*
    width: 640
    height: 960
    */

    width: 360
    height: 640


    Component.onCompleted: {
        // If this is the first time running the program,
        // show the welcome page.
        if (settings.firstRun) {
            //vendorFlip.showBack();
        }


        if (settings.initDBOnLoad) {
            dbi.initialize();
        }
    }


    Flipper {
        id: vendorFlip
        front: Main {}
        back: Welcome {}
    }


    property alias settings: qmlsettings
    QMLSettings {
        id: qmlsettings
    }


    property alias translator: languages.item
    Loader {
        id: languages
        source: "./components/languages/" + settings.language + ".qml"
    }


    property alias dbi: dbinterface
    DBInterface {
        id: dbinterface
    }
}
