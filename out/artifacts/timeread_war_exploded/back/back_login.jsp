<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/23
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/backStyle.css">
    <title>后台登陆</title>
</head>
<body class="back_login_body">
<div id="container">
    <div></div>
    <div class="admin-login-background">


            <div>
                <i class="layui-icon layui-icon-username admin-icon admin-icon-username"></i>
                <input id="username" type="text" name="username" placeholder="请输入用户名"
                       autocomplete="off"
                       class="layui-input admin-input admin-input-username">
            </div>
            <div>
                <i class="layui-icon layui-icon-password admin-icon admin-icon-password"></i>
                <input id="password" type="password" name="password"
                       placeholder="请输入密码"
                       autocomplete="off"
                       class="layui-input admin-input admin-input-password">
            </div>

            <button class="layui-btn admin-button" lay-submit lay-filter="formDemo" onclick="backLogin()">登陆</button>



    </div>
</div>
<script src="${pageContext.request.contextPath}/JS/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/back/layui.js"></script>
<script>
    var layer;
    layui.use('layer', function(){
        layer = layui.layer;

    });
    function backLogin() {
        var loading = '';
        $.ajax({
            url: "/user/backLogin",
            dataType: "text",
            type: "POST",
            data: {
                username:$('#username').val(),
                password:$('#password').val()
            },
            beforeSend: function () {
                loading = layer.load(1, {
                    shade: [0.3, '#efefef'] //0.1透明度的白色背景
                });
            },
            success: function (data) {
                //console.log("data=="+data);
                var json = jQuery.parseJSON(data);
                if(json.isSuccess == true){
                    setTimeout(function () {
                        layer.close(loading);
                        window.location.href = "../back/backIndex.jsp";
                    },1000);

                }else {
                    loadChangeMsg(loading,json.msg,false,1000);
                }
            },
            error: function (data) {

            }
        });
    }

    /**
     *  加载动画转弹窗
     * @param loading 加载动画 layer.load()
     * @param content 弹窗内容
     * @param flag 成功或失败 true 或 flash
     * @param time setTimeout的时间
     */
    function loadChangeMsg(loading, content, flag,time) {
        var icon;
        if(flag){
            icon=1;
        }else{
            icon=2;
        }
        setTimeout(function () {
            layer.close(loading);
            loading = layer.msg(content, {
                icon: icon
            });
        },time);
    }
</script>
</body>
</html>
