/*
 * File: Vendor.qml
 * Description: Launcher for the Vendor application
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Date: 4-26-2012
 */

import QtQuick 1.0
import "components/pages"
import "components/common"

Item {
    id: vendor


    //width: 640
    //height: 960


    width: 360
    height: 640

   Component.onCompleted: {
        if (settings.firstRun == false) {
            vendorFlip.showBack();
        }


        if (settings.initDBOnLoad) {
            dbi.initialize();
        }
    }


    FlipablePage {
        id: vendorFlip
        front: Welcome {}
        back: Main {}
    }


    property alias settings: qmlsettings
    QMLSettings {
        id: qmlsettings
    }


    property alias translator: languages.item
    Loader {
        id: languages
        source: "./components/languages/" + settings.preferredLanguage + ".qml"
    }


    property alias dbi: dbinterface
    DBInterface {
        id: dbinterface
    }
}
