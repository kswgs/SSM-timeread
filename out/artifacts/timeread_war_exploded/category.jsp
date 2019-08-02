<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>
        <c:if test="${sessionScope.bookCategoryParentName == null && sessionScope.bookCategoryName == null}">
            新书首发
        </c:if>
        <c:if test="${sessionScope.bookCategoryParentName !=null}">
        ${sessionScope.bookCategoryParentName}
        </c:if>
        <c:if test="${sessionScope.bookCategoryName != null}">
           -- ${sessionScope.bookCategoryName}
        </c:if>
    </title>
</head>
<body>
<%@ include file="header.jsp" %>

<div class="container">
    <div class="row">

        <h5><span class="glyphicon glyphicon-home"></span> 首页

            <c:if test="${sessionScope.bookCategoryParentName == null && sessionScope.bookCategoryName == null}">
                > <a href="">新书首发</a>
            </c:if>
            <c:if test="${sessionScope.bookCategoryParentName !=null}">
                > <a href="">${sessionScope.bookCategoryParentName}</a>
            </c:if>
            <c:if test="${sessionScope.bookCategoryName != null}">
                > <a href="">${sessionScope.bookCategoryName}</a>
            </c:if>


        </h5>
        <%--登录--%>
        <c:choose>
            <c:when test="${user == null}">
                <%--登录--%>
                <div id="index_login" class="col-lg-3 col-md-3 hidden-sm pull-right hidden-xs index_login margin-top-10">
                    <form action="/user/indexLogin" method="post" id="action">
                        <h2 class="text-center">登录</h2>
                        <div class="form-group margin-top-25">
                            <label>账号</label> <input type="text" class="form-control" name="username" placeholder="账号">
                        </div>

                        <div class="form-group">
                            <label>密码</label> <input type="password" class="form-control" name="password"
                                                     placeholder="密码">
                        </div>

                        <input type="submit" class="btn btn-info btn-block" value="登录"/>
                        <div class="checkbox text-right">
                            <label> <input type="checkbox">自动登录
                            </label>
                        </div>
                        <div class="col-lg-12 index_login_error">
                            <p class="text-danger">${sessionScope.loginerror}</p>
                        </div>
                        <div class="col-lg-12 index_register">
                            <div class="col-lg-6">
                                <a href="#" class="btn btn-while btn-block">找回密码</a>
                            </div>
                            <div class="col-lg-6">
                                <a href="register.jsp" class="btn btn-while btn-block">立即注册</a>
                            </div>
                        </div>
                    </form>

                </div>
                <%--登录end--%>
            </c:when>

            <c:otherwise>
                <%--登录后显示个人信息--%>
                <div id="index_loginAfter" class="col-lg-3 col-md-3 hidden-sm pull-right hidden-xs index_loginAfter margin-top-10">
                    <form action="#">
                        <div class="index_loginAfter_img margin-top-40">
                            <c:choose>
                                <c:when test="${sessionScope.user.userDetailed.image_path == null}">
                                    <img src="${pageContext.request.contextPath}/IMG/touxiang.jpg">
                                </c:when>
                                <c:otherwise>
                                    <img src="${sessionScope.user.userDetailed.image_path}">
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <h3 class="text-center">欢迎你，<a href="#">${sessionScope.user.username}</a></h3>
                        <h4 class="text-center margin-top-25">积分：<span
                                data-point="${sessionScope.user.userDetailed.point}"
                                id="userPoint">${sessionScope.user.userDetailed.point}</span></h4>
                        <div id="user_sign" class="text-center  margin-top-25">
                            <a id="btn_sign" href="#" class="btn btn-info"></a>
                        </div>
                        <div class="col-lg-12 margin-top-25 index_register">
                            <div class="col-lg-6">
                                <a href="${pageContext.request.contextPath}/user_info.jsp"
                                   class="btn btn-while btn-block">用户中心</a>
                            </div>
                            <div class="col-lg-6">
                                <a href="/user/cancel" class="btn btn-while btn-block">退出登录</a>
                            </div>
                        </div>
                    </form>
                </div>
                <%--登录后显示个人信息end--%>
            </c:otherwise>
        </c:choose>
        <%--登录后显示个人信息end--%>

        <%--图书列表--%>
        <div class="col-lg-9" style="height: 1915px">

            <c:forEach begin="0" end="5" varStatus="st" items="${sessionScope.bookInfoList}" var="list">
                <%--单个图书--%>
                <div class="row category_list">
                    <div class="col-lg-3 category_list_img">
                        <img src="${list.image}">
                    </div>
                    <div class="col-lg-9 category_list_neirong">
                        <h3 class="margin-top-25 category_list_neirong_h3"><a
                                href="/book/getBookByIdDetailed?book_id=${list.book_id}">${list.name}</a></h3>
                        <h4 class="margin-top-15 category_list_neirong_h4">内容简介</h4>
                        <p>${list.introduction}
                        </p>
                        <span><fmt:formatDate value="${list.upload_time}" pattern="yyyy-MM-dd"/></span>
                        <a href="/book/getBookByIdDetailed?book_id=${list.book_id}"
                           class="btn btn-info category_list_neirong_btn">进入下载页</a>

                    </div>
                </div>
                <%--单个图书end--%>
            </c:forEach>
            <%--分页--%>
            <div class="row margin-top-15">
                <c:if test="${sessionScope.page != 1}">
                    <div class="col-lg-3 pull-left">
                        <a href="/book/getBookByCategory?page=${sessionScope.page-1}&category=${sessionScope.bookCategory}&categoryParent=${sessionScope.bookCategoryParent}"
                           class="btn btn-while btn-block">上一页</a>
                    </div>
                </c:if>
                <c:if test="${sessionScope.pageEnd != sessionScope.page}">
                <div class="col-lg-3 pull-right">
                    <a href="/book/getBookByCategory?page=${sessionScope.page+1}&category=${sessionScope.bookCategory}&categoryParent=${sessionScope.bookCategoryParent}"
                       class="btn btn-while btn-block">下一页</a>
                </div>
                </c:if>
                <%--<div class="col-lg-6 pull-right">
                    <c:choose>


                    <c:when test="${sessionScope.pageEnd_page >=4}">
                        <c:forEach begin="0" end="3" varStatus="st">
                            <a href="/book/getBookByCategory?page=${sessionScope.page+st.count}&category=${sessionScope.bookCategory}&categoryParent=${sessionScope.bookCategoryParent}"
                               class="btn btn-while margin-left-15">${sessionScope.page+st.count}</a>
                        </c:forEach>
                        <a class="btn btn-while margin-left-15">...</a>
                        <a class="btn btn-while margin-left-15">${sessionScope.pageEnd}</a>
                    </c:when>
                    <c:when test="${sessionScope.pageEnd_page <4}">
                        <c:forEach begin="0" end="${sessionScope.pageEnd}" varStatus="st">
                            <a href="/book/getBookByCategory?page=${sessionScope.page+st.count}&category=${sessionScope.bookCategory}&categoryParent=${sessionScope.bookCategoryParent}"
                               class="btn btn-while margin-left-15">${sessionScope.page+st.count}</a>
                        </c:forEach>
                        <a class="btn btn-while margin-left-15">${sessionScope.pageEnd}</a>
                    </c:when>
                     </c:choose>
                    &lt;%&ndash;<a href="/book/getBookByCategory?page=${sessionScope.page}&category=${sessionScope.bookCategory}&categoryParent=${sessionScope.bookCategoryParent}"
                       class="btn btn-while margin-left-15">${sessionScope.page}</a>
                    <a href="/book/getBookByCategory?page=${sessionScope.page+1}&category=${sessionScope.bookCategory}&categoryParent=${sessionScope.bookCategoryParent}"
                       class="btn btn-while margin-left-15">${sessionScope.page+1}</a>
                    <a href="/book/getBookByCategory?page=${sessionScope.page+2}&category=${sessionScope.bookCategory}&categoryParent=${sessionScope.bookCategoryParent}"
                       class="btn btn-while margin-left-15">${sessionScope.page+2}</a>
                    <a href="/book/getBookByCategory?page=${sessionScope.page+3}&category=${sessionScope.bookCategory}&categoryParent=${sessionScope.bookCategoryParent}"
                       class="btn btn-while margin-left-15">${sessionScope.page+3}</a>
                    <a class="btn btn-while margin-left-15">...</a>
                    <a class="btn btn-while margin-left-15">${sessionScope.pageEnd}</a>&ndash;%&gt;
                </div>--%>

            </div>


            <%--分页end--%>
        </div>
        <%--图书列表end--%>

        <%--随机推荐图书--%>
        <div class="col-lg-3 col-md-3 pull-right suijituijian-border margin-top-15">
            <h4>随机推荐</h4>
            <div class="row">
                <ul id="tuijian" class="nav nav-tabs text-center ">

                    <li class="active ">
                        <div class="col-lg-12 ">
                            <a class="btn btn-info btn-block disabled" href="#tuijian"
                               data-toggle="tab">随机推荐</a>
                        </div>
                    </li>

                </ul>
            </div>

            <div id="suijituijian_list" class="suijituijian_list">
                <%--<c:forEach begin="0" end="10" varStatus="st">
                    <div class="suijituijian_list_neirong">
                        <div class="row">
                            <div class="col-lg-4">
                                <img src="${pageContext.request.contextPath}/IMG/1.jpg">
                            </div>
                            <div class="col-lg-8">
                                <p><a href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                                </p>
                                <span class="pull-right">09-09</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>--%>

            </div>


        </div>
        <%--随机推荐图书 end--%>


    </div>
</div>
<%@include file="footer.jsp" %>
<script src="${pageContext.request.contextPath}/JS/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/header.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/category.js"></script>
</body>
</html>
