<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/backStyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/layui.css">
</head>
<body>
<form id="addBookForm" class="layui-form" action="">
    <div class="layui-container">
        <div class="layui-row">
            <h2 class="newUser layui-col-lg-offset2">新增图书</h2>
            <hr class="layui-bg-green">
            <div class="layui-col-lg12">
                <div class="layui-row">
                    <div class="layui-col-lg8">
                        <div class="layui-form-item">
                            <label class="layui-form-label">图书名</label>
                            <div class="layui-input-block">
                                <input type="text" id="bookname" name="bookname" required lay-verify="required"
                                       placeholder="请输入图书名"
                                       autocomplete="off" class="layui-input" onblur="checkbookname(this)">
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-lg4">
                        <div id="bookname_error"
                             class="layui-form-mid xlayui-word-aux margin-left-10"></div>
                    </div>
                </div>
                <div class="layui-row">
                    <div class="layui-col-lg8">
                        <div class="layui-form-item">
                            <label class="layui-form-label">作者</label>
                            <div class="layui-input-block">
                                <input type="text" id="author" name="author" required lay-verify="required"
                                       placeholder="请输入作者"
                                       autocomplete="off" class="layui-input" onblur="checkauthor(this)">
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-lg4">
                        <div id="author_error"
                             class="layui-form-mid xlayui-word-aux margin-left-10 "></div>
                    </div>
                </div>
                <div class="layui-row">
                    <div class="layui-col-lg8">
                        <div class="layui-form-item">
                            <label class="layui-form-label">所需积分</label>
                            <div class="layui-input-block">
                                <input type="text" id="bookpoint" name="bookpoint" required lay-verify="required"
                                       placeholder="请输入所需积分"
                                       autocomplete="off" class="layui-input" onblur="checkpoint(this)">
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-lg4">
                        <div id="bookpoint_error"
                             class="layui-form-mid xlayui-word-aux margin-left-10 "></div>
                    </div>
                </div>
                <div class="layui-row">
                    <div class="layui-col-lg8">
                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label">图书简介</label>
                            <div class="layui-input-block">
                                <textarea id="introduction" name="introduction" placeholder="请输入图书简介"
                                          class="layui-textarea" onblur="checkintroduction(this)"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-lg4">
                        <div id="introduction_error"
                             class="layui-form-mid xlayui-word-aux margin-left-10 "></div>
                    </div>
                </div>
                <div class="layui-row">
                    <div class="layui-col-lg8">
                        <div class="layui-form-item">
                            <label class="layui-form-label">图书分类</label>
                            <div class="layui-input-block">
                                <select id="bookCategoryParent" name="bookCategoryParent" lay-filter="categoryParent">
                                    <option value="">请选择一个分类</option>

                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-row">
                    <div class="layui-col-lg8">
                        <div class="layui-form-item">
                            <label class="layui-form-label">图书类别</label>
                            <div class="layui-input-block">
                                <select id="bookCategory" name="bookCategory" lay-verify="">

                                </select>
                            </div>
                            <input id="category" type="hidden" value="">
                        </div>
                    </div>
                </div>
            </div>

            <div class="layui-upload margin-top-15">
                <label class="layui-form-label">图片上传</label>
                <div class="layui-row">
                    <div class="layui-col-lg3">
                        <div class="layui-row">
                            <div class="layui-col-lg12">
                                <button type="button" class="layui-btn layui-btn-normal margin-top-40" id="btn_bookImg">
                                    上传图片（只限上传一张)
                                </button>
                                <span class="layui-inline layui-upload-choose"></span>
                            </div>
                        </div>
                        <div class="layui-row">
                            <div class="layui-col-lg12">
                                <button type="button" class="layui-btn margin-top-40" id="btn_bookImgAction">开始上传图片
                                </button>
                            </div>
                        </div>


                    </div>
                    <div class="layui-col-lg4 1layui-col-lg-offset1">
                        <p>预览图</p>
                        <input class="layui-upload-file" type="file" accept="undefined" name="file">
                        <div class="layui-upload-list book_img" id="bookImgShow">
                        </div>
                    </div>
                    <div class="layui-col-lg3 img_success">
                        <p>状态</p>
                        <h3 id="imgSuccess" class="display_none">图片上传成功</h3>
                    </div>

                </div>
            </div>
            <hr class="layui-bg-green">
            <div class="layui-upload">
                <button type="button" class="layui-btn layui-btn-normal" id="btn_bookFile">选择图书文件</button>
                <input class="layui-upload-file" type="file" accept="undefined" name="file" multiple="">
                <div class="layui-upload-list">
                    <table class="layui-table">
                        <thead>
                        <tr>
                            <th>文件名</th>
                            <th>大小</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="bookFileList"></tbody>
                    </table>
                </div>
                <button type="button" class="layui-btn" id="btn_bookFileListAction">开始上传</button>
            </div>
            <div class="layui-form-item margin-top-40">
                <div class="layui-col-lg6 layui-col-lg-offset2">
                    <div class="layui-input-block">
                        <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="BookSubmit">提交</button>
                    </div>
                </div>

            </div>

            <%--<input id="imgMsg" type="hidden" value="">
            <select id="bookFileMsg" class="display_none">

            </select>--%>

        </div>
    </div>
</form>

</body>
<script src="${pageContext.request.contextPath}/JS/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/back/layui.js"></script>
<script src="${pageContext.request.contextPath}/back/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/back/JS/addBook.js"></script>
</html>
