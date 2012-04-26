/*
 * File: OptionsContainer.qml
 * Description: Controls display of the list of options, as well as pages
 *              for selection of those options, including Allergens, Lanuage,
 *              Currency Code, and Payment Information.
 * Author: dyoung24
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0
import "../common"

MultiPage {
    id: container
    //anchors.margins: 5
    clip: true

    onVisibleChanged: {
        if (container.visible) {
            container.showPage("OptionsPage");
        }
    }

    OptionsPage {
        pageName: "OptionsPage"
        id: optionsPage

        onAccepted: {
            dbi.exportPreferences();
            playArea.showPage("Items");
        }

        onDismissed: {
            dbi.exportPreferences();
            playArea.showPage("Items");
        }
    }


    AllergenSelection {
        pageName: "AllergenSelection"

        onAccepted: {
            optionsContainer.showPage("OptionsPage");
        }

        onDismissed: {
            optionsContainer.showPage("OptionsPage");
        }
    }

    LanguageSelection {
        pageName: "LanguageSelection"

        onAccepted: {
            optionsContainer.showPage("OptionsPage");
        }

        onDismissed: {
            optionsContainer.showPage("OptionsPage");
        }


    }


    CurrencySelection {
        pageName: "CurrencySelection"

        onAccepted: {
            optionsContainer.showPage("OptionsPage");
        }

        onDismissed: {
            optionsContainer.showPage("OptionsPage");

        }
    }

    PaymentForm {
        pageName: "PaymentForm"
        parentPage: "Options"

        onAccepted: {
            optionsContainer.showPage("OptionsPage");
        }

        onDismissed: {
            optionsContainer.showPage("OptionsPage");
        }
    }

}
