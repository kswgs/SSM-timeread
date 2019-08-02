<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/backStyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back//css/layui.css">

</head>
<body>
<form action="/user/register" class="layui-form">
    <div class="layui-container">
        <div class="layui-row">
            <h2 class="newUser layui-col-lg-offset2">新增用户</h2>
            <hr class="layui-bg-green">
            <div class="layui-col-lg9 layui-col-lg-offset2">

                <div class="layui-row">
                <div class="layui-col-lg8">
                    <div class="layui-form-item margin-top-25">
                        <label class="layui-form-label">账号</label>
                        <div class="layui-input-block">
                            <input type="text" id="username" name="username" onblur="checkuser(this)" required lay-verify="required" placeholder="请输入账号"
                                   autocomplete="off"
                                   class="layui-input"/>
                        </div>
                    </div>
                </div>
                <div class="layui-col-lg4">
                    <div id="username_error" class="layui-form-mid xlayui-word-aux margin-top-25 margin-left-10 "></div>
                </div>
            </div>

                <div class="layui-row">
                    <div class="layui-col-lg8">
                        <div class="layui-form-item margin-top-25">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-block">
                                <input type="password" id="password" name="password" onblur="checkpassword(this)" required lay-verify="required" placeholder="请输入密码"
                                       autocomplete="off"
                                       class="layui-input"/>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-lg4">
                        <div id="password_error" class="layui-form-mid xlayui-word-aux margin-top-25 margin-left-10"></div>
                    </div>
                </div>
                <div class="layui-row">
                    <div class="layui-col-lg8">
                        <div class="layui-form-item margin-top-25">
                            <label class="layui-form-label">确认密码</label>
                            <div class="layui-input-block">
                                <input type="password" id="repassword" name="repassword" onblur="checkrepassword(this)" required lay-verify="required" placeholder="请输入确认密码"
                                       autocomplete="off"
                                       class="layui-input"/>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-lg4">
                        <div id="repassword_error" class="layui-form-mid xlayui-word-aux margin-top-25 margin-left-10"></div>
                    </div>
                </div>
                <div class="layui-row">
                    <div class="layui-col-lg8">
                        <div class="layui-form-item margin-top-25">
                            <label class="layui-form-label">邮箱</label>
                            <div class="layui-input-block">
                                <input type="email" id="email" name="email" onblur="checkemail(this)" required lay-verify="required" placeholder="请输入邮箱"
                                       autocomplete="off"
                                       class="layui-input"/>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-lg4">
                        <div id="email_error" class="layui-form-mid xlayui-word-aux margin-top-25 margin-left-10"></div>
                    </div>
                </div>

                <div class="layui-form-item margin-top-25">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="btn_addUser">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </div>

        </div>
    </div>
</form>
<script src="${pageContext.request.contextPath}/JS/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/JS/register.js"></script>
</body>
</html>
