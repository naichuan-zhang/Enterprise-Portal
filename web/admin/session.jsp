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
    Function func = new Function();
    boolean isLogin = func.strToBool((String) session.getAttribute("login"));
    if (!isLogin) {
        out.println("<script>" +
                "alert('请重新登录！');" +
                "location.href = 'login.jsp';" +
                "</script>");
    }
%>
