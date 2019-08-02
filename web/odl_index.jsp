<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Time Read</title>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container">
    <div class="row">
        <c:choose>
            <c:when test="${user == null}">
                <%--登录--%>
                <div id="index_login" class="col-lg-3 col-md-3 hidden-sm pull-right hidden-xs index_login ">
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
                <div id="index_loginAfter" class="col-lg-3 col-md-3 hidden-sm pull-right hidden-xs index_loginAfter">
                    <form action="#">
                        <div class="index_loginAfter_img margin-top-40">
                            <img src="${pageContext.request.contextPath}/IMG/touxiang.jpg">
                        </div>
                        <h3 class="text-center">欢迎你，<a href="#">${sessionScope.user.username}</a></h3>
                        <h4 class="text-center margin-top-25">积分：${sessionScope.user.userDetailed.point}</h4>
                        <div class="col-lg-12 margin-top-25 index_register">
                            <div class="col-lg-6">
                                <a href="#" class="btn btn-while btn-block">用户中心</a>
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
        <div class="col-lg-9 col-md-9 div_lunbo">
            <div id="myCarousel" class="carousel slide ">
                <!-- 轮播（Carousel）指标 -->
                <ol class="carousel-indicators">
                    <c:forEach begin="1" end="3" varStatus="st">
                        <c:if test="${st.count == 1 }">
                            <li data-target="#myCarousel" data-slide-to="${st.count - 1 }" class="active"></li>
                        </c:if>
                        <c:if test="${st.count >1 }">
                            <li data-target="#myCarousel" data-slide-to="${st.count - 1 }"></li>
                        </c:if>

                    </c:forEach>
                </ol>
                <!-- 轮播（Carousel）项目 -->
                <div class="div_lunbo_img carousel-inner">
                    <c:forEach begin="1" end="3" varStatus="st">
                    <c:if test="${st.count == 1}">
                    <div class="item active">
                        </c:if>
                        <c:if test="${st.count > 1}">
                        <div class="item">
                            </c:if>
                            <img class="center-block " src="${pageContext.request.contextPath}/IMG/${st.count }.jpg">
                        </div>
                        </c:forEach>
                    </div>
                    <!-- 轮播（Carousel）导航 -->
                    <a class="carousel-control left" href="#myCarousel" data-slide="prev">
                        <h2 class="lunbo_h2"><</h2>
                    </a> <a class="carousel-control right" href="#myCarousel" data-slide="next">
                    <h2 class="lunbo_h2">></h2>
                </a>
                </div>
            </div>
            <!-- 分割线 -->
            <div class="clearfix "></div>
            <div class="col-lg-12 fengexian  margin-top-10"></div>

            <div class="row">
                <!-- 新书 -->
                <div class="col-lg-8 col-md-8 col-sm-12 liebiao_background margin-top-10">
                    <h3 id="xinshu" class="xinshu">新书首发</h3>
                    <c:forEach begin="1" end="6" varStatus="st">
                        <div id="xinshu_${st.count}" class="col-lg-4 col-md-6 col-sm-6 margin-top-10">
                            <div class="thumbnail liebiao">
                                <a href="#"><img id="xinshu_img_${st.count}" src="${pageContext.request.contextPath}/IMG/2.jpg"> </a>
                                <p id="xinshu_time_${st.count}">2019-01-01</p>
                                <div class="caption">
                                    <h4>
                                        <a id="xinshu_name_${st.count}" href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                        </a>
                                    </h4>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>


                <!-- 热门列表 -->
                <div class="col-lg-4 col-md-4 pull-right remen-border margin-top-10 ">
                    <h4>热门</h4>
                    <div class="row">
                        <!-- 热门切换表头 -->
                        <ul id="remen" class="nav nav-tabs text-center ">

                            <li class="active ">
                                <div class="col-lg-4 ">
                                    <a class="btn btn-info" href="#HotToday" data-toggle="tab"> 今日 </a>
                                </div>
                            </li>
                            <li>
                                <div class="col-lg-4">
                                    <a class="btn" href="#HotWeek" data-toggle="tab">本周</a>
                                </div>
                            </li>
                            <li>
                                <div class="col-lg-4">
                                    <a class="btn" href="#HotMonth" data-toggle="tab">本月</a>
                                </div>
                            </li>

                        </ul>
                    </div>
                    <!-- 热门表头 -->
                    <div class="col-xs-3">
                        <h4>类型</h4>
                    </div>
                    <div class="col-xs-6 pull-left">
                        <h4>书名</h4>
                    </div>
                    <div class="col-xs-3">
                        <h4 class="pull-right">下载量</h4>
                    </div>
                    <div class="tab-content">
                        <!-- 内容，最多10个 -->
                        <!-- 热门今日内容 -->
                        <div class="tab-pane fade in active " id="HotToday">
                            <c:forEach begin="1" end="10" varStatus="st">
                                <div class="col-xs-3 remen-div">
                                    <span class="label label-danger">科幻哈哈哈</span>&nbsp;&nbsp;&nbsp;
                                </div>
                                <div class="col-xs-6 pull-left remen-div">
                                    <a href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                                </div>
                                <div class="col-xs-3 remen-div">
                                    <p class="pull-right">5</p>
                                </div>
                            </c:forEach>
                        </div>

                        <!--热门本周内容  -->
                        <div class="tab-pane fade " id="HotWeek">
                            <c:forEach begin="1" end="10" varStatus="st">
                                <div class="col-xs-3">
                                    <span class="label label-danger remen-div">科幻本周</span>&nbsp;&nbsp;&nbsp;
                                </div>
                                <div class="col-xs-6 pull-left remen-div">
                                    <a href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                                </div>
                                <div class="col-xs-3 remen-div">
                                    <p class="pull-right">5</p>
                                </div>
                            </c:forEach>
                        </div>
                        <!--热门本月内容  -->
                        <div class="tab-pane fade " id="HotMonth">
                            <c:forEach begin="1" end="10" varStatus="st">
                                <div class="col-xs-3">
                                    <span class="label label-danger remen-div">科幻本月</span>&nbsp;&nbsp;&nbsp;
                                </div>
                                <div class="col-xs-6 pull-left remen-div">
                                    <a href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                                </div>
                                <div class="col-xs-3 remen-div">
                                    <p class="pull-right">5</p>
                                </div>
                            </c:forEach>
                        </div>

                    </div>
                </div>

                <%--推荐图书--%>
                <div class="col-lg-4 col-md-4 pull-right tuijian-border">
                    <h4>推荐</h4>
                    <div class="row">
                        <ul id="tuijian" class="nav nav-tabs text-center ">

                            <li class="active ">
                                <div class="col-lg-12 ">
                                    <a class="btn btn-info btn-block disabled" href="#tuijian"
                                       data-toggle="tab">推荐图书 </a>
                                </div>
                            </li>

                        </ul>
                    </div>
                    <!-- 内容，最多8个 -->
                    <div class="col-xs-4">
                        <h4>类型</h4>
                    </div>
                    <div class="col-xs-8 pull-left text-center">
                        <h4>书名</h4>
                    </div>

                    <div class="tab-content">

                        <div class="tab-pane fade in active" id="tuijian-liebiao">
                            <c:forEach begin="1" end="8" varStatus="st">
                                <div class="col-xs-4 tuijian-div">
                                    <span class="label label-danger">科幻哈哈哈</span>&nbsp;&nbsp;&nbsp;
                                </div>
                                <div class="col-xs-8 pull-left text-center tuijian-div">
                                    <a href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                                </div>

                            </c:forEach>
                        </div>
                    </div>
                </div>
                <%--推荐图书 end--%>

            </div>

            <!-- 分割线 -->
            <div class="clearfix "></div>
            <div class="col-lg-12 fengexian  margin-top-10"></div>

            <!-- 分类热门推荐  -->
            <div class="row">
                <div class="col-lg-12 col-md-12 fenleiremen margin-top-10 ">
                    <!-- 分类切换表头 -->
                    <%--<h4>畅销图书</h4>--%>
                    <ul id="remenfenlei1" class="nav nav-tabs fenleiremen_tabs">
                        <li class="active "><a class="btn btn-info disabled" href="#" data-toggle="tab">科幻悬疑-推理惊悚</a>
                        </li>
                        <%--<li><a href="#" data-toggle="tab">现代文学-外国文学</a></li>
                        <li><a href="#" data-toggle="tab">军事科学-历史地理</a></li>
                        <li><a href="#" data-toggle="tab">人文社科-社会心理</a></li>
                        <li><a href="#" data-toggle="tab">旅行处世-励志鸡汤</a></li>
                        <li><a href="#" data-toggle="tab">官场商战-经济管理</a></li>
                        <li><a href="#" data-toggle="tab">生活运动-养生健体</a></li>--%>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade in active " id="">
                            <div class="row">
                                <div class="col-lg-6 fenleirenmen_neirong_left">
                                    <ul class="fenleiremen_ul">
                                        <c:forEach begin="1" end="5" varStatus="st">
                                            <li id="fenleiremen_li_${st.count}"
                                                onmousemove="fenleirenmen_display(this)">
                                                <div class="fenleirenmen_neirong_div">
                                                    <h4 class="fenleirenmen_h4">
                                                        <a href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                                                    </h4>
                                                    <a href="#"><img
                                                            class="fenleirenmen_img fenleirenmen_active display_none"
                                                            src="${pageContext.request.contextPath}/IMG/2.jpg"/></a>
                                                    <a href="#"><p
                                                            class="fenleiremen_p fenleirenmen_active display_none pull-right">
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</p>
                                                    </a>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <div class="col-lg-6 fenleirenmen_neirong-right">
                                    <ul class="fenleiremen_ul">
                                        <c:forEach begin="1" end="5" varStatus="st">
                                            <li onmousemove="fenleirenmen_display(this)">
                                                <div class="fenleirenmen_neirong_div">
                                                    <h4 class="fenleirenmen_h4">
                                                        </a> 冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</h4>
                                                    <a href="#"> <img
                                                            class="fenleirenmen_img fenleirenmen_active display_none"
                                                            src="${pageContext.request.contextPath}/IMG/2.jpg"/></a>
                                                    <a href="#"><p
                                                            class="fenleiremen_p fenleirenmen_active display_none pull-right">
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</p>
                                                    </a>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <%--<div class="tab-pane fade " id="">
                        </div>--%>
                    </div>

                </div>
            </div>

            <!-- 分割线 -->
            <div class="clearfix "></div>
            <div class="col-lg-12 fengexian  margin-top-10"></div>

            <div class="row">
                <div class="col-lg-12 col-md-12 fenleiremen margin-top-10 ">
                    <!-- 分类切换表头 -->
                    <%--<h4>畅销图书</h4>--%>
                    <ul id="remenfenlei2" class="nav nav-tabs fenleiremen_tabs">
                        <li class="active "><a class="btn btn-info disabled" href="#" data-toggle="tab">现代文学-外国文学</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade in active " id="">
                            <div class="row">
                                <div class="col-lg-6 fenleirenmen_neirong_left">
                                    <ul class="fenleiremen_ul">
                                        <c:forEach begin="1" end="5" varStatus="st">
                                            <li id="fenleiremen_li_${st.count}"
                                                onmousemove="fenleirenmen_display(this)">
                                                <div class="fenleirenmen_neirong_div">
                                                    <h4 class="fenleirenmen_h4">
                                                        <a href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                                                    </h4>
                                                    <a href="#"><img
                                                            class="fenleirenmen_img fenleirenmen_active display_none"
                                                            src="${pageContext.request.contextPath}/IMG/2.jpg"/></a>
                                                    <a href="#"><p
                                                            class="fenleiremen_p fenleirenmen_active display_none pull-right">
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</p>
                                                    </a>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <div class="col-lg-6 fenleirenmen_neirong-right">
                                    <ul class="fenleiremen_ul">
                                        <c:forEach begin="1" end="5" varStatus="st">
                                            <li onmousemove="fenleirenmen_display(this)">
                                                <div class="fenleirenmen_neirong_div">
                                                    <h4 class="fenleirenmen_h4">
                                                        </a> 冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</h4>
                                                    <a href="#"> <img
                                                            class="fenleirenmen_img fenleirenmen_active display_none"
                                                            src="${pageContext.request.contextPath}/IMG/2.jpg"/></a>
                                                    <a href="#"><p
                                                            class="fenleiremen_p fenleirenmen_active display_none pull-right">
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</p>
                                                    </a>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <%-- <div class="tab-pane fade " id="">
                         </div>--%>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>
<%@include file="footer.jsp" %>

<script src="${pageContext.request.contextPath}/JS/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/index.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/header.js"></script>
</body>
</html>
