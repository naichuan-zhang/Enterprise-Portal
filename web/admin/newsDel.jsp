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
    String newsId = request.getParameter("NewsID");
    String adminName = (String) session.getAttribute("adminUser");
    String ip = request.getRemoteAddr();
    News news = new News();
    String sOK = news.deleteNews(newsId, adminName, ip);
    if (sOK.equalsIgnoreCase("Yes")) {
        out.print("<script>alert('删除新闻成功!');location.href='news.jsp';</script>");
    } else {
        out.print("<script>alert('删除新闻失败!');location.href='news.jsp';</script>");
    }
%>
