<%--
  Created by IntelliJ IDEA.
  User: Mattias Chang
  Date: 3/28/2020
  Time: 8:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header_bg">
    <div class="wrap">
        <div class="header">
            <div class="logo">
                <a href="#"><img src="${pageContext.request.contextPath}/front/img/logo.png" alt=""> </a>
            </div>
            <div class="pull-icon">
                <a id="pull"></a>
            </div>
            <div class="cssmenu">
                <ul>
                    <li>
                        <a href="index.jsp">首页</a>
                    </li>
                    <li>
                        <a href="about.jsp">企业简介</a>
                    </li>
                    <li>
                        <a href="newsFrontList.jsp">新闻</a>
                    </li>
                    <li>
                        <a href="content.jsp">核心竞争力</a>
                    </li>
                    <li>
                        <a href="contact.jsp">联系我们</a>
                    </li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
