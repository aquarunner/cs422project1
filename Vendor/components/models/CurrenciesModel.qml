/*
 * File:
 * Description:
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012


http://www.xe.com/symbols.php#section3
http://www.xe.com/ucc/convert/?Amount=1&From=USD&To=USD#converter
4-21-2012 9:45am

USD US Dollar 1
CNY Chinese Yuan Renminbi 6.30580
GBP British Pound 0.620097
EUR Euro 0.756450
CAD Canadian Collar 0.991950
INR Indian Rupee 52.0800
AUD Australian Dollar 0.963020

 */

import QtQuick 1.0

ListModel{

    ListElement {
        name: "US Dollar"
        code: "USD"
        rate: 1.0
    }

    ListElement {
        name: "Chinese Yuan Renminbi"
        code: "CNY"
        rate: 6.30580
    }

    ListElement {
        name: "British Pound"
        code: "GBP"
        rate: 0.620097
    }

    ListElement {
        name: "Euro"
        code: "EUR"
        rate: 0.756450
    }

    ListElement {
        name: "Canadian Collar"
        code: "CAD"
        rate: 0.991950
    }

    ListElement {
        name: "Indian Rupee"
        code: "INR"
        rate: 52.0800
    }

    ListElement {
        name: "Australian Dollar"
        code: "AUD"
        rate: 0.963020
    }
}
