package com.naichuan;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author : Naichuan Zhang
 * 29-Mar-2020
 **/
public class User {

    DBConnection dbConn = new DBConnection();
    Function func = new Function();

    public String listUser(String sPage, String strPage) {
        try {
            Connection conn = dbConn.getConn();
            Statement stmt = conn.createStatement();
            ResultSet rs = null;
            StringBuffer buffer = new StringBuffer();

            int i;
            int intPage = 1;
            int intPageSize = 5;

            String sql = "SELECT * FROM admin ORDER BY AdminID desc";
            rs = stmt.executeQuery(sql);
            if (!rs.next()) {
                buffer.append("<tr height=\"25\" bgcolor=\"#d6dff7\"  class=\"info1\"><td colspan=\"4\">\r\n");
                buffer.append("<div align=\"center\"><b>û���û�!</b></div></td></tr>\r\n");
            } else {
                intPage = func.strToInt(strPage);
                sPage = func.checkReplace(sPage);
                if (intPage == 0)
                    intPage = 1;
                rs.absolute((intPage - 1) * intPageSize + 1);
                i = 0;
                while (i < intPageSize && !rs.isAfterLast()) {
                    int adminID = rs.getInt("AdminID");
                    String adminName = rs.getString("AdminName");
                    String adminPwd = rs.getString("AdminPwd");
                    String adminType = rs.getString("AdminType");
                    String lastLoginTime = rs.getString("LastLoginTime");

                    buffer.append("<tr>" +
                                     "<td class='table-id'>" + adminID + "</td>" +
                                     "<td class='table-title'>" + adminPwd + "</td>" +
                                     "<td class='table-title'>" + lastLoginTime + "</td> " +
                                  "</tr>");
                    rs.next();
                    i++;
                }
            }
            rs.close();
            stmt.close();
            conn.close();
            return buffer.toString();
        } catch (SQLException e) {
            e.printStackTrace();
            return "No";
        }
    }
}
