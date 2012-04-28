/*
 * File: Vendor.qml
 * Description: Launcher for the Vendor application
 * Author: dyoung24
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

    //width: 960
    //height: 640

    width: 360
    height: 640

   Component.onCompleted: {
        if (settings.firstRun == false) {
            vendorFlip.showBack();
        }


        if (settings.initDBOnLoad) {
            dbi.initialize();
        }

        dbi.importPreferences();
    }


    FlipablePage {
        id: vendorFlip
        front: Welcome {
            onAccepted: {
                vendorFlip.showBack();
            }

            onDismissed: {
                vendorFlip.showBack();
            }
        }
        back: Main { id: main }
    }


    property alias settings: qmlsettings
    DefaultSettings {
        id: qmlsettings
    }


    property alias translator: languages.item
    Loader {
        id: languages
        source: "./components/languages/" + settings.preferredLanguage + ".qml"
    }


    property alias dbi: dbinterface
    DBIntegration {
        id: dbinterface
    }
}
