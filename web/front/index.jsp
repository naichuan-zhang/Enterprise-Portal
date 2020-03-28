<%--
  Created by IntelliJ IDEA.
  User: Mattias Chang
  Date: 3/28/2020
  Time: 7:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
                + request.getServerName() + ":" + request.getServerPort()
                + path;
%>
<!DOCTYPE html>
<html>
<head>
    <title>我的首页</title>
    <link href="${pageContext.request.contextPath}/front/css/main.css" rel="stylesheet" type="text/css" media="all">
    <link href="${pageContext.request.contextPath}/front/css/fwslider.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>
    <%@ include file="common_header.jsp" %>
    <!-- 轮播 -->
    <div id="fwslider" style="height: 554px;">
        <div class="slide_container">
            <div class="slide" style="opacity: 1; z-index: 0; display: none;">
                <img id="img1" src="${pageContext.request.contextPath}/front/img/img1.jpg">
            </div>
            <div class="slide" style="opacity: 1; z-index: 1; display: block;">
                <img id="img2" src="${pageContext.request.contextPath}/front/img/img2.jpg">
            </div>
            <div class="slide" style="opacity: 1; z-index: 1; display: block;">
                <img id="img3" src="${pageContext.request.contextPath}/front/img/img3.jpg">
            </div>
            <div class="slide" style="opacity: 1; z-index: 0; display: none;">
                <img id="img4" src="${pageContext.request.contextPath}/front/img/img4.jpg">
            </div>
            <div class="slide" style="opacity: 1; z-index: 0; display: none;">
                <img id="img5" src="${pageContext.request.contextPath}/front/img/img5.jpg">
            </div>
        </div>

        <div class="timers" style="width: 180px;">

        </div>
        <div class="slidePrev" style="left: 0px; top: 252px;">
            <span></span>
        </div>
        <div class="slideNext" style="right: 0px; top: 252px;">
            <span></span>
        </div>
    </div>

    <!-- 底部功能栏 -->
    <div class="main_bg">
        <div class="business">
            业务领域 BUSINESS
        </div>
        <div class="wrap w_72">
            <div class="grids_1_of_3">
                <div class="grid_1_of_3 images_1_of_3">
                    <img src="${pageContext.request.contextPath}/front/img/pic1.png">
                </div>
                <div class="grid_1_of_3 images_1_of_3">
                    <img src="${pageContext.request.contextPath}/front/img/pic2.png">
                </div>
                <div class="grid_1_of_3 images_1_of_3">
                    <img src="${pageContext.request.contextPath}/front/img/pic3.png">
                </div>
                <div class="grid_1_of_3 images_1_of_3">
                    <img src="${pageContext.request.contextPath}/front/img/pic4.png">
                </div>
                <div class="grid_1_of_3 images_1_of_3">
                    <img src="${pageContext.request.contextPath}/front/img/pic5.png">
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>

    <div class="address">
        Copyright 2020 明日科技有限公司 All Rights.
        <br>
        <a href="http://www.mingrisoft.com">吉林省明日科技有限公司</a> 技术支持
        <a href="<%=basePath%>/admin/login.jsp">后台</a>
        <br> XXXXXXXXXXXXXX
    </div>
    <div class="clear"></div>
</body>

<script src="${pageContext.request.contextPath}/front/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/front/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/front/js/fwslider.js"></script>

</html>
