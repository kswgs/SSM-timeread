<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/16
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/bootstrap-theme.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css" type="text/css">
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
            <form class="form-horizontal">
                <input id="modify_password_username" type="hidden" value="${sessionScope.user.username}">
                <div class="form-group">
                    <label class="col-sm-2 control-label">旧密码</label>
                    <div class="col-sm-10">
                        <input id="old_password" type="password" class="form-control" placeholder="旧密码">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">新密码</label>
                    <div class="col-sm-10">
                        <input id="new_password" type="password" class="form-control" placeholder="新密码">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-4 col-sm-offset-4 text-center">
                        <a id="modify_password_submit" class="btn btn-danger btn-block">保存</a>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/modify_password.js"></script>
</body>
</html>
