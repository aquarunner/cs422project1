/*
 * File:
 * Description:
 * Author: dyoung24@uic.edu
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0

Item {
    id: container


    /* Properties
     */

    property string productDataSource: "models/ProductsModel.qml"
    property string machineDataSource: "models/MachinesModel.qml"
    property string currencyDataSource: "models/CurrenciesModel.qml"
    property string categoryDataSource: "models/CategoriesModel.qml"

    property string dbName: settings.appName + "DB"
    property string dbVer: "1.0"
    property string dbDesc: ""
    property int dbSize: 10000

    property bool alwaysReset: true
    property bool initialized: false

    /* Functions
     */

    function openDB() {
        try {
            return openDatabaseSync(dbName, dbVer, dbDesc, dbSize);
        } catch(error) {
            console.log("openDB: " + error);
        }
    }

    function resetDB() {
        var db = openDB();
        db.transaction(
                    function(tx) {
                        try {
                            tx.executeSql("DROP TABLE IF EXISTS Products");
                            tx.executeSql("DROP TABLE IF EXISTS Machines");
                            tx.executeSql("DROP TABLE IF EXISTS Currencies");
                            tx.executeSql("DROP TABLE IF EXISTS Categories");
                            tx.executeSql("DROP TABLE IF EXISTS Settings");
                        } catch(error) {
                            console.log("resetDB: " + error);
                        }
                    });
    }

    function doSql(sql) {
        var db = openDB();

        if (db === undefined) {
            console.log("doSql: Error opening the database");
            return;
        }

        var result;
        db.transaction(
                    function(tx) {
                        try {
                            result = tx.executeSql(sql);
                        } catch(error) {
                            console.log("doSql: " + error);
                        }
                    })

        return result;

    }

    function initialize() {

        if (container.alwaysReset) {
            resetDB();
        }

        var component;
        var sqlStatement;
        var result;
        var model;
        var i;


        /* Load products into the database
         */
        component = Qt.createComponent(productDataSource);
        if (component.status !== Component.Ready) {
            console.log("initialize: Product data source didn't load");
            return;
        } else {

            sqlStatement = "CREATE TABLE IF NOT EXISTS Products(id INT PRIMARY KEY, name TEXT, price REAL, image TEXT, category TEXT, favorite TEXT, allergens TEXT, machines TEXT)";
            result = doSql(sqlStatement);

            model = component.createObject(null);

            for (i = 0; i < model.count; ++i) {
                sqlStatement = "INSERT INTO Products(name,price,image,category,favorite,allergens,machines) VALUES('" +
                        model.get(i).name + "'," +
                        model.get(i).price + ",'" +
                        model.get(i).image + "','" +
                        model.get(i).category + "','" +
                        model.get(i).favorite+ "','" +
                        model.get(i).allergens + "','" +
                        model.get(i).machines + "')";
                doSql(sqlStatement);
            }
        }


        /* Load vending machines into the database
         */
        component = Qt.createComponent(machineDataSource);
        if (component.status !== Component.Ready) {
            console.log("initialize: Machine data source didn't load");
            return;
        } else {

            sqlStatement = "CREATE TABLE IF NOT EXISTS Machines(id INT PRIMARY KEY, map TEXT)";
            result = doSql(sqlStatement);

            model = component.createObject(null);

            for (i = 0; i < model.count; ++i) {
                sqlStatement = "INSERT INTO Machines(map) VALUES('" +
                        model.get(i).map + "')";
                doSql(sqlStatement);
            }
        }


        /* Load currencies into the database
         */
        component = Qt.createComponent(currencyDataSource);
        if (component.status !== Component.Ready) {
            console.log("initialize: Currency data source didn't load");
            return;
        } else {

            sqlStatement = "CREATE TABLE IF NOT EXISTS Currencies(id INT PRIMARY KEY, name TEXT, rate REAL, symbol TEXT, image TEXT)";
            result = doSql(sqlStatement);

            model = component.createObject(null);

            for (i = 0; i < model.count; ++i) {
                sqlStatement = "INSERT INTO Currencies(name, rate, symbol, image) VALUES('" +
                        model.get(i).name + "'," +
                        model.get(i).rate + ",'" +
                        model.get(i).symbol + "','" +
                        model.get(i).image + "')";
                doSql(sqlStatement);
            }
        }


        /* Load categories into the database
         */
        component = Qt.createComponent(categoryDataSource);
        if (component.status !== Component.Ready) {
            console.log("initialize: Catgegory data source didn't load");
            return;
        } else {

            sqlStatement = "CREATE TABLE IF NOT EXISTS Categories(id INT PRIMARY KEY, name TEXT)";
            result = doSql(sqlStatement);

            model = component.createObject(null);

            for (i = 0; i < model.count; ++i) {
                sqlStatement = "INSERT INTO Categories(name) VALUES('" +
                        model.get(i).name + "')";
                doSql(sqlStatement);
            }
        }


        /* Create the settings table, but don't load the settings yet
         */
        sqlStatement = "CREATE TABLE IF NOT EXISTS Settings(key TEXT, val TEXT)";
        result = doSql(sqlStatement);

        initialized = true;
    } // initialize()



    function setSetting(key, val) {
        var sqlStatement = "REPLACE INTO Settings(key, val) VALUES('" +
                key + "', '" + val + "')";
        var result = doSql(sqlStatement);


        if (result.rowsAffected !== 1) {
            console.log(result.rowsAffected);
            console.log(result.insertId);
            return false;
        } else {
            return true;
        }
    }

    function getSetting(key) {
        var sqlStatement = "SELECT val FROM Settings WHERE key = '" + key + "'";
        var result = doSql(sqlStatement);

        if (result.rows.length !== 1) {
            console.log("getSetting: no results!");
            return "";
        } else {
            return result.rows.item(0).val;
        }
    }



    function importAllProducts(model) {

        var sqlStatement = "SELECT * FROM Products";
        var results = doSql(sqlStatement);

        var r = results.rows;

        if (r.length === 0) {
            console.log("importAllProducts: no results!");
            return false;
        }

        model.clear();
        reload(model, r);
        return true;
    }

    function importFavorites(model) {

        var sqlStatement = "SELECT * FROM Products WHERE favorite <> ''";
        var results = doSql(sqlStatement);

        var r = results.rows;

        if (r.length === 0) {
            console.log("importFavorites: no results");
        }

        model.clear();
        reload(model, r);
        return true;
    }

    function importByCategory(model, category) {

        var sqlStatement = "SELECT * FROM Products WHERE category = '" + category + "'";
        var results = doSql(sqlStatement);

        var r = results.rows;

        if (r.length === 0) {
            console.log("importByCategory: no results");
        }

        model.clear();
        reload(model, r);
        return true;
    }

    function reload(model, r) {

        for (var i = 0; i < r.length; i++) {
            model.append({
                             "id": r.item(i).id,
                             "name": r.item(i).name,
                             "price": r.item(i).price,
                             "image": r.item(i).image,
                             "category": r.item(i).category,
                             "favorite": r.item(i).favorite,
                             "allergens": r.item(i).allergens,
                             "machines": r.item(i).machines
                         });

        }
    }

    function currencyExchange(price, currencyID) {

        var db = openDB();
        var rate = db.getExchangeRate(currencyID);
        var newPrice = price * rate;
        return newPrice;
    }


    /* Events
     */

    onProductDataSourceChanged: {
        if (productDataSource === "")
            return;

        //initialize();

    }

    onMachineDataSourceChanged: {

    }
}
