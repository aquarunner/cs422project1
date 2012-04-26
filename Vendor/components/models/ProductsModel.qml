/*
 * File: ProductsModel.qml
 * Description: Data to simulate available product selections independent of vending machines.
 * Author: dyoung24
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0

ListModel{


    ListElement {
        name: "Skittlez Is Really Long"
        price: 1.50
        image: "../images/products/coke.png"
        category: "Candy"
        favorite: ""
        allergens: ""
        nutritionData: "../images/nutrition/skittles.png"
    }

    ListElement {
        name: "M&Ms"
        price: 1.75
        image: ""
        category: "Candy"
        favorite: ""
        allergens: "Egg MSG"
        nutritionData: ""
    }
    ListElement {
        name: "Chips Ahoy"
        price: 1.00
        image: ""
        category: "Cookies"
        favorite: ""
        allergens: "peanuts"
        nutritionData: ""
    }
    ListElement {
        name: "Chips Ahoy"
        price: 1.00
        image: "../images/products/coke.png"
        category: "Cookies"
        favorite: ""
        allergens: ""
        nutritionData: ""
    }
    ListElement {
        name: "Chips Ahoy"
        price: 1.00
        image: ""
        category: "Cookies"
        favorite: ""
        allergens: ""
        nutritionData: ""
    }
    ListElement {
        name: "Chips Ahoy"
        price: 1.00
        image: "../images/products/coke.png"
        category: "Cookies"
        favorite: "Yes"
        allergens: ""
        nutritionData: ""
    }
    ListElement {
        name: "Chips Ahoy"
        price: 1.00
        image: "../images/products/coke.png"
        category: "Cookies"
        favorite: ""
        allergens: ""
        nutritionData: ""
    }
}
