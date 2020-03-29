package com.naichuan;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author : Naichuan Zhang
 * 28-Mar-2020
 **/
public class News {

    DBConnection dbConn = new DBConnection();
    Function func = new Function();

    public String listNewsFront(String sPage, String strPage) {
        try {
            Connection conn = dbConn.getConn();
            Statement stmt = conn.createStatement();
            ResultSet rs = null;
            String sql = "SELECT * FROM news ORDER BY NewsID desc";
            rs = stmt.executeQuery(sql);
            StringBuffer buffer = new StringBuffer();

            int i;
            int intPage = 1;
            int intPageSize = 5;

            if (!rs.next()) {
                buffer.append("" +
                        "<tr height='25' bgcolor='#d6dff7' class='info1'>" +
                            "<td colspan='5'>" +
                                "<div align='center'><b>没有记录！</b></div>" +
                            "</td>" +
                        "</tr>");
            } else {
                intPage = func.strToInt(strPage);
                sPage = func.checkReplace(sPage);
                if (intPage == 0)
                    intPage = 1;
                rs.absolute((intPage - 1) * intPageSize + 1);
                i = 0;
                while (i < intPageSize && !rs.isAfterLast()) {
                    int newsId = rs.getInt("NewsID");
                    String newsTitle = rs.getString("NewsTitle");
                    String newsTime = rs.getString("NewsTime");
                    String adminName = rs.getString("AdminName");
                    buffer.append("<tr>" +
                                     "<td>" + newsTitle + "</td>" +
                                     "<td>" + adminName + "</td>" +
                                     "<td>" + newsTime + "</td>" +
                                     "<td><a style='color: #3f862e' target='_blank' href='newsFrontDetails.jsp?newsId=" + newsId + "'>详情</a></td>" +
                                  "</tr>");
                    rs.next();
                    i++;
                }
                buffer.append(func.pageFront(sPage, rs, intPage, intPageSize));
            }
            rs.close();
            stmt.close();
            conn.close();
            return buffer.toString();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // Error occurs
        return "No";
    }

    public String newsDetails(String sB) {
        try {
            Connection conn = dbConn.getConn();
            Statement stmt = conn.createStatement();
            ResultSet rs = null;
            int newsID = func.strToInt(sB);
            if (newsID == 0) {
                return "No";
            } else {
                try {
                    String sql = "SELECT * FROM news WHERE NewsID=" + newsID;
                    rs = stmt.executeQuery(sql);
                    StringBuffer buffer = new StringBuffer();
                    int i = 0;
                    while (i < 1 && !rs.isAfterLast()) {
                        rs.next();
                        String newsTitle = rs.getString("NewsTitle");
                        String newsContent = rs.getString("NewsContent");
                        String[] content = newsContent.split("#");
                        buffer.append("<br><h2 style='font-size: 28px; margin-left: 30%;'>" + newsTitle + "</h2>");
                        for (int j = 0; j < content.length; j++) {
                            buffer.append("<p>" + content[j] + "</p>");
                        }
                        rs.next();
                        i++;
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                    return buffer.toString();
                } catch (Exception e) {
                    e.printStackTrace();
                    return "No";
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "No";
        }
    }
}
