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
            playArea.showPage("Items");
        }

        onDismissed: {
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

        onAccepted: {
            optionsContainer.showPage("OptionsPage");
        }

    }

}
