/*
 * File: DBInterface.qml
 * Description: Procedures for interacting with local sqlite storage.
 * Author: dyoung24
 * Instructor: Johnson
 * Course: CS 422
 * Date: 4-26-2012
 */

import QtQuick 1.0

Item {
    id: container


    /* Properties
     */

    property string productDataSource: "../models/ProductsModel.qml"
    property string machineDataSource: "../models/MachinesModel.qml"
    property string currencyDataSource: "../models/CurrenciesModel.qml"

    property string dbName: settings.appName + "DB"
    property string dbVer: "1.0"
    property string dbDesc: ""
    property int dbSize: 10000

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
                            tx.executeSql("DROP TABLE IF EXISTS Settings");
                            tx.executeSql("DROP TABLE IF EXISTS History");
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

        if (settings.alwaysReset) {
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

            sqlStatement = "CREATE TABLE IF NOT EXISTS Products(id INTEGER PRIMARY KEY, name TEXT, price REAL, image TEXT, category TEXT, favorite TEXT, allergens TEXT, nutritionData TEXT)";
            doSql(sqlStatement);

            result = doSql("SELECT * FROM Products");

            // Only import if table is not populated
            if (result.rows.length === 0) {

                model = component.createObject(null);

                for (i = 0; i < model.count; ++i) {
                    sqlStatement = "INSERT INTO Products(name,price,image,category,favorite,allergens,nutritionData) VALUES('" +
                            model.get(i).name + "'," +
                            model.get(i).price + ",'" +
                            model.get(i).image + "','" +
                            model.get(i).category + "','" +
                            model.get(i).favorite+ "','" +
                            model.get(i).allergens + "','" +
                            model.get(i).nutritionData + "')";
                    doSql(sqlStatement);
                }
            }
        }


        /* Load vending machines into the database
         */
        component = Qt.createComponent(machineDataSource);
        if (component.status !== Component.Ready) {
            console.log("initialize: Machine data source didn't load");
            return;
        } else {

            sqlStatement = "CREATE TABLE IF NOT EXISTS Machines(id INTEGER PRIMARY KEY, map TEXT, description TEXT, inventory TEXT)";
            doSql(sqlStatement);

            result = doSql("SELECT * FROM Machines");

            // Only import if table is not populated
            if (result.rows.length === 0) {

                model = component.createObject(null);

                for (i = 0; i < model.count; ++i) {
                    sqlStatement = "INSERT INTO Machines(map,description,inventory) VALUES('" +
                            model.get(i).map + "','" +
                            model.get(i).description + "','" +
                            model.get(i).inventory + "')";
                    doSql(sqlStatement);
                }
            }
        }


        /* Load currencies into the database
         */
        component = Qt.createComponent(currencyDataSource);
        if (component.status !== Component.Ready) {
            console.log("initialize: Currency data source didn't load");
            return;
        } else {

            sqlStatement = "CREATE TABLE IF NOT EXISTS Currencies(id INTEGER PRIMARY KEY, name TEXT, rate REAL, code TEXT)";
            doSql(sqlStatement);

            result = doSql("SELECT * FROM Currencies");

            // Only import if table is not populated
            if (result.rows.length === 0) {

                model = component.createObject(null);

                for (i = 0; i < model.count; ++i) {
                    sqlStatement = "INSERT INTO Currencies(name, rate, code) VALUES('" +
                            model.get(i).name + "'," +
                            model.get(i).rate + ",'" +
                            model.get(i).code + "')";
                    doSql(sqlStatement);
                }
            }
        }


        /* Create the settings table
         */
        sqlStatement = "CREATE TABLE IF NOT EXISTS Settings(key TEXT, val TEXT)";
        result = doSql(sqlStatement);


        /* Create the history table
         */
        sqlStatement = "CREATE TABLE IF NOT EXISTS History(id INTEGER PRIMARY KEY, prod_id TEXT, timestamp TEXT)";
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
            //console.log("getSetting: no results!");
            return "";
        } else {
            return result.rows.item(0).val;
        }
    }


    // type is All, Favorites or Category
    function importProducts(model, type, category) {

        var sqlStatement;
        if (type === "Favorites")
            sqlStatement = "SELECT * FROM Products WHERE favorite <> '' ORDER BY name";
        else if (type === "All")
            sqlStatement = "SELECT * FROM Products ORDER BY name";
        else if (type === "Category")
            sqlStatement = "SELECT * FROM Products WHERE category = '" + category + "' ORDER BY name";
        var results = doSql(sqlStatement);

        var r = results.rows;

        if (r.length === 0) {
            //console.log("importProducts: no results");
        }

        model.clear();
        reload(model, r);
        return true;

    }


    function importHistory(model) {

        var sqlStatement = "SELECT * FROM History";
        var results = doSql(sqlStatement);

        var p;
        var r = results.rows;

        if (r.length === 0) {
            //console.log("importHistory: no results");
        }

        model.clear();

        for (var i = 0; i < r.length; i++) {

            p = getProductInfo(r.item(i).prod_id);
            model.append({"name": p.name, "timestamp": r.item(i).timestamp});
        }

        return true;
    }


    function importCurrencies(model) {

        var sqlStatement = "SELECT * FROM currencies";
        var results = doSql(sqlStatement);

        var r = results.rows;

        if (r.length === 0) {
            //console.log("importCurrencies: no results");
        }

        model.clear();

        for (var i = 0; i < r.length; i++) {
            model.append({
                             "name": r.item(i).name,
                             "code": r.item(i).code,
                             "rate": r.item(i).rate
                         });
        }

        return true;
    }


    function importCategories(model) {

        var sqlStatement = "SELECT DISTINCT category FROM Products";
        var results = doSql(sqlStatement);

        var r = results.rows;

        if (r.length === 0) {
            //console.log("importByCategory: no results");
        }

        model.clear();

        for (var i = 0; i < r.length; i++) {
            model.append({"name": r.item(i).category});
        }

        return true;
    }


    function importCartItems(model, itemsString) {

        model.clear();
        var sqlStatement;
        var result;

        if (itemsString === "") {
            //console.log("importCartItems: itemsString was empty");
            return;
        }

        var items = main.trim(itemsString).split(" ");

        for (var i = 0; i < items.length; ++i) {
            sqlStatement = "SELECT * FROM Products WHERE id = " + items[i];
            result = doSql(sqlStatement);
            reload(model, result.rows);
        }

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
                             "nutritionData": r.item(i).nutritionData
                         });

        }
    }

    function currencyExchange(price, currencyCode) {

        if (price === 0) {
            return "0.0";
        }

        var sqlStatement = "SELECT rate FROM Currencies WHERE code = '" + currencyCode + "'";
        var result = doSql(sqlStatement);

        if (result.rows.length !== 1) {
            console.log("currencyExchange: incorrect row length: " + result.rows.length);
            return "0";
        }

        var rate = result.rows.item(0).rate;
        var exchange = price * rate;

        // Returns string representation of float with decimal precision of 2
        return parseFloat(exchange).toFixed(2);
    }

    function addFavorite(id) {
        var sqlStatement = "UPDATE Products SET favorite='Yes' WHERE id=" + id + "";
        var result = doSql(sqlStatement);

        if (result === undefined || result.rowsAffected !== 1) {
            console.log("addFavorite: Incorrect rows affected: " +  result.rowsAffected);
        }
    }

    function removeFavorite(id) {
        var sqlStatement = "UPDATE Products SET favorite='' WHERE id=" + id;
        var result = doSql(sqlStatement);

        if (result.rowsAffected !== 1) {
            console.log("removeFavorite: Incorrect rows affected: " +  result.rowsAffected);
        }
    }


    function getProductInfo(id) {
        var sqlStatement = "SELECT * FROM Products WHERE id = " + id;
        var result = doSql(sqlStatement);

        if (result.rows.length !== 1) {
            console.log("getProductInfo: Incorrect row length: " +  result.rows.length);
        }

        return result.rows.item(0);

    }

    function getMachineInfo(id) {
        var sqlStatement = "SELECT * FROM Machines WHERE id = " + id;
        var result = doSql(sqlStatement);

        if (result.rows.length !== 1) {
            console.log("getMachineInfo: Incorrect row length: " +  result.rows.length);
        }

        return result.rows.item(0);

    }



    function addToHistory(itemsString) {

        var items = main.trim(itemsString).split(" ");

        var sqlStatement;
        var result;
        var d = new Date();

        var timestamp = d.toLocaleString();

        for (var i = 0; i < items.length; ++i) {
            sqlStatement = "INSERT INTO History (prod_id, timestamp) VALUES (" + items[i] + ", '" + timestamp + "')";
            result = doSql(sqlStatement);
        }

    }

    function clearHistory() {
        var sqlStatement = "DELETE FROM History";
        var result = doSql(sqlStatement);

    }



    function exportPreferences() {
        //setSetting("firstRun", settings.firstRun);
        setSetting("preferredCurrencyCode", settings.preferredCurrencyCode);
        setSetting("preferredLanguage", settings.preferredLanguage);
        setSetting("paymentName", settings.paymentName);
        setSetting("paymentNumber", settings.paymentNumber);
        setSetting("paymentCVV", settings.paymentCVV);
        setSetting("paymentExpiry", settings.paymentExpiry);
        setSetting("restrictedItems", settings.restrictedItems);
    }


    function importPreferences() {
        //settings.firstRun = getSetting("firstRun") ? true : true;
        settings.preferredCurrencyCode = getSetting("preferredCurrencyCode") ? getSetting("preferredCurrencyCode") : settings.preferredCurrencyCode;
        settings.preferredLanguage = getSetting("preferredLanguage") ? getSetting("preferredLanguage") : settings.preferredLanguage;
        settings.paymentName = getSetting("paymentName");
        settings.paymentNumber = getSetting("paymentNumber");
        settings.paymentCVV = getSetting("paymentCVV");
        settings.paymentExpiry = getSetting("paymentExpiry");
        settings.restrictedItems = getSetting("restrictedItems");
    }
}
