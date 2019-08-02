<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/bootstrap-theme.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css" type="text/css">
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">时 读</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav" id="header-ul">
                <li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>

				<li class="dropdown header">
				<a href="/book/getBookByCategory?page=1&category=0&categoryParent=1" class="dropdown-toggle" data-togglex="dropdown"
					role="button" aria-haspopup="true" aria-expanded="false">畅销图书<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/book/getBookByCategory?page=1&category=5&categoryParent=1">科幻悬疑-推理惊悚</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="/book/getBookByCategory?page=1&category=6&categoryParent=1">现代文学-外国文学</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="/book/getBookByCategory?page=1&category=7&categoryParent=1">人文社科-社会心理</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="/book/getBookByCategory?page=1&category=8&categoryParent=1">军事科学-历史地理</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="/book/getBookByCategory?page=1&category=9&categoryParent=1">旅行处世-励志鸡汤</a></li>
						<%--<li role="separator" class="divider"></li>
						<li><a href="/book/getBookByCategory?page=1&category=5&categoryParent=1">官场商战-经济管理</a></li>--%>
						<li role="separator" class="divider"></li>
						<li><a href="/book/getBookByCategory?page=1&category=11&categoryParent=1">生活运动-养生健体</a></li>
					</ul>
				</li>
				
				<li class="dropdown header" >
				<a href="/book/getBookByCategory?page=1&category=0&categoryParent=2" class="dropdown-toggle" data-togglex="dropdown"
					role="button" aria-haspopup="true" aria-expanded="false">网络小说<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/book/getBookByCategory?page=1&category=12&categoryParent=2">历史架空-热血战争</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="/book/getBookByCategory?page=1&category=13&categoryParent=2">武侠玄幻-仙侠修真</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="/book/getBookByCategory?page=1&category=14&categoryParent=2">科幻异能-西方奇幻</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="/book/getBookByCategory?page=1&category=15&categoryParent=2">官场商战-阴谋阳谋</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="/book/getBookByCategory?page=1&category=16&categoryParent=2">都市言情-穿越重生</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="/book/getBookByCategory?page=1&category=17&categoryParent=2">恐怖悬疑-推理分析</a></li>
					</ul>
				</li>
				
				<li class="dropdown header">
				<a href="/book/getBookByCategory?page=1&category=0&categoryParent=3" class="dropdown-toggle" data-togglex="dropdown"
					role="button" aria-haspopup="true" aria-expanded="false">网络小说（女频）<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/book/getBookByCategory?page=1&category=18&categoryParent=3">古代言情</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="/book/getBookByCategory?page=1&category=19&categoryParent=3">现代言情</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="/book/getBookByCategory?page=1&category=20&categoryParent=3">玄幻言情</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="/book/getBookByCategory?page=1&category=21&categoryParent=3">仙侠奇缘</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="/book/getBookByCategory?page=1&category=22&categoryParent=3">浪漫青春</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="/book/getBookByCategory?page=1&category=23&categoryParent=3">悬疑灵异</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="/book/getBookByCategory?page=1&category=24&categoryParent=3">科幻空间</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="/book/getBookByCategory?page=1&category=25&categoryParent=3">游戏竞技</a></li>
					</ul>
				</li>
				
				<li class="dropdown header">
				<a href="/book/getBookByCategory?page=1&category=0&categoryParent=4" class="dropdown-toggle" data-togglex="dropdown"
					role="button" aria-haspopup="true" aria-expanded="false">学习教材<span class="caret"></span></a>
					<ul class="dropdown-menu ">
						<li><a href="/book/getBookByCategory?page=1&category=26&categoryParent=4">语言学习</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="/book/getBookByCategory?page=1&category=27&categoryParent=4">编程开发</a></li>
						<%--<li role="separator" class="divider"></li>
						<li><a href="#">软件办公</a></li>--%>
						<li role="separator" class="divider"></li>
						<li><a href="/book/getBookByCategory?page=1&category=28&categoryParent=4">美工设计</a></li>
					</ul>
				</li>

            </ul>
            <div class="navbar-right ">
                <c:choose>
                    <c:when test="${user == null}">
                        <a class="btn btn-info navbar-btn btn_header_login" href="${pageContext.request.contextPath}/login.jsp">登录</a>
                    </c:when>
                    <c:when test="${user != null}">
						<input id="userId" type="hidden" value="${sessionScope.user.username}">
                        <p class="header_login">欢迎您，<a href="${pageContext.request.contextPath}/user_info.jsp">${sessionScope.user.username}</a>&nbsp&nbsp&nbsp&nbsp<a
                                href="/user/cancel">注销</a></p>
                    </c:when>
                </c:choose>
            </div>
            <%--<form class="navbar-form navbar-right">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="请输入图书名或作者名">
                    <span class="input-group-btn">
                         <button class="glyphicon glyphicon-search btn btn-default glyphicon_top-1  glyphicon_top-1" type="button"></button>
                    </span>
                </div>

            </form>--%>

        </div>
    </div>
</nav>
