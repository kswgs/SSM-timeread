<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Time Read</title>


</head>
<body>
<%@ include file="header.jsp" %>

<div class="container">
    <div class="row margin-top-20">

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
                            <%--<label> <input type="checkbox">自动登录--%>
                            <%--</label>--%>
                        </div>
                        <div class="col-lg-12 index_login_error">
                            <p class="text-danger">${sessionScope.loginerror}</p>
                        </div>
                        <div class="col-lg-12 index_register">
                            <div class="col-lg-6">
                                <a href="${pageContext.request.contextPath}/change_password.jsp" class="btn btn-while btn-block">重置密码</a>
                            </div>
                            <div class="col-lg-6">
                                <a href="${pageContext.request.contextPath}/register.jsp" class="btn btn-while btn-block">立即注册</a>
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
                                <a href="/user/cancel" class="btn btn-while btn-block" onclick="">退出登录</a>
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
                <div id="lunbo_img" class="div_lunbo_img carousel-inner">
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
        </div>
    </div>


</div>


<div class="container">
    <div class="row">

        <!-- 新书 -->
        <div class="col-lg-8 col-md-8 col-sm-12 liebiao_background margin-top-20">
            <%--<h4  class="xinshu_name">新书首发
                <span  class="xinshu_more"><a>....</a></span>
            </h4>--%>
            <ul class="nav nav-tabs xinshu_tabs">
                <li class="active pull-left">
                    <h4 class="xinshu_tabs_name">新书首发</h4>
                </li>
                <li class="active pull-right">
                    <h4 class="xinshu_tabs_more"><a target="_blank" href="/book/getBookByCategory?page=1&category=0&categoryParent=0">....</a>
                    </h4>
                </li>

            </ul>

            <c:forEach begin="1" end="9" varStatus="st">
                <div id="xinshu_${st.count}" class="col-lg-4 col-md-6 col-sm-6 margin-top-10">
                    <div class="liebiao thumbnail">
                        <a id="xinshu_img_a_${st.count}" target="_blank" href="#">
                            <img class="xinshu_img" id="xinshu_img_${st.count}"
                                 src="${pageContext.request.contextPath}/IMG/1.jpg">
                        </a>
                        <p id="xinshu_time_${st.count}">2019-01-01</p>
                        <div class="caption">
                            <h4 class="text-center">
                                <a id="xinshu_name_${st.count}" target="_blank" href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                </a>
                            </h4>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <%--公告栏--%>
        <div class="col-lg-4 pull-right gonggao_div">
            <h4 class="display_none">公告</h4>
            <div class="row">
                <ul id="gonggao" class="nav nav-tabs text-center margin-top-10">
                    <li class="active ">
                        <div class="col-lg-12 ">
                            <a class="btn btn-info btn-block disabled" href="#"
                               data-toggle="tab">公告</a>
                        </div>
                    </li>

                </ul>
            </div>


            <div class="tab-content">

                <div class="tab-pane fade in active" id="gonggao-liebiao">
                    <%-- <c:forEach begin="1" end="5" varStatus="st">

                         <div class="col-lg-8 pull-left text-center gonggao-div">
                             <a href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                         </div>
                         <div class="col-lg-4 gonggao-div">
                             <P>2019-01-01</P>
                         </div>

                     </c:forEach>--%>
                </div>
            </div>

        </div>


        <!-- 热门列表 -->
        <div class="col-lg-4 col-md-4 pull-right remen-border margin-top-25 ">
            <h4>热门</h4>
            <div class="row">
                <!-- 热门切换表头 -->
                <ul id="remen" class="nav nav-tabs text-center ">

                    <li class="active">
                        <div class="col-lg-4 ">
                            <a id="hot_table_1" class="btn btn-info" href="#hot_1" data-toggle="tab" data-Hot="1">今日</a>
                        </div>
                    </li>
                    <li>
                        <div class="col-lg-4">
                            <a id="hot_table_2" class="btn" href="#hot_2" data-toggle="tab" data-Hot="2">本周</a>
                        </div>
                    </li>
                    <li>
                        <div class="col-lg-4">
                            <a id="hot_table_3" class="btn" href="#hot_3" data-toggle="tab" data-Hot="3">本月</a>
                        </div>
                    </li>

                </ul>
            </div>
            <!-- 热门表头 -->
            <div class="col-lg-4 text-center">
                <h5>分类</h5>
            </div>
            <div class="col-lg-8 text-center">
                <h5>书名</h5>
            </div>
            <%--<div class="col-lg-2">
                <h5 class="pull-right">下载</h5>
            </div>--%>
            <div class="tab-content">
                <!-- 内容，最多10个 -->
                <!-- 热门今日内容 -->
                <div class="tab-pane fade in active " id="hot_1">
                    <%--<c:forEach begin="1" end="10" varStatus="st">
                        <div class="col-lg-4 remen-div">
                            <span class="label label-danger">网络小说(女频)</span>&nbsp;&nbsp;&nbsp;
                        </div>
                        <div class="col-lg-8 pull-left remen-div">
                            <a href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                        </div>
                        &lt;%&ndash;<div class="col-lg-2 remen-div">
                            <p class="pull-right">5</p>
                        </div>&ndash;%&gt;
                    </c:forEach>--%>
                </div>

                <!--热门本周内容  -->
                <div class="tab-pane fade " id="hot_2">
                    <%--<c:forEach begin="1" end="10" varStatus="st">
                        <div class="col-lg-4">
                            <span class="label label-danger remen-div">网络小说(女频)</span>&nbsp;&nbsp;&nbsp;
                        </div>
                        <div class="col-lg-8 pull-left remen-div">
                            <a href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                        </div>
                        &lt;%&ndash;<div class="col-lg-2 remen-div">
                            <p class="pull-right">5</p>
                        </div>&ndash;%&gt;
                    </c:forEach>--%>
                </div>
                <!--热门本月内容  -->
                <div class="tab-pane fade " id="hot_3">
                    <%-- <c:forEach begin="1" end="10" varStatus="st">
                         <div class="col-lg-4">
                             <span class="label label-danger remen-div">网络小说(女频)</span>&nbsp;&nbsp;&nbsp;
                         </div>
                         <div class="col-lg-8 pull-left remen-div">
                             <a href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                         </div>
                         &lt;%&ndash;<div class="col-lg-2 remen-div">
                             <p class="pull-right">5</p>
                         </div>&ndash;%&gt;
                     </c:forEach>--%>
                </div>

            </div>
        </div>


        <%--推荐图书--%>
        <div class="col-lg-4 col-md-4 pull-right tuijian-border margin-top-25">
            <h4 class="display_none">推荐</h4>
            <div class="row">
                <ul id="tuijian" class="nav nav-tabs text-center margin-top-10">

                    <li class="active ">
                        <div class="col-lg-12 ">
                            <a class="btn btn-info btn-block disabled" href="#tuijian"
                               data-toggle="tab">推荐图书</a>
                        </div>
                    </li>

                </ul>
            </div>
            <!-- 内容，最多8个 -->
            <div class="col-xs-4 text-center">
                <h5>分类</h5>
            </div>
            <div class="col-xs-8 pull-left text-center">
                <h5>书名</h5>
            </div>

            <div class="tab-content">

                <div class="tab-pane fade in active" id="tuijian-liebiao">
                    <%-- <c:forEach begin="1" end="9" varStatus="st">
                         <div class="col-xs-4 tuijian-div">
                             <span class="label label-danger">网络小说(女频)</span>&nbsp;&nbsp;&nbsp;
                         </div>
                         <div class="col-xs-8 pull-left text-center tuijian-div">
                             <a href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                         </div>

                     </c:forEach>--%>
                </div>
            </div>
        </div>
        <%--推荐图书 end--%>


    </div>
</div>


<div class="container">
    <div class="row">

        <%--随机推荐图书--%>
        <div class="col-lg-4 col-md-3 pull-right index_suijituijian-border margin-top-15">
            <h4 class="display_none">随机推荐</h4>
            <div class="row">
                <ul id="suijituijian" class="nav nav-tabs text-center margin-top-10">

                    <li class="active ">
                        <div class="col-lg-12 ">
                            <a class="btn btn-info btn-block disabled" href="#"
                               data-toggle="tab">随机推荐</a>
                        </div>
                    </li>

                </ul>
            </div>

            <div id="suijituijian_list" class="suijituijian_list">
                <%--<c:forEach begin="1" end="10" varStatus="st">
                    <div class="suijituijian_list_neirong">
                        <div class="row">
                            <div class="col-lg-3">
                                <img src="${pageContext.request.contextPath}/IMG/1.jpg">
                            </div>
                            <div class="col-lg-9">
                                <p  class="suijituijian_p"><a href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                                </p>
                                <span class="label label-danger">网络小说(女频)</span>
                                <span class="pull-right suijituijian_time">09-09</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>--%>

            </div>


        </div>
        <%--随机推荐图书 end--%>

        <%--最新图书类型 畅销--%>
        <div class="col-lg-8 margin-top-10">
            <!-- 最新图书类型列表 -->
            <div class="row">
                <!-- 最新图书类型切换表头 -->
                <ul id="zuixinleixing_changxiao" class="nav nav-tabs text-center ">

                    <li class="active ">
                        <div class="col-lg-3 ">
                            <a id="zuixinleixing_changxiang_biaotou_1" class="btn btn-info" href="#changxiao_leixing_1"
                               data-toggle="tab" data-category="5">科幻悬疑-推理惊悚</a>
                        </div>
                    </li>
                    <li>
                        <div class="col-lg-3">
                            <a id="zuixinleixing_changxiang_biaotou_2" class="btn" href="#changxiao_leixing_2"
                               data-toggle="tab" data-category="6">现代文学-外国文学</a>
                        </div>
                    </li>
                    <li>
                        <div class="col-lg-3">
                            <a id="zuixinleixing_changxiang_biaotou_3" class="btn" href="#changxiao_leixing_3"
                               data-toggle="tab" data-category="7">人文社科-社会心理</a>
                        </div>
                    </li>
                    <li>
                        <div class="col-lg-3">
                            <a id="zuixinleixing_changxiang_biaotou_4" class="btn" href="#changxiao_leixing_4"
                               data-toggle="tab" data-category="9">旅行处世-励志鸡汤</a>
                        </div>
                    </li>

                </ul>
            </div>

            <div class="tab-content">

                <div class="tab-pane fade in active margin-top-10" id="changxiao_leixing_1">
                    <c:forEach begin="1" end="3" varStatus="st">
                        <div class="media remenleixing_list relative">
                            <div class="media-left ">
                                <a id="xinshuleixing_changxiao_img_a_changxiao_leixing_1_${st.count}" target="_blank" href="#">
                                    <img id="xinshuleixing_changxiao_img_changxiao_leixing_1_${st.count}"
                                         class="media-object remenleixing_list_img"
                                         src="${pageContext.request.contextPath}/IMG/1.jpg">
                                </a>
                            </div>
                            <div class="media-body ">
                                <h4 class="media-heading remenleixing_list_name"><a
                                        id="xinshuleixing_changxiao_name_a_changxiao_leixing_1_${st.count}" target="_blank" href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                                </h4>
                                <h4 class="xinshuleixing_changxiao_h4">简介</h4>
                                <p id="xinshuleixing_changxiao_introduction_changxiao_leixing_1_${st.count}"
                                   class="media-heading remenleixing_list_p">
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞

                                </p>
                                <span id="xinshuleixing_changxiao_time_changxiao_leixing_1_${st.count}"
                                      class="remenleixing_list_time">2019-01-01</span>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="tab-pane fade margin-top-10" id="changxiao_leixing_2">
                    <c:forEach begin="1" end="3" varStatus="st">
                        <div class="media remenleixing_list relative">
                            <div class="media-left ">
                                <a id="xinshuleixing_changxiao_img_a_changxiao_leixing_2_${st.count}" target="_blank" href="#">
                                    <img id="xinshuleixing_changxiao_img_changxiao_leixing_2_${st.count}"
                                         class="media-object remenleixing_list_img"
                                         src="${pageContext.request.contextPath}/IMG/1.jpg">
                                </a>
                            </div>
                            <div class="media-body ">
                                <h4 class="media-heading remenleixing_list_name"><a
                                        id="xinshuleixing_changxiao_name_a_changxiao_leixing_2_${st.count}" target="_blank" href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                                </h4>
                                <h4 class="xinshuleixing_changxiao_h4">简介</h4>
                                <p id="xinshuleixing_changxiao_introduction_changxiao_leixing_2_${st.count}"
                                   class="media-heading remenleixing_list_p">
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                </p>
                                <span id="xinshuleixing_changxiao_time_changxiao_leixing_2_${st.count}"
                                      class="remenleixing_list_time">2019-01-01</span>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="tab-pane fade margin-top-10" id="changxiao_leixing_3">
                    <c:forEach begin="1" end="3" varStatus="st">
                        <div class="media remenleixing_list relative">
                            <div class="media-left ">
                                <a id="xinshuleixing_changxiao_img_a_changxiao_leixing_3_${st.count}" target="_blank" href="#">
                                    <img id="xinshuleixing_changxiao_img_changxiao_leixing_3_${st.count}"
                                         class="media-object remenleixing_list_img"
                                         src="${pageContext.request.contextPath}/IMG/1.jpg">
                                </a>
                            </div>
                            <div class="media-body ">
                                <h4 class="media-heading remenleixing_list_name"><a
                                        id="xinshuleixing_changxiao_name_a_changxiao_leixing_3_${st.count}" target="_blank" href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                                </h4>
                                <h4 class="xinshuleixing_changxiao_h4">简介</h4>
                                <p id="xinshuleixing_changxiao_introduction_changxiao_leixing_3_${st.count}"
                                   class="media-heading remenleixing_list_p">
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞

                                </p>
                                <span id="xinshuleixing_changxiao_time_changxiao_leixing_3_${st.count}"
                                      class="remenleixing_list_time">2019-01-01</span>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="tab-pane fade margin-top-10" id="changxiao_leixing_4">
                    <c:forEach begin="1" end="3" varStatus="st">
                        <div class="media remenleixing_list relative">
                            <div class="media-left ">
                                <a id="xinshuleixing_changxiao_img_a_changxiao_leixing_4_${st.count}" target="_blank" href="#">
                                    <img id="xinshuleixing_changxiao_img_changxiao_leixing_4_${st.count}"
                                         class="media-object remenleixing_list_img"
                                         src="${pageContext.request.contextPath}/IMG/1.jpg">
                                </a>
                            </div>
                            <div class="media-body ">
                                <h4 class="media-heading remenleixing_list_name"><a
                                        id="xinshuleixing_changxiao_name_a_changxiao_leixing_4_${st.count}" target="_blank" href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                                </h4>
                                <h4 class="xinshuleixing_changxiao_h4">简介</h4>
                                <p id="xinshuleixing_changxiao_introduction_changxiao_leixing_4_${st.count}"
                                   class="media-heading remenleixing_list_p">
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞

                                </p>
                                <span id="xinshuleixing_changxiao_time_changxiao_leixing_4_${st.count}"
                                      class="remenleixing_list_time">2019-01-01</span>
                            </div>
                        </div>
                    </c:forEach>
                </div>

            </div>


        </div>
        <%--最新图书类型 畅销end--%>

        <%--最新图书类型 网络--%>
        <div class="col-lg-8 margin-top-10">
            <!-- 最新图书类型列表 -->
            <div class="row">
                <!-- 最新图书类型切换表头 -->
                <ul id="zuixinleixing_wangluo" class="nav nav-tabs text-center ">

                    <li class="active ">
                        <div class="col-lg-3 ">
                            <a id="zuixinleixing_wangluo_biaotou_1" class="btn btn-info" href="#wangluo_leixing_1"
                               data-toggle="tab" data-category="13">武侠玄幻-仙侠修真</a>
                        </div>
                    </li>
                    <li>
                        <div class="col-lg-3">
                            <a id="zuixinleixing_wangluo_biaotou_2" class="btn" href="#wangluo_leixing_2"
                               data-toggle="tab" data-category="14">科幻异能-西方奇幻</a>
                        </div>
                    </li>
                    <li>
                        <div class="col-lg-3">
                            <a id="zuixinleixing_wangluo_biaotou_3" class="btn" href="#wangluo_leixing_3"
                               data-toggle="tab" data-category="16">都市言情-穿越重生</a>
                        </div>
                    </li>
                    <li>
                        <div class="col-lg-3">
                            <a id="zuixinleixing_wangluo_biaotou_4" class="btn" href="#wangluo_leixing_4"
                               data-toggle="tab" data-category="12">历史架空-热血战争</a>
                        </div>
                    </li>

                </ul>
            </div>

            <div class="tab-content">

                <div class="tab-pane fade in active margin-top-10" id="wangluo_leixing_1">
                    <c:forEach begin="1" end="3" varStatus="st">
                        <div class="media remenleixing_list relative">
                            <div class="media-left ">
                                <a id="xinshuleixing_wangluo_img_a_wangluo_leixing_1_${st.count}" target="_blank" href="#">
                                    <img id="xinshuleixing_wangluo_img_wangluo_leixing_1_${st.count}"
                                         class="media-object remenleixing_list_img"
                                         src="${pageContext.request.contextPath}/IMG/1.jpg">
                                </a>
                            </div>
                            <div class="media-body ">
                                <h4 class="media-heading remenleixing_list_name"><a
                                        id="xinshuleixing_wangluo_name_a_wangluo_leixing_1_${st.count}" target="_blank" href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                                </h4>
                                <h4 class="xinshuleixing_changxiao_h4">简介</h4>
                                <p id="xinshuleixing_wangluo_introduction_wangluo_leixing_1_${st.count}"
                                   class="media-heading remenleixing_list_p">
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞

                                </p>
                                <span id="xinshuleixing_wangluo_time_wangluo_leixing_1_${st.count}"
                                      class="remenleixing_list_time">2019-01-01</span>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="tab-pane fade margin-top-10" id="wangluo_leixing_2">
                    <c:forEach begin="1" end="3" varStatus="st">
                        <div class="media remenleixing_list relative">
                            <div class="media-left ">
                                <a id="xinshuleixing_wangluo_img_a_wangluo_leixing_2_${st.count}" target="_blank" href="#">
                                    <img id="xinshuleixing_wangluo_img_wangluo_leixing_2_${st.count}"
                                         class="media-object remenleixing_list_img"
                                         src="${pageContext.request.contextPath}/IMG/1.jpg">
                                </a>
                            </div>
                            <div class="media-body ">
                                <h4 class="media-heading remenleixing_list_name"><a
                                        id="xinshuleixing_wangluo_name_a_wangluo_leixing_2_${st.count}" target="_blank" href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                                </h4>
                                <h4 class="xinshuleixing_changxiao_h4">简介</h4>
                                <p id="xinshuleixing_wangluo_introduction_wangluo_leixing_2_${st.count}"
                                   class="media-heading remenleixing_list_p">
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞

                                </p>
                                <span id="xinshuleixing_wangluo_time_wangluo_leixing_2_${st.count}"
                                      class="remenleixing_list_time">2019-01-01</span>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="tab-pane fade margin-top-10" id="wangluo_leixing_3">
                    <c:forEach begin="1" end="3" varStatus="st">
                        <div class="media remenleixing_list relative">
                            <div class="media-left ">
                                <a id="xinshuleixing_wangluo_img_a_wangluo_leixing_3_${st.count}" target="_blank" href="#">
                                    <img id="xinshuleixing_wangluo_img_wangluo_leixing_3_${st.count}"
                                         class="media-object remenleixing_list_img"
                                         src="${pageContext.request.contextPath}/IMG/1.jpg">
                                </a>
                            </div>
                            <div class="media-body ">
                                <h4 class="media-heading remenleixing_list_name"><a
                                        id="xinshuleixing_wangluo_name_a_wangluo_leixing_3_${st.count}" target="_blank" href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                                </h4>
                                <h4 class="xinshuleixing_changxiao_h4">简介</h4>
                                <p id="xinshuleixing_wangluo_introduction_wangluo_leixing_3_${st.count}"
                                   class="media-heading remenleixing_list_p">
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞

                                </p>
                                <span id="xinshuleixing_wangluo_time_wangluo_leixing_3_${st.count}"
                                      class="remenleixing_list_time">2019-01-01</span>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="tab-pane fade margin-top-10" id="wangluo_leixing_4">
                    <c:forEach begin="1" end="3" varStatus="st">
                        <div class="media remenleixing_list relative">
                            <div class="media-left ">
                                <a id="xinshuleixing_wangluo_img_a_wangluo_leixing_4_${st.count}" target="_blank" href="#">
                                    <img id="xinshuleixing_wangluo_img_wangluo_leixing_4_${st.count}"
                                         class="media-object remenleixing_list_img"
                                         src="${pageContext.request.contextPath}/IMG/1.jpg">
                                </a>
                            </div>
                            <div class="media-body ">
                                <h4 class="media-heading remenleixing_list_name"><a
                                        id="xinshuleixing_wangluo_name_a_wangluo_leixing_4_${st.count}" target="_blank" href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                                </h4>
                                <h4 class="xinshuleixing_changxiao_h4">简介</h4>
                                <p id="xinshuleixing_wangluo_introduction_wangluo_leixing_4_${st.count}"
                                   class="media-heading remenleixing_list_p">
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞

                                </p>
                                <span id="xinshuleixing_wangluo_time_wangluo_leixing_4_${st.count}"
                                      class="remenleixing_list_time">2019-01-01</span>
                            </div>
                        </div>
                    </c:forEach>
                </div>

            </div>


        </div>

        <%--最新图书类型 网络end--%>


    </div>
</div>


<div class="container">

    <!-- 分类热门推荐  -->
    <div class="row">
        <div class="col-lg-12 col-md-12 fenleiremen margin-top-10 ">
            <!-- 分类切换表头 -->
            <%--<h4>畅销图书</h4>--%>
            <ul id="remenfenlei1" class="nav nav-tabs fenleiremen_tabs">
                <li class=" col-lg-6 active pull-left">
                    <div class="col-lg-9 pull-left fenleiremen_tabs_name">
                        <h4>畅销图书</h4>
                    </div>
                    <div class="col-lg-3 pull-right">
                        <h4 class="pull-right"><a target="_blank" href="/book/getBookByCategory?page=1&category=0&categoryParent=1">....</a></h4>
                    </div>

                </li>
                <li class=" col-lg-6 active pull-left">
                    <div class="col-lg-9 pull-left fenleiremen_tabs_name">
                        <h4>网络小说</h4>
                    </div>
                    <div class="col-lg-3 pull-right">
                        <h4 class="pull-right"><a target="_blank" href="/book/getBookByCategory?page=1&category=0&categoryParent=2">....</a></h4>
                    </div>

                </li>

            </ul>
            <div class="tab-content">
                <div class="tab-pane fade in active " id="">
                    <div class="row">
                        <div class="col-lg-6 fenleirenmen_neirong_left">
                            <ul id="remenfenlei_changxiao" data-categoryParent="1" class="fenleiremen_ul">
                                <c:forEach begin="1" end="5" varStatus="st">
                                    <li id="fenleiremen_li_${st.count}"
                                        onmousemove="fenleirenmen_display(this)">
                                        <div class="fenleirenmen_neirong_div">
                                            <h4 class="fenleirenmen_h4">
                                                <a id="remenfenlei_changxiao_name_${st.count}" target="_blank" href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                                            </h4>
                                            <a id="remenfenlei_changxiao_img_a_${st.count}" target="_blank" href="#"><img
                                                    id="remenfenlei_changxiao_img_${st.count}"
                                                    class="fenleirenmen_img fenleirenmen_active display_none"
                                                    src="${pageContext.request.contextPath}/IMG/1.jpg"/></a>
                                            <a id="remenfenlei_changxiao_p_a_${st.count}" target="_blank" href="#"><p
                                                    id="remenfenlei_changxiao_p_${st.count}"
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
                        <div class="col-lg-6 fenleirenmen_neirong_right">
                            <ul id="remenfenlei_wangluo" data-categoryParent="2" class="fenleiremen_ul">
                                <c:forEach begin="1" end="5" varStatus="st">
                                    <li id="fenleiremen_li_${st.count}"
                                        onmousemove="fenleirenmen_display(this)">
                                        <div class="fenleirenmen_neirong_div">
                                            <h4 class="fenleirenmen_h4">
                                                <a id="remenfenlei_wangluo_name_${st.count}" target="_blank" href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                                            </h4>
                                            <a id="remenfenlei_wangluo_img_a_${st.count}" target="_blank" href="#"><img
                                                    id="remenfenlei_wangluo_img_${st.count}"
                                                    class="fenleirenmen_img fenleirenmen_active display_none"
                                                    src="${pageContext.request.contextPath}/IMG/1.jpg"/></a>
                                            <a id="remenfenlei_wangluo_p_a_${st.count}" target="_blank" href="#"><p
                                                    id="remenfenlei_wangluo_p_${st.count}"
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


    <div class="row">
        <div class="col-lg-12 col-md-12 fenleiremen margin-top-30 ">
            <!-- 分类切换表头 -->
            <%--<h4>畅销图书</h4>--%>
            <ul id="remenfenlei1" class="nav nav-tabs fenleiremen_tabs">
                <li class=" col-lg-6 active pull-left">
                    <div class="col-lg-9 pull-left fenleiremen_tabs_name">
                        <h4>网络小说（女频）</h4>
                    </div>
                    <div class="col-lg-3 pull-right">
                        <h4 class="pull-right"><a target="_blank" href="/book/getBookByCategory?page=1&category=0&categoryParent=3">....</a></h4>
                    </div>

                </li>
                <li class=" col-lg-6 active pull-left">
                    <div class="col-lg-9 pull-left fenleiremen_tabs_name">
                        <h4>学习教材</h4>
                    </div>
                    <div class="col-lg-3 pull-right">
                        <h4 class="pull-right"><a target="_blank" href="/book/getBookByCategory?page=1&category=0&categoryParent=4">....</a></h4>
                    </div>

                </li>

            </ul>
            <div class="tab-content">
                <div class="tab-pane fade in active " id="">
                    <div class="row">
                        <div class="col-lg-6 fenleirenmen_neirong_left">
                            <ul id="remenfenlei_wangluonvpin" data-categoryParent="3" class="fenleiremen_ul">
                                <c:forEach begin="1" end="5" varStatus="st">
                                    <li id="fenleiremen_li_${st.count}"
                                        onmousemove="fenleirenmen_display(this)">
                                        <div class="fenleirenmen_neirong_div">
                                            <h4 class="fenleirenmen_h4">
                                                <a id="remenfenlei_wangluonvpin_name_${st.count}" target="_blank" href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                                            </h4>
                                            <a id="remenfenlei_wangluonvpin_img_a_${st.count}" target="_blank" href="#"><img
                                                    id="remenfenlei_wangluonvpin_img_${st.count}"
                                                    class="fenleirenmen_img fenleirenmen_active display_none"
                                                    src="${pageContext.request.contextPath}/IMG/1.jpg"/></a>
                                            <a id="remenfenlei_wangluo_p_a_${st.count}" target="_blank" href="#"><p
                                                    id="remenfenlei_wangluonvpin_p_${st.count}"
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
                        <div class="col-lg-6 fenleirenmen_neirong_right">
                            <ul id="remenfenlei_xuexi" data-categoryParent="4" class="fenleiremen_ul">
                                <c:forEach begin="1" end="5" varStatus="st">
                                    <li id="fenleiremen_li_${st.count}"
                                        onmousemove="fenleirenmen_display(this)">
                                        <div class="fenleirenmen_neirong_div">
                                            <h4 class="fenleirenmen_h4">
                                                <a id="remenfenlei_xuexi_name_${st.count}" target="_blank" href="#">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</a>
                                            </h4>
                                            <a id="remenfenlei_xuexi_img_a_${st.count}" target="_blank" href="#"><img
                                                    id="remenfenlei_xuexi_img_${st.count}"
                                                    class="fenleirenmen_img fenleirenmen_active display_none"
                                                    src="${pageContext.request.contextPath}/IMG/1.jpg"/></a>
                                            <a id="remenfenlei_xuexi_p_a_${st.count}" target="_blank" href="#"><p
                                                    id="remenfenlei_xuexi_p_${st.count}"
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




</div>
<%@include file="footer.jsp" %>

<script src="${pageContext.request.contextPath}/JS/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/index.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/header.js"></script>

</body>
</html>
