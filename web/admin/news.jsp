<%--
  Created by IntelliJ IDEA.
  User: Mattias Chang
  Date: 3/29/2020
  Time: 11:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.*" contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.naichuan.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>新闻列表</title>
    <link href="${pageContext.request.contextPath}/admin/css/amazeui.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/admin/css/admin.css">
</head>
<body>
    <%@ include file="session.jsp" %>

    <header class="am-topbar admin-header">
        <div class="am-topbar-brand">
            <strong>明日科技</strong>
            <small>后台管理</small>
        </div>
        <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
                data-am-collapse="{target: '#topbar-collapse'}">
            <span class="am-sr-only">导航切换</span>
            <span class="am-icon-bars"></span>
        </button>
        <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
            <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">\
                <li class="am-dropdown" data-am-dropdown>
                    <a class="am-dropdown-toggle" data-am-dropdown-toggle
                       href="javascript:;"> <span class="am-icon-users"></span>
                        <%=session.getAttribute("adminUser")%>， 欢迎您 <span class="am-icon-caret-down"></span>
                    </a>
                    <ul class="am-dropdown-content">
                        <li>
                            <a href="logout.jsp">
                                <span class="am-icon-power-off"></span>
                                退出
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </header>

    <div class="am-cf admin-main">
        <!-- sidebar start -->
        <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
            <div class="am-offcanvas-bar admin-offcanvas-bar">
                <ul class="am-list admin-sidebar-list">
                    <li>
                        <a href="news.jsp" title="新闻管理">
                            <span class="am-icon-pencil-square-o"></span>新闻管理
                        </a>
                    </li>
                    <li>
                        <a href="adminUser.jsp" title="管理员管理">
                            <span class="am-icon-bookmark"></span>管理员管理
                        </a>
                    </li>
                </ul>
                <div class="am-panel am-panel-default admin-sidebar-panel">
                    <div class="am-panel-bd">
                        <p>
                            公告
                        </p>
                        <p>
                            技术支持：明日科技
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <!-- sidebar end -->

        <!-- content start -->
        <div class="admin-content">
            <div class="am-cf am-padding">
                <div class="am-fl am-cf">
                    <strong>后台管理</strong>
                    <strong>新闻管理</strong>
                </div>
            </div>
            <div class="am-g">
                <div class="am-u-sm-12 am-u-md-6">
                    <div class="am-btn-toolbar">
                        <div class="am-btn-group am-btn-group-xs">
                            <button type="button" class="am-btn am-btn-success"
                                    data-am-modal="{target: '#new-popup'}">
                                <span class="am-icon-plus"></span> 添加新闻
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="am-g" style="height: 300px">
                <div class="am-u-sm-12">
                    <form class="am-form">
                        <table class="am-table am-table-striped am-table-hover table-main">
                            <thead>
                                <tr>
                                    <th class="table-id">
                                        序号
                                    </th>

                                    <th class="table-title">
                                        新闻标题
                                    </th>
                                    <th class="table-title">
                                        创建人
                                    </th>
                                    <th class="table-author ">
                                        创建时间
                                    </th>

                                    <th class="table-author ">
                                        操作
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    request.setCharacterEncoding("UTF-8");
                                    News news = new News();
                                    Function fun = new Function();
                                    String strPage = request.getParameter("intPage");
                                    String sPage = request.getContextPath() + request.getServletPath()+ "?";
                                    String sOK = news.listNews(sPage, strPage);
                                    if (sOK.equals("No")) {
                                        out.println("数据服务器出现错误！");
                                    } else {
                                        out.println(sOK);
                                    }
                                %>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
        <!-- content end -->
    </div>

    <div class="am-popup" id="news-popup">
        <div class="am-popup-inner">
            <div class="am-popup-hd">
                <h4 class="am-popup-title">
                    添加新闻
                </h4>
                <span data-am-modal-close class="am-close">&times;</span>
            </div>
            <div class="am-popup-bd">
                <form class="am-form" id="news-msg" method="post" action="newsAdd.jsp">
                    <fieldset>
                        <div class="am-form-group">
                            <label for="doc-vld-ta-2-1">
                                新闻标题
                            </label>
                            <input name="NewsTitle" type="text" maxlength="32" placeholder="请输入新闻标题" data-validation-message="不能为空" required>
                        </div>
                        <div class="am-form-group">
                            <label for="doc-vld-ta-2-1">
                                新闻内容
                            </label>
                            <textarea name="NewsContent" cols="30" rows="10"
                                      placeholder="请输入新闻内容，段落间请用#分隔。" data-validation-message="不能为空" required>
                            </textarea>
                        </div>
                        <input name="Action" type="hidden" value="Add">
                        <button class="am-btn am-btn-secondary" type="submit">
                            提交
                        </button>
                        <button onclick="javascript:$('#news-popup').modal('close');"
                                class="am-btn am-btn-secondary" type="button">
                            关闭
                        </button>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>

    <div class="am-popup" id="edit-popup">
        <div class="am-popup-inner">
            <div class="am-popup-hd">
                <h4 class="am-popup-title">
                    修改新闻
                </h4>
                <span data-am-modal-close class="am-close">&times;</span>
            </div>
            <div class="am-popup-bd">
                <form action="newsEdit.jsp" method="post" class="am-form" id="edit-msg">
                    <fieldset>
                        <div class="am-form-group">
                            <label for="doc-vld-ta-2-1">
                                新闻标题：
                            </label>
                            <input id="upd_NewsTitle" name="upd_NewsTitle" type="text" maxlength="32"
                                   placeholder="请输入新闻标题" data-validation-message="不能为空" required />
                        </div>
                        <div class="am-form-group">
                            <label for="doc-vld-ta-2-1">
                                新闻内容：
                            </label>
                            <textarea id="upd_NewsContent" name="upd_NewsContent"  cols="30" rows="10"
                                      placeholder="请输入新闻内容" data-validation-message="不能为空" required></textarea>
                        </div>

                        <input name="Action" type="hidden" value="Edit">
                        <input id="newsId" name="newsId" type="hidden" value="">

                        <button class="am-btn am-btn-secondary" type="submit">
                            提交
                        </button>
                        <button onclick='javascript:$("#edit-popup").modal("close");'
                                class="am-btn am-btn-secondary" type="button">
                            关闭
                        </button>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
    
    <a class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
        data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
    
    <div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
        <div class="am-modal-dialog">
            <div class="am-modal-bd">
                确定要删除当前主题吗？
            </div>
            <div class="am-modal-footer">
                <span class="am-modal-btn" data-am-modal-cancel>取消</span>
                <span class="am-modal-btn" data-am-modal-confirm>确定</span>
            </div>
        </div>
    </div>

    <footer>
        <hr>
        <p class="am-padding-left">
            &copy; 2020 明日科技
        </p>
    </footer>
    
    <script src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/js/amazeui.min.js"></script>
    <script>
        function jumpMenu(s1, s2, s3) {
            let pageURL = $("#ipage option:selected").val();
            window.location.href = pageURL;
        }
    </script>
    <script>
        $(function () {
            $("#news-msg").validator(
                {
                    onValid : function(validity) {
                        $(validity.field).closest('.am-form-group').find(
                            '.am-alert').hide();
                    },

                    onInValid : function(validity) {
                        var $field = $(validity.field);
                        var $group = $field.closest('.am-form-group');
                        var $alert = $group.find('.am-alert');

                        var msg = $field.data('validationMessage')
                            || this.getValidationMessage(validity);

                        if (!$alert.length) {
                            $alert = $('<div class="am-alert am-alert-danger"></div>')
                                .hide().appendTo($group);
                        }

                        $alert.html(msg).show();
                    }
                }
            );
            $('#edit-msg').validator(
                {
                    onValid : function(validity) {
                        $(validity.field).closest('.am-form-group').find(
                            '.am-alert').hide();
                    },

                    onInValid : function(validity) {
                        var $field = $(validity.field);
                        var $group = $field.closest('.am-form-group');
                        var $alert = $group.find('.am-alert');

                        var msg = $field.data('validationMessage')
                            || this.getValidationMessage(validity);

                        if (!$alert.length) {
                            $alert = $('<div class="am-alert am-alert-danger"></div>')
                                .hide().appendTo($group);
                        }

                        $alert.html(msg).show();
                    }
                });
        });

        function del(obj) {
            $('#my-confirm').modal({
                relatedTarget: this,
                onConfirm: function (options) {
                    var delId = $(obj).attr("rel");
                    window.location.href = "newsDel.jsp?NewsID=" + delId;
                },
                onCancel: function () {
                }
            });
        }

        function edit(obj) {
            var _obj = $(obj);
            var newsTitle = _obj.prev().val();
            var newsContent = _obj.prev().val();
            var newsId = _obj.prev().prev().val();
            $("#upd_NewsTitle").val(newsTitle);
            $("#upd_NewsContent").val(newsContent);
            $("#newsId").val(newsId);
            $("#edit-popup").modal();
        }
    </script>
</body>
</html>
