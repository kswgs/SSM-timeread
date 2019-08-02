<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/16
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息</title>


</head>
<body class="user_info_body">

<%@ include file="header.jsp" %>

<div class="container">
    <div class="row">
        <h5><span class="glyphicon glyphicon-home margin-top-10"></span> 首页 > 个人中心
        </h5>

        <h4 class="user_info_name margin-top-10">Time Read 个人中心</h4>

        <aside class="col-lg-2 user_info_left">
            <ul id="user_info_left_menu" class="user_info_left_menu">
                <li class="user_info_left_menu_active"><a target="myiframe" href="${pageContext.request.contextPath}/user_info_detailed.jsp">个人信息</a></li>
                <li><a target="myiframe" href="${pageContext.request.contextPath}/modify_headImg.jsp">更换头像</a></li>
                <li><a target="myiframe" href="${pageContext.request.contextPath}/modify_password.jsp">更改密码</a></li>
            </ul>
        </aside>


        <div class="col-lg-10 user_info_div_neirong">
            <!-- 内容主体区域 -->
            <iframe id="myiframe" name="myiframe" frameborder=0 class="user_info_body_neirong" src="${pageContext.request.contextPath}/user_info_detailed.jsp"></iframe>
        </div>
    </div>
</div>

<%@include file="footer.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/user_info.js"></script>
</body>
</html>
