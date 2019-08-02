<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<%@ include file="header.jsp" %>
<link rel="stylesheet" href="CSS/style.css">
<title>注册</title>
</head>
<body class=" liebiao_background">
	<form theme="simple" action="/user/register" method="post" id="action">
		<h1 class="text-center">注册</h1>
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="form-group margin-top-25">
						<div class="user_div">
							<input class="form-control" type="text" id="username" name="username" onblur="checkuser(this)" placeholder="账号">
						</div>
					</div>

					<div class="form-group margin-top-25">
						<div class="user_div">
							<input class="form-control" type="password" id="password" name="password" onblur="checkpassword(this)" placeholder="密码">
						</div>
					</div>

					<div class="form-group margin-top-25">
						<div class="user_div">
							<input class="form-control" type="password" id="repassword" name="repassword" onblur="checkrepassword(this)" placeholder="确认密码">
						</div>
					</div>

					<div class="form-group margin-top-25">
						<div class="user_div">
							<input class="form-control" type="text" id="email" name="email" onblur="checkemail(this)" placeholder="邮箱">
						</div>
					</div>
					<input id="register" type="submit" class="btn btn-info btn-block margin-top-25" disabled="disabled" value="注册" />
					<p class="text-center margin-top-25">
						已有账号？
						<a href="login.jsp">马上登陆</a>
					</p>
				</div>


				<%--错误信息--%>
				<div class="col-md-3">
					<div class="form-group margin-top-30 height-30">
						<p id="username_error" class="list-style-none text-danger" >
						</p>
					</div>
					<div class="form-group margin-top-30 height-30">
						<p id="password_error" class="list-style-none text-danger">
						</p>
					</div>
					<div class="form-group margin-top-30 height-30">
						<p id="repassword_error" class="list-style-none text-danger">
						</p>
					</div>
					<div class="form-group margin-top-30 height-30">
						<p id="email_error" class="list-style-none text-danger">
						</p>
					</div>
				</div>

			</div>
		</div>

	</form>
	<script src="JS/jquery-3.3.1.min.js"></script>
	<script src="bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="JS/header.js"></script>
	<script type="text/javascript" src="JS/register.js"></script>
</body> 
</html>