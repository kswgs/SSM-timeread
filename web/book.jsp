<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title id="bookTitle">${sessionScope.bookDateiled.name}</title>

</head>
<%@include file="header.jsp" %>
<body class="book_body">

<div class="container">
    <%--图书位置--%>
    <div class="row">
        <h5><span class="glyphicon glyphicon-home"></span> 首页 >
            <a href="#">${sessionScope.bookCategoryParent}</a> >
            <a href="#">${sessionScope.bookCategory}</a> >
            ${sessionScope.bookDetailed.name}
        </h5>

        <div class="col-lg-12 tushuxinxi_div">
            <input id="bookId" type="hidden"
                   value="${sessionScope.bookDetailed.book_id}${pageContext.request.contextPath}">
            <input id="shoppingId" type="hidden" value="${sessionScope.shoppingItem.shopping_id}">
            <h3 id="bookName"
                class="text-center margin-top-25 tushuxinxi_div_name">${sessionScope.bookDetailed.name}</h3>
            <img class="center-block  margin-top-25 tushuxinxi_div_img" src="${sessionScope.bookDetailed.image}">
            <h3>作者</h3>
            <p id="bookAuthor">${sessionScope.bookDetailed.author}</p>

            <h3>内容简介</h3>
            <p>${sessionScope.bookDetailed.introduction}</p>


            <%--如果是合集就显示分册目录--%>
            <%--<div class="tushuxinxi_mulu">
                <h3>目录</h3>
                <h4>《权力的游戏》</h4>
                <h4>《列王的纷争》</h4>
                <h4>《冰雨的风暴》</h4>
                <h4>《群鸦的盛宴》</h4>
                <h4>《魔龙的狂舞》</h4>
            </div>--%>

            <%--分隔线--%>
            <div class="tushu_xian margin-top-10"></div>

            <div class="row">
                <%--下载信息--%>
                <div id="xiazaixinxi" class="col-lg-10 col-lg-offset-1 tushuxinxi_xiazai">
                    <h4>下载信息</h4>
                    <input type="hidden" value="${sessionScope.shoppingItem}">
                    <c:choose>
                        <c:when test="${sessionScope.user == null}">
                            <p>此图书所需积分为 <span class="text-danger"> ${sessionScope.bookDetailed.book_point} </span> 积分，请先
                                <a href="${pageContext.request.contextPath}/login.jsp" class="btn btn-info">登录</a></p>
                        </c:when>
                        <c:when test="${sessionScope.user != null && sessionScope.shoppingItem == null}">
                            <p>此图书所需积分为 <span class="text-danger"> ${sessionScope.bookDetailed.book_point} </span> 积分，
                                <button class="btn btn-info" data-toggle="modal" data-target="#shoppingModel">立即购买
                                </button>
                            </p>
                        </c:when>
                        <c:when test="${sessionScope.user != null && sessionScope.shoppingItem != null}">
                            <p>此图书所需积分为 <span class="text-danger"> ${sessionScope.bookDetailed.book_point} </span> 积分，
                                点击下方按钮立即下载</p>
                            <span class="tushu_yigou">已购买</span>
                        </c:when>
                    </c:choose>

                    <table class="table table-bordered table-hover">

                        <thead>
                        <tr>
                            <th class="text-center" style="width: 350px">图书</th>
                            <th class="text-center" style="width: 120px">类型</th>
                            <th class="text-center" style="width: 110px">大小</th>
                            <%--<th class="text-center" style="width: 120px">下载次数</th>--%>
                            <th style="width: 200px">下载</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${sessionScope.bookDetailed.bookFile}" var="bookFile">
                            <tr>
                                <td class="text-center">${sessionScope.bookDetailed.name}
                                    - ${sessionScope.bookDetailed.author}</td>
                                <td class="text-center">${bookFile.file_type}</td>
                                <td class="text-center">${bookFile.file_size}</td>
                                    <%--<td class="text-center">560001</td>--%>
                                <td><a href="${bookFile.path}" tabindex="0" class="btn btn-info btn_jinggao "
                                       role="button" data-toggle="popover"
                                       data-trigger="focus">下载</a></td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>

                </div>
            </div>

            <!-- 购买模态框 -->
            <div class="modal fade" id="shoppingModel" tabindex="-1" role="dialog" aria-labelledby="MyShoppingModel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="MyShoppingModel">购买</h4>
                        </div>
                        <div class="modal-body">
                            <h4>图书：${sessionScope.bookDetailed.name} - ${sessionScope.bookDetailed.author}</h4>
                            <h4>所需积分：<span id="bookPoint"
                                           data-point="${sessionScope.bookDetailed.book_point}"> ${sessionScope.bookDetailed.book_point} </span>
                            </h4>
                            <h4>拥有积分：<span id="userPoint"
                                           data-point="${sessionScope.user.userDetailed.point}"> ${sessionScope.user.userDetailed.point} </span>
                            </h4>
                            <h4>购买后剩余积分：<span id="shengyu">  </span></h4>
                        </div>
                        <div class="modal-footer">
                            <button id="shoppingSubmit" type="button" class="btn btn-info" data-dismiss="modal">购买
                            </button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close">取消
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <%--分隔线--%>
            <div class="tushu_xian  margin-top-10"></div>

            <%--已登录显示的发表评论框--%>
            <div class="row margin-top-10">
                <div class="col-lg-10 col-lg-offset-1 tushuxinxi_fabiao">
                    <h4>发表评论</h4>
                    <c:choose>
                        <c:when test="${sessionScope.user == null}">
                            <p class="text-center">您必须<a href="${pageContext.request.contextPath}/login.jsp"
                                                         class="btn btn-info">登录</a>才能发表评论</p>
                        </c:when>
                        <c:when test="${sessionScope.user != null}">
                            <div class="tushuxinxi_fabiao_y">
                                <div class="tushuxinxi_fabiao_user">
                                    <p class="text-center">${sessionScope.user.username} | <a href="/user/cancel">退出</a></p>
                                    <img data-imapath="${sessionScope.user.userDetailed.image_path}" src="${sessionScope.user.userDetailed.image_path}">
                                </div>

                                <textarea id="comment_content" rows="5"></textarea>

                                <button id="comment_submit" type="button"
                                        class="btn btn-fabiao margin-top-10 pull-right">提交评论
                                </button>

                            </div>
                        </c:when>
                    </c:choose>


                </div>
            </div>


            <div class="row margin-top-10">
                <h4 class="col-lg-offset-1">评论：</h4>

                <%--无回复样式--%>
                <ol id="pinglun_list" class="tushuxinxi_pinglun_ol">
                    <%--<li>
                        <div class="col-lg-10 col-lg-offset-1 tushuxinxi_pinglun_div margin-top-10">
                            <p class="margin-top-10 text-center">
                                本书还未有评论
                            </p>
                        </div>
                    </li>--%>
                    <%--<c:forEach begin="1" end="2">
                        <li class="">
                            <div class="col-lg-10 col-lg-offset-1 tushuxinxi_pinglun_div margin-top-10">
                                <div class="tushuxinxi_pinglun_user">
                                    <img src="${pageContext.request.contextPath}/IMG/2.jpg">
                                    <p class="text-center">kswgs：</p>
                                    <span class="tushuxinxi_pinglun_time pull-right">2019-01-01 15:55</span>
                                </div>
                                <div class="tushu_xian2"></div>
                                <p class="margin-top-10">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                    冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</p>
                            </div>
                        </li>
                    </c:forEach>--%>
                </ol>

                <%--有回复样式--%>
                <%--<ol class="tushuxinxi_pinglun_ol">
                    <div class="col-lg-10 col-lg-offset-1 tushuxinxi_pinglun_div  margin-top-10">
                        <div class="tushuxinxi_pinglun_user">
                            <img src="${pageContext.request.contextPath}/IMG/2.jpg">
                            <p class="text-center">kswgs：</p>
                            <span class="tushuxinxi_pinglun_time pull-right">2019-01-01 15:55</span>
                        </div>
                        <div class="tushu_xian2"></div>
                        <p class="margin-top-10">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                            冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                            冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</p>
                    </div>
                    <ul class="tushuxinxi_pinglun_ul">
                        <c:forEach begin="1" end="2">
                            <li>
                                <div class="col-lg-10 col-lg-offset-1 tushuxinxi_pinglun_div  margin-top-10">

                                    <div class="tushuxinxi_pinglun_user">
                                        <img src="${pageContext.request.contextPath}/IMG/2.jpg">
                                        <p class="text-center">kswgs：</p>
                                        <span class="tushuxinxi_pinglun_time pull-right">2019-01-01 15:55</span>
                                    </div>
                                    <div class="tushu_xian2"></div>
                                    <p class="margin-top-10">冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞
                                        冰与火之歌系列新版全集（共15册）：权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞权力的游戏+列王的纷争+冰雨的风暴+群鸦的盛宴+魔龙的狂舞</p>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </ol>--%>

            </div>


        </div>
    </div>

</div>

<%@include file="footer.jsp" %>

<script src="${pageContext.request.contextPath}/JS/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/header.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/book.js"></script>
</body>
</html>
