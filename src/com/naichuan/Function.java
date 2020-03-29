package com.naichuan;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author : Naichuan Zhang
 * 28-Mar-2020
 **/
public class Function {
    public int strToInt(String s) {
        try {
            return Integer.parseInt(checkReplace(s));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public String checkReplace(String s) {
        try {
            if (s == null || s.equals(""))
                return "";

            StringBuffer buffer = new StringBuffer();
            for (int i = 0; i < s.length(); i++) {
                char c = s.charAt(i);
                switch (c) {
                    case '"':
                        buffer.append("&quot;");
                        break;
                    case '\'':
                        buffer.append("&#039;");
                        break;
                    case '|':
                        buffer.append("");
                        break;
                    case '&':
                        buffer.append("&amp;");
                        break;
                    case '<':
                        buffer.append("&lt;");
                        break;
                    case '>':
                        buffer.append("&gt;");
                        break;
                    default:
                        buffer.append(c);
                }
            }
            return buffer.toString().trim();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    public String pageFront(String sPage, ResultSet rs, int intPage, int intPageSize) {
        StringBuffer sb = new StringBuffer();
        String s = null;

        int i = 0;
        try {
            rs.last();

            int intRowCount = rs.getRow();
            int intPageCount;
            if (intRowCount % intPageSize == 0)
                intPageCount = intRowCount / intPageSize;
            else
                intPageCount = (int) Math.floor(intRowCount / intPageSize) + 1;
            if (intPageCount == 0)
                intPageCount = 1;

            if (intPage < 1)
                intPage = 1;
            if (intPage > intPageCount)
                intPage = intPageCount;

            if (intRowCount > intPageSize) {
                s = "<table  width=\"90%\"  border=\"0\" align=\"left\" cellpadding=\"2\" cellspacing=\"0\"><tr>";
                s = s + "<td style=\"text-align:left\" width=\"80%\" height=\"30\" class=\"chinese\"><span class=\"chinese\">";
                s = s + "当前第" + intPage + "页/共" + intPageCount + "页,&nbsp;&nbsp;&nbsp;&nbsp;共" + intRowCount
                        + "条记录,&nbsp;&nbsp;&nbsp;&nbsp;" + intPageSize
                        + "条/页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";

                int showye = intPageCount;
                if (showye > 10)
                    showye = 10;
                for (i = 1; i <= showye; i++) {
                    if (i == intPage)
                        s = s + " " + i + " ";
                    else {
                        s = s + "&nbsp; <a style=\"color:#3F862E\" href=\"" + sPage + "intPage=" + i + "\">" + i
                                + "</a> ";
                    }
                }
                s = s + "</span></td>";

                return s + "</tr></table>";
            }

            return "";
        } catch (Exception e) {
        }
        return "分页出错!";
    }

    public boolean checkLogin(Connection conn, String s1, String s2) throws SQLException {
        Statement stmt = conn.createStatement();
        ResultSet rs = null;
        boolean ok = true;
        int adminID = 0;
        int adminType = 0;
        String adminPwd = "";
        String user = checkReplace(s1);
        String pwd = checkReplace(s2);
        String sql = "SELECT * FROM admin WHERE AdminName='" + user + "'";
        rs = stmt.executeQuery(sql);
        if (!rs.next()) {
            ok = false;
        } else {
            adminPwd = rs.getString("AdminPwd");
            if (pwd.equals(adminPwd)) {
                adminID = rs.getInt("AdminID");
                adminType = rs.getInt("AdminType");
                ok = true;
            } else {
                ok = false;
            }
        }
        return ok;
    }
}
