package com.naichuan;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * @author : Naichuan Zhang
 * 28-Mar-2020
 **/
public class DBConnection {

    private String filename;
    private int dbType;
    private String mysqlDriver;
    private String mysqlUrl;
    private String mysqlUsername;
    private String mysqlPassword;
    private Connection conn;

    public DBConnection() {
        conn = null;
    }

    public Connection getConn() {
        dbType = Integer.parseInt(getParam("DBType"));
        if (dbType == 1) {
            return getConnToMySql();
        }
        return null;
    }

    public Connection getConnToMySql() {
        try {
            mysqlDriver = getParam("MySQLDriver");
            mysqlUrl = getParam("MySQLURL");
            mysqlUsername = getParam("MySQLUsername");
            mysqlPassword = "";
            Class.forName(mysqlDriver).newInstance();
            conn = DriverManager.getConnection(mysqlUrl, mysqlUsername, mysqlPassword);
        } catch (SQLException | ClassNotFoundException
                | IllegalAccessException
                | InstantiationException e) {
            e.printStackTrace();
        }
        return conn;
    }

    public String getParam(String paramName) {
        filename = "../DBConfig.property";
        Properties properties = new Properties();
        try {
            InputStream inputStream = getClass().getResourceAsStream(filename);
            properties.load(inputStream);
            if (inputStream != null)
                inputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return properties.getProperty(paramName);
    }
}