<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Time Reading 后台管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/backStyle.css">

</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">Time Reading 后台管理</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="${pageContext.request.contextPath}/IMG/touxiang.jpg" class="layui-nav-img">
                    ${backUser.username}
                </a>
                <%--<dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">修改密码</a></dd>
                </dl>--%>
            </li>
            <li class="layui-nav-item"><a href="#" onclick="backCancel()">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black" layui-filter="left_tab">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" >
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/back/userAdmin/getAllUser.jsp" target="myiframe">所有用户</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/back/userAdmin/addUser.jsp" target="myiframe">添加用户</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">图书管理</a>
                    <dl class="layui-nav-child">
                       <%-- <dd><a href="${pageContext.request.contextPath}/back/">所有图书</a></dd>--%>
                        <dd><a href="${pageContext.request.contextPath}/back/bookAdmin/addBook.jsp" target="myiframe">添加图书</a></dd>
                    </dl>
                </li>

            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <iframe id="myiframe" name="myiframe" class="body_neirong" src="userAdmin/getAllUser.jsp" ></iframe>
    </div>

</div>
<script src="${pageContext.request.contextPath}/JS/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/back/layui.js"></script>
<script src="${pageContext.request.contextPath}/back/JS/backIndex.js"></script>
<script>
    var layer;
    layui.use('layer', function(){
        layer = layui.layer;

    });
    function backCancel() {
        var loading = '';
        $.ajax({
            url: "/user/cancelBackUser",
            dataType: "text",
            type: "POST",
            beforeSend: function () {
                loading = layer.load(1, {
                    shade: [0.3, '#efefef'] //0.1透明度的白色背景
                });
            },
            success: function (data) {
                console.log("data=="+data);
                var json = jQuery.parseJSON(data);

                if(json.isSuccess == true){
                    setTimeout(function () {
                        layer.close(loading);
                        window.location.href = "../back/back_login.jsp";
                    },500);
                }
            },
            error: function (data) {

            }
        });
    }
</script>
</body>
</html>
