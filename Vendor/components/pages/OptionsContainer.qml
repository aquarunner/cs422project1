/*
 * File:
 * Description:
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0
import "../common"

MultiPage {
    id: container
    anchors.margins: 5
    clip: true

    onVisibleChanged: {
        if (container.visible) {
            container.showPage("OptionsPage");
        }
    }

    OptionsPage {
        pageName: "OptionsPage"
        id: optionsPage
    }

    AllergensSelection {
        pageName: "AllergensSelection"

        onAccepted: {
            optionsArea.showPage("OptionsPage");
        }

        onDismissed: {
            optionsArea.showPage("OptionsPage");
        }
    }

    LanguageSelection {
        pageName: "LanguageSelection"

        onAccepted: {
            optionsArea.showPage("OptionsPage");
        }

        onDismissed: {
            optionsArea.showPage("OptionsPage");
        }


    }


    CurrencySelection {
        pageName: "CurrencySelection"

        onAccepted: {
            optionsArea.showPage("OptionsPage");
        }

        onDismissed: {
            optionsArea.showPage("OptionsPage");
        }

    }

    PaymentForm {
        pageName: "PaymentForm"

        onAccepted: {
            optionsArea.showPage("OptionsPage");
        }

        onDismissed: {
            optionsArea.showPage("OptionsPage");
        }

    }

}
