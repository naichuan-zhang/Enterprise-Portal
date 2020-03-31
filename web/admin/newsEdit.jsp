<%--
  Created by IntelliJ IDEA.
  User: Mattias Chang
  Date: 3/29/2020
  Time: 11:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.naichuan.*" %>

<%
    request.setCharacterEncoding("UTF-8");
    News news = new News();
    String newsID = request.getParameter("newsId");
    String action = request.getParameter("Action");
    if (action != null && action.equalsIgnoreCase("Edit")) {
        String ip = request.getRemoteAddr();
        String adminName = (String) session.getAttribute("adminUser");
        String[] s = new String[2];
        s[0] = request.getParameter("upd_NewsTitle");
        s[1] = request.getParameter("upd_NewsContent");
        String sOK = news.editNews(s, newsID, adminName, ip);
        if (sOK.equalsIgnoreCase("Yes")) {
            out.println("<script>alert('修改新闻成功！'); location.href = 'news.jsp';</script>");
        } else {
            out.println("<script>alert('修改新闻失败！！'); location.href = 'news.jsp';</script>");
        }
    }
%>
