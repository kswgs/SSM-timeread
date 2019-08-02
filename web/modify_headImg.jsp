<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/18
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <div class="index_loginAfter_img margin-top-40">
                <c:choose>
                    <c:when test="${sessionScope.user.userDetailed.image_path == null}">
                        <img id="modify_head_image" src="${pageContext.request.contextPath}/IMG/touxiang.jpg">
                    </c:when>
                    <c:otherwise>
                        <img id="modify_head_image" src="${sessionScope.user.userDetailed.image_path}">
                    </c:otherwise>
                </c:choose>

                <input id="head_image_input" type="file" style="display:none" onchange="modify_head_image(this)">
            </div>

            <div class="text-center margin-top-40">
                <a href="javascript:$('#head_image_input').click()" class="btn btn-while">更换头像</a>
            </div>

        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/modify_headImg.js"></script>


</body>
</html>
