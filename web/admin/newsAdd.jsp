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
    Function func = new Function();
    String adminName = (String) session.getAttribute("adminUser");
    String action = request.getParameter("Action");
    if (action != null && action.equalsIgnoreCase("add")) {
        String ip = request.getRemoteAddr();
        String[] s = new String[2];
        s[0] = request.getParameter("NewsTitle");
        s[1] = request.getParameter("NewsContent");
        String sOK = news.addNews(s, adminName, ip);
        if (sOK.equalsIgnoreCase("yes")) {
            out.println("<script>alert('添加新闻成功！'); location.href = 'news.jsp';</script>");
        } else {
            out.println("<script>alert('添加新闻失败！'); location.href = 'news.jsp';</script>");
        }
    } else {
        out.println("<script>alert('错误异常！请重试');</script>");
        response.sendRedirect("news.jsp");
    }
%>
