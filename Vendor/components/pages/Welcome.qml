/*
 * File: Welcome.qml
 * Description: Greeting shown when the program is first run
 * Author: dyoung24
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0
import "../common"

SimplePage {
    id: container

    Rectangle {
        anchors.fill: parent
        color: settings.canvasColor


        MultiPage {
            id: welcomeContainer

            Component.onCompleted: {
                showPage("WelcomePage");
            }


            SimplePage {
                pageName: "WelcomePage"
                //anchors.topMargin: 50

                Column {
                    //anchors.fill: parent
                    anchors.centerIn: parent
                    spacing: 40

                    OptionText {
                        text: translator.welcomeText
                        width: parent.width
                        horizontalAlignment: Text.AlignHCenter
                    }
                    OptionText {
                        text: translator.welcomeHint
                        width: parent.width
                        horizontalAlignment: Text.AlignHCenter
                        wrapMode: Text.Wrap
                    }
                    Button {
                        label: translator.yesText
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            welcomeContainer.showPage("PaymentForm");
                        }
                    }
                    Button {
                        label: translator.noText
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            container.dismissed();
                        }
                    }
                }


            }



            PaymentForm {
                pageName: "PaymentForm"

                onAccepted: {
                    vendorFlip.showBack();
                }

                onDismissed: {
                    vendorFlip.showBack();
                }
            }
        }

    }
}
