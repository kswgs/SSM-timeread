<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/23
  Time: 12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>密码重置</title>
</head>
<body>
<%@ include file="/header.jsp" %>
<form theme="simple" action="/user/sendMailByPassword" method="post" id="action">
    <div class="container">

        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="form-group margin-top-25">
                    <div id="user_div" class="user_div">
                        <input class="form-control" type="text" id="email" name="email" placeholder="邮箱">
                    </div>
                </div>
                <input class="btn btn-info btn-block margin-top-25" type="submit" value="发送邮件">

            </div>

            <div class="col-md-3">
                <div class="form-group height-30 margin-top-35">
                    <p id="email_error" class="list-style-none text-danger">${change_password_email_error}</p>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>
