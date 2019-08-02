<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>登录</title>

</head>
<body>
	<%@ include file="header.jsp"%>
	<form theme="simple" action="/user/login" method="post" id="action">

		<h1 class="text-center">登录</h1>
		<div class="container">

			<div class="row">
					<div class="col-md-6 col-md-offset-3">
						<div class="form-group margin-top-25">
							<div id="user_div" class="user_div">
								<input class="form-control" type="text" id="username" name="username" placeholder="账号">
								<span id="user_close" class="cursor"></span>
							</div>
						</div>
						<div class="form-group margin-top-25">
							<div>
								<input class="form-control" type="password" id="password" name="password" placeholder="密码">
							</div>
						</div>
						<input class="btn btn-info btn-block margin-top-25" type="submit" value="登录">
						<%--<s:submit type="submit" cssClass="btn btn-primary btn-block margin-top-25" value="登录" />--%>
						<p class="text-right margin-top-25">
							<a href="change_password.jsp">忘记密码? <%--<button class=" margin-top-25" type="submit" id="retake" value="忘记密码?"/>--%>
								<%--<s:submit id="retake" cssClass="btn-list-style-none" value="忘记密码？" />--%>
							</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a href="register.jsp">注册新账号</a>
						</p>
					</div>

				<%--错误信息--%>
				<div class="col-md-3">
					<div class="form-group height-30 margin-top-35">
						<p id="username_error" class="list-style-none text-danger"></p>
					</div>
					<div class="form-group height-30 margin-top-30">
						<p id="password_error" class="list-style-none text-danger">${loginerror}</p>
					</div>
				</div>

			</div>
		</div>
	</form>


	<script src="${pageContext.request.contextPath}/JS/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/login.js"></script>

</body>
</html>
