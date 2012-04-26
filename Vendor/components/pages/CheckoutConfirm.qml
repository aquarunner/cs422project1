import QtQuick 1.0
import "../common"

MultiPage {
    id: container

    onVisibleChanged: {
        if (container.visible) {
            if (!settings.paymentNumber) {
                checkoutConfirm.showPage("PaymentForm");
            } else {

                checkoutConfirm.showPage("ConfirmPage");
            }
        }
    }


    SimplePage{
        id: confirmPage
        pageName: "ConfirmPage"

        Column {
            spacing: 50
            anchors.centerIn: parent

            OptionText {
                text: translator.confirmText
                width: container.width
                horizontalAlignment: Text.AlignHCenter
            }

            OptionText {
                text: settings.preferredCurrencyCode + " " + dbi.currencyExchange(settings.totalPrice, settings.preferredCurrencyCode)
                width: container.width
                horizontalAlignment: Text.AlignHCenter
            }

            Button {
                label: translator.confirmChargeText
                anchors.horizontalCenter: parent.horizontalCenter

                onClicked: {
                    main.checkout();
                    itemsPage.showFront();
                }
            }

            Button {
                label: translator.backToItemsText
                anchors.horizontalCenter: parent.horizontalCenter

                onClicked: {
                    itemsPage.showFront();
                }
            }
        }
    }



    PaymentForm {
        pageName: "PaymentForm"

        onAccepted: {
            main.checkout();
            itemsPage.showFront();
        }

        onDismissed: {
            itemsPage.showFront();
            notificationPop.show("Checkout Canceled");
        }

    }
}
