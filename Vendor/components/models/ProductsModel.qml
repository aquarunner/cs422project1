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
        name: "Zoo Animal Crackers"
        price: 1.25
        image: "../images/products/Zoo.png"
        category: "Cookies"
        favorite: "Yes"
        allergens: "Corn Wheat"
        nutritionData: "../images/nutrition/nutrition_image.png"
    }
    ListElement {
        name: "Reeses Pieces"
        price: 1.00
        image: "../images/products/Reeses.png"
        category: "Candy"
        favorite: ""
        allergens: "Milk"
        nutritionData: "../images/nutrition/nutrition_image.png"
    }
    ListElement {
        name: "Chips Ahoy"
        price: 1.00
        image: "../images/products/ChipsAhoy.png"
        category: "Cookies"
        favorite: ""
        allergens: ""
        nutritionData: "../images/nutrition/nutrition_image.png"
    }
    ListElement {
        name: "Fritos"
        price: 1.00
        image: "../images/products/Fritos.png"
        category: "Chips"
        favorite: ""
        allergens: "Corn Wheat"
        nutritionData: "../images/nutrition/nutrition_image.png"
    }
    ListElement {
        name: "Cheetos"
        price: 1.00
        image: "../images/products/Cheetos.png"
        category: "Chips"
        favorite: ""
        allergens: ""
        nutritionData: "../images/nutrition/nutrition_image.png"
    }
    ListElement {
        name: "Lays Classic"
        price: 1.25
        image: "../images/products/LaysClassic.png"
        category: "Chips"
        favorite: ""
        allergens: "Oats"
        nutritionData: "../images/nutrition/nutrition_image.png"
    }
    ListElement {
        name: "Lays Baked"
        price: 1.25
        image: "../images/products/LaysBaked.png"
        category: "Chips"
        favorite: ""
        allergens: "Treenut"
        nutritionData: "../images/nutrition/nutrition_image.png"
    }
    ListElement {
        name: "Butterfinger"
        price: 1.25
        image: "../images/products/Butterfinger.png"
        category: "Candy"
        favorite: ""
        allergens: "Gluten"
        nutritionData: "../images/nutrition/nutrition_image.png"
    }
    ListElement {
        name: "Milky Way"
        price: 1.25
        image: "../images/products/Milkyway.png"
        category: "Candy"
        favorite: ""
        allergens: "Milk Egg"
        nutritionData: "../images/nutrition/nutrition_image.png"
    }
    ListElement {
        name: "Twix"
        price: 1.00
        image: "../images/products/Twix.png"
        category: "Candy"
        favorite: ""
        allergens: "Milk Egg"
        nutritionData: "../images/nutrition/nutrition_image.png"
    }
    ListElement {
        name: "Doublemint"
        price: 0.75
        image: "../images/products/Doublemint.png"
        category: "Gum"
        favorite: ""
        allergens: "Sulphites"
        nutritionData: "../images/nutrition/nutrition_image.png"
    }
    ListElement {
        name: "Wrigleys"
        price: 1.25
        image: ""
        category: "Gum"
        favorite: ""
        allergens: "Sulphites"
        nutritionData: "../images/nutrition/nutrition_image.png"
    }
    ListElement {
        name: "Trident"
        price: 0.50
        image: ""
        category: "Gum"
        favorite: ""
        allergens: ""
        nutritionData: "../images/nutrition/nutrition_image.png"
    }
    ListElement {
        name: "Starbucks Small"
        price: 1.75
        image: "../images/products/Coffee.png"
        category: "Coffee"
        favorite: ""
        allergens: "MSG"
        nutritionData: "../images/nutrition/nutrition_image.png"
    }
    ListElement {
        name: "Starbucks Large"
        price: 2.25
        image: "../images/products/Coffee.png"
        category: "Coffee"
        favorite: ""
        allergens: "MSG"
        nutritionData: "../images/nutrition/nutrition_image.png"
    }

    ListElement {
        name: "M&Ms"
        price: 1.50
        image: ""
        category: "Candy"
        favorite: ""
        allergens: ""
        nutritionData: "../images/nutrition/nutrition_image.png"
    }
    ListElement {
        name: "Aquafina"
        price: 1.50
        image: "../images/products/Aquafina.png"
        category: "Beverages"
        favorite: ""
        allergens: ""
        nutritionData: "../images/nutrition/nutrition_image.png"
    }
    ListElement {
        name: "Coke"
        price: 1.50
        image: "../images/products/Coke.png"
        category: "Beverages"
        favorite: ""
        allergens: ""
        nutritionData: "../images/nutrition/nutrition_image.png"
    }
    ListElement {
        name: "Pepsi"
        price: 1.50
        image: "../images/products/Pepsi.png"
        category: "Beverages"
        favorite: ""
        allergens: ""
        nutritionData: "../images/nutrition/nutrition_image.png"
    }


}
