<%@ page import="java.util.*" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.naichuan.*" %>
<%@ page import="javax.imageio.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="renderer" content="webkit">
    <link href="${pageContext.request.contextPath}/admin/css/amazeui.min.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        .header {
            text-align: center;
        }
        .header h1 {
            font-size: 200%;
            color: #333;
            margin-top: 30px;
        }
        .header p {
            font-size: 14px;
        }
    </style>
</head>

<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    request.setCharacterEncoding("UTF-8");
    String action = request.getParameter("action");

    if (action != null && action.equals("login")) {
        String page1 = request.getHeader("Referer");
        String page2 = request.getRequestURL().toString();
        String method = request.getMethod();

        if (method.equals("POST") && page2.equals(page1)) {

            try {
                Function func = new Function();
                Login login = new Login();
                String ip = request.getRemoteAddr();
                String user = request.getParameter("user");
                String pwd = request.getParameter("pwd");

                if (login.loginCheck(user, pwd)) {
                    session.setAttribute("login", "Yes");
                    session.setAttribute("adminUser", user);
                    out.println("<script language='javascript'>" +
                                    "alert('登陆成功');" +
                                    "location.href='news.jsp';" +
                                "</script>");
                } else {
                    out.println("<script language='JavaScript'>alert('用户名或密码不正确！'); " +
                            "location.href='login.jsp';</script>");
                }
                return;
            } catch (Exception e) {
                out.println("<script language='JavaScript'>alert('服务器异常！!'); " +
                        "location.href='login.jsp';</script>");
                return;
            }
        } else {
            response.sendError(403, "禁止访问");
            return;
        }
    }
%>

<body>
    <div class="header">
        <div class="am-g">
            <h1>管理员登录</h1>
        </div>
        <hr>
    </div>

    <div class="am-g">
        <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
            <form action="login.jsp" method="post" class="am-form login-form" onsubmit="return loginCheck()">
                <label for="user">用户名：</label>
                <input type="text" name="user" id="user" value="">
                <br>
                <label for="pwd">密码：</label>
                <input type="password" name="pwd" id="pwd" value="">
                <br>
                <br/>
                <div class="am-cf">
                    <input name="action" type="hidden" value="login">
                    <input type="submit" value="登 录" id="save" class="am-btn am-btn-primary am-btn-sm am-fl">
                </div>
            </form>
        </div>
    </div>
</body>

<script src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/amazeui.min.js"></script>
<script>
    function loginCheck() {

        if ($("#user").val() === "" || $("#pwd").val() === "") {
            alert("用户名或密码不能为空！");
            return false;
        }
        return true;
    }
</script>

</html>