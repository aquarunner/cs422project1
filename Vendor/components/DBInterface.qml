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

    property string productDataSource: "models/Products.qml"
    property string machineDataSource: "models/Machines.qml"
    property string currencyDataSource: "models/Currencies.qml"
    property string categoryDataSource: "models/Categories.qml"

    property string dbName: settings.appName + "DB"
    property string dbVer: "1.0"
    property string dbDesc: ""
    property int dbSize: 10000

    property bool alwaysReset: true

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

            sqlStatement = "CREATE TABLE IF NOT EXISTS Products(id INT PRIMARY KEY, name TEXT, price REAL, image TEXT, category TEXT, favorite INT, allergens TEXT, machines TEXT)";
            result = doSql(sqlStatement);

            model = component.createObject(null);

            for (i = 0; i < model.count; ++i) {
                sqlStatement = "INSERT INTO Products(name,price,image,category,favorite,allergens,machines) VALUES('" +
                        model.get(i).name + "'," +
                        model.get(i).price + ",'" +
                        model.get(i).image + "','" +
                        model.get(i).category + "'," +
                        model.get(i).favorite+ ",'" +
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



    function getProducts() {
        var db = openDB();

        if (db === undefined) {
            return;
        }

        var results;
        try {
            db.transaction(function(tx) {
                               try {
                                   results = tx.executeSql('SELECT * FROM Products');
                               } catch(error) {
                                   console.log(error);
                               }
                           });
        } catch(error) {
            console.log(error);
        }

        if (parseInt(results.rows.length)) {
            return results.rows;
        } else {
            console.log("getProducts: no results!");
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
