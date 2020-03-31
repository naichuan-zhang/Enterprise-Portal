<%--
  Created by IntelliJ IDEA.
  User: Mattias Chang
  Date: 3/29/2020
  Time: 11:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String login = (String) session.getAttribute("login");
    if (login.equalsIgnoreCase("yes")) {
        session.setAttribute("login", "");
        session.setAttribute("adminUser", "");
        session.setAttribute("adminType", "");
        session.setAttribute("adminName", "");
        session.setAttribute("adminID", "");
        out.println("<script language='JavaScript'>" +
                        "alert('您已成功退出系统！');" +
                        "location.href = 'login.jsp';" +
                    "</script>");
        // redirect to home page
        response.sendRedirect(request.getContextPath() + "/front/index.jsp");
    } else {
        out.println("<script language='JavaScript'>" +
                        "alert('异常错误，请重试！'); " +
                        "location.href = 'news.jsp';" +
                    "</script>");
    }
%>
