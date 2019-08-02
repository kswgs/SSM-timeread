<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>

    <title>邮件发送成功</title>
</head>
<body>
<%@include file="header.jsp" %>

<h1 class="text-center">邮件发送成功</h1>
<h3 class="text-center">激活邮件已发送至您的邮箱：</h3>
<h3 class="text-center"><a>${register_email}</a></h3>
<h3 class="text-center">请前往激活</h3>
</body>
</html>
