<%--
  Created by IntelliJ IDEA.
  User: Mattias Chang
  Date: 3/29/2020
  Time: 10:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.*" contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.naichuan.*" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
        + request.getServerName() + ":" + request.getServerPort()
        + path;
%>

<!DOCTYPE html>
<html>
<head>
    <title>新闻详情</title>
    <link href="${pageContext.request.contextPath}/front/css/main.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/front/css/container.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/front/css/reset.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/front/css/screen.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/front/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/front/js/tab.js"></script>
</head>
<body>
    <%@include file="common_header.jsp"%>

    <div class="second_banner">
        <img src="${pageContext.request.contextPath}/front/img/4.gif" alt="">
    </div>
    <div class="left">
        <div class="menu_title">公司动态<br><span>News of Company</span></div>
        <ul id="tab">
            <li><a href="#">公司新闻</a></li>
        </ul>
    </div>
    <div class="right">
        <div class="location">
            <span>当前位置：<a href="javascript:void(0)" id="a"><a href="#">公司新闻</a></a></span>
            <div class="brief" id="b"><a href="#">公司新闻</a></div>
        </div>
        <div style="font-size: 14px; margin-top: 53px; line-height: 36px;">
            <div id="tab_con">
                <div id="tab_con_2" class="dis-n" style="display: none;">
                    <div class="content_main">
                        <%
                            request.setCharacterEncoding("UTF-8");
                            News news = new News();
                            String newsId = request.getParameter("newsId");
                            String sPage = request.getContextPath() + request.getServletPath() + "?";
                            String sOK = news.newsDetails(newsId);
                            if (sOK.equals("No")) {
                                out.println("数据服务器出现错误！");
                            } else {
                                out.println(sOK);
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="common_footer.jsp"%>
</body>

<script>
    tabs("#tab", "active", "#tab_con");
</script>

</html>
