package com.naichuan;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * @author : Naichuan Zhang
 * 29-Mar-2020
 **/
public class Login {
    DBConnection dbConn = new DBConnection();
    Function func = new Function();
    public static int adminID = 0;
    public static int adminType = 0;

    public Login() {

    }

    /**
     * check login
     * @param s1 username
     * @param s2 password
     * @return boolean type
     */
    public boolean loginCheck(String s1, String s2) {
        try {
            Connection conn = dbConn.getConn();
            return func.checkLogin(conn, s1, s2);
        } catch (SQLException e) {
            return false;
        }
    }
}
