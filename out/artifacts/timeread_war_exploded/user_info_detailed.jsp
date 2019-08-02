<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/16
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/bootstrap-theme.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/bootstrap-datetimepicker.min.css"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css" type="text/css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
            <form class="form-horizontal user_info_detailed_form">
                <div class="form-group">
                    <label class="col-sm-2 control-label">用户名 : </label>
                    <div class="col-sm-10">
                        <label id="user_info_detailed_username" class="control-label" data-user="${sessionScope.user.username}">${sessionScope.user.username}</label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">邮箱 : </label>
                    <div class="col-sm-10">
                        <label class="control-label">${sessionScope.user.email}</label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">积分 : </label>
                    <div class="col-sm-10">
                        <label class="control-label">${sessionScope.user.userDetailed.point}</label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">注册时间 : </label>
                    <div class="col-sm-10">
                        <label id="user_info_detailed_registration_time" class="control-label" data-time="${sessionScope.user.userDetailed.registration_time}"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">性别 :　</label>
                    <div class="col-sm-10">
                        <select id="user_info_detailed_gender" class="form-control user_info_detailed_gender">
                            <option value="2">保密</option>
                            <option value="0">男</option>
                            <option value="1">女</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">生日 : </label>
                    <div class="col-sm-10">
                        <div class='col-sm-6'>
                            <div class="form-group">
                                <!--指定 date标记-->
                                <div class='input-group date' id='user_info_detailed_date'>
                                    <input  id="user_info_detailed_birthday" type='text' class="form-control" data-time="${sessionScope.user.userDetailed.birthday}" value=""/>
                                    <span class="input-group-addon">
                                         <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-4 col-sm-offset-4 text-center">
                    <a id="user_info_detailed_submit" class="btn btn-danger btn-block">保存</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/user_info_detailed.js"></script>

</body>
</html>
