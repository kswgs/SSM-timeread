var imgMsg;
var bookFileMsg = [];
var category = [];
$(function () {

    //获取具体的图书类别到全局变量下
    $.ajax({
        url: "/book/category",
        dataType: "text",
        type: "get",
        success: function (data) {
            category = jQuery.parseJSON(data);
            // console.log(category);
        }

    });


    layui.use(['form', 'upload', 'layer'], function () {
        var form = layui.form //获取form模块
            , upload = layui.upload //获取upload模块
            , layer = layui.layer; //获取layer模块

        //添加分类到图书分类的下拉框
        $.ajax({
            url: "/book/categoryParent",
            dataType: "text",
            type: "get",
            success: function (data) {
                var json = jQuery.parseJSON(data);
                //console.log(json);
                for (var i = 0; i < json.data.length; i++) {
                    //console.log(i + "=" + json.data[i].category_id);
                    //console.log(i + "=" + json.data[i].name);
                    $("#bookCategoryParent").append(
                        "<option value='" + json.data[i].category_id + "'>" + json.data[i].name + "</option>"
                    );
                    form.render();
                }
            }
        });


        //创建一个上传图片的组件
        upload.render({
            elem: '#btn_bookImg'
            , url: '/book/uploadBookImg'
            , auto: false //是否自动上传
            , accept: 'images' //指定允许上传的文件类型
            , acceptMime: 'image/*'//规定打开文件选择框时，筛选出的文件类型，（只显示 jpg 和 png 文件）
            , exts: 'jpg|png'	//允许上传的文件后缀
            , multiple: false //多文件上传
            , size: 1024000//上传的单个图片大小
            , number: 1
            , bindAction: '#btn_bookImgAction'
            , choose: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#bookImgShow').html('<img src="' + result
                        + '" alt="' + file.name
                        + '"height="250px" width="180px" class="layui-upload-img">')
                });
            }
            , done: function (res, index, upload) {
                //上传完毕回调
                if (res.code == 0) {
                    imgMsg = res.data;
                    //$('#imgMsg').attr("value",res.data);
                    //console.log(JSON.stringify(imgMsg));
                    $('#imgSuccess').removeClass("display_none");
                    $('#imgSuccess').html("图片上传成功")
                    layer.msg("图片上传成功");
                }

            }
            , error: function (res, index, upload) {
                //请求异常回调
                layer.msg('图片上传失败');
            }

        });

        //创建一个上传文件的组件
        var bookFileListView = $('#bookFileList')
            , uploadListIns = upload.render({
            elem: '#btn_bookFile'
            , url: '/book/uploadBookFile'
            , method: 'post'
            , auto: false //是否自动上传
            , accept: 'file' //指定允许上传的文件类型
            , acceptMime: 'file/*'//规定打开文件选择框时，筛选出的文件类型，（只显示 epub 、mobi和azw3 文件）
            , exts: 'epub|mobi|azw3'	//允许上传的文件后缀
            , multiple: true //支持多文件上传
            , size: 2048000//上传的单个文件大小
            , number: 3
            , bindAction: '#btn_bookFileListAction'
            , choose: function (obj) {
                var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                //读取本地文件
                obj.preview(function (index, file, result) {

                    var tr = $(['<tr id="upload-' + index + '">'
                        , '<td>' + file.name + '</td>'
                        , '<td>' + (file.size / 1014).toFixed(1) + 'kb</td>'
                        , '<td>等待上传</td>'
                        , '<td>'
                        , '<button class="layui-btn layui-btn-xs layui-hide file-reload ">重传</button>'
                        , '<button class="layui-btn layui-btn-xs layui-btn-danger file-delete">删除</button>'
                        , '</td>'
                        , '</tr>'].join(''));
                    //单个重传
                    tr.find('.file-reload').on('click', function () {
                        obj.upload(index, file);
                    });

                    //删除
                    tr.find('.file-delete').on('click', function () {
                        delete files[index]; //删除对应的文件
                        tr.remove();
                        uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                    });
                    bookFileListView.append(tr);
                });
            }
            , done: function (res, index, upload) {
                //上传完毕回调
                if (res.code == 0) { //上传成功
                    var id = '#upload-' + index;
                    var tr = bookFileListView.find(id)
                        , tds = tr.children();
                    tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                    tds.eq(3).html(''); //清空操作
                    console.log("index:" + index);
                    /*$("#bookFileMsg").append(
                        "<option value='" + res.data+ "'></option>"
                    );*/
                    bookFileMsg.push(res.data);
                    layer.msg('文件上传成功');
                    return delete this.files[index]; //删除文件队列已经上传成功的文件
                }
                this.error(index, upload);


            }
            , error: function (index, upload) {
                //请求异常回调
                var id = '#upload-' + index;
                var tr = bookFileListView.find(id)
                    , tds = tr.children();
                tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
                tds.eq(3).find('.file-reload').removeClass('layui-hide'); //显示重传
                layer.msg('文件上传失败');
            }

        });

        form.on('select(categoryParent)', function (data) {
            var categoryParent = $("#bookCategoryParent").find("option:selected").text();
            $("#bookCategory").empty();
            if (categoryParent == "请选择一个分类") {
                return;
            }
            $("#bookCategory").append("<option value=''>请选择一个分类</option>");
            for (var i = 0; i < category.data.length; i++) {
                var flag = category.data[i].parent_id.indexOf(data.value);
                if (flag == 0) {
                    //alert(category.data[i]);
                    $("#bookCategory").append("<option value='" + category.data[i].category_id + "'>" + category.data[i].name + "</option>");
                }
                form.render();
            }
        })

        //监听提交
        form.on('submit(BookSubmit)', function (data) {
            //layer.msg(JSON.stringify(data.field));
            console.log("imgMsg=" + JSON.stringify(imgMsg));
            console.log("bookFileMsg=" + JSON.stringify(bookFileMsg));
            console.log(JSON.stringify(data.field));
            console.log(JSON.stringify(data.field.bookname));
            //var imgMsg = $('#imgMsg').val();
            //var fileMsg = $('#bookFileMsg').find('option:selected').val();
            //var bookFileMsg = [];
            //bookFileMsg.push(fileMsg);

            console.log("1111==" + JSON.stringify(imgMsg));
            console.log("222===" + JSON.stringify(bookFileMsg));

            $.ajax({
                url: "/book/addBook"
                , type: "get"
                , dataType: "text"
                , data: {
                    imgMsg: JSON.stringify(imgMsg)
                    , bookFileMsg: JSON.stringify(bookFileMsg)
                    , bookname: data.field.bookname
                    , author: data.field.author
                    , bookpoint: data.field.bookpoint
                    , introduction: data.field.introduction
                    , bookCategoryParent: data.field.bookCategoryParent
                    , bookCategory: data.field.bookCategory
                }
                , success: function (data) {
                    var json = jQuery.parseJSON(data);
                    if (json.isSuccess == true) {
                        layer.msg("图书上传成功");
                        $('#imgSuccess').addClass("display_none");
                        //$('#imgMsg').val("");
                        $('#bookFileMsg').empty();
                        $('#addBookForm')[0].reset();
                        $('#bookImgShow').empty();
                        $('#bookFileList').empty();
                        bookFileMsg.splice(0, bookFileMsg.length);
                        console.log("清空后的bookFileMsg==="+bookFileMsg);
                        layui.form.render();
                    } else {
                        layer.msg(json.msg);
                    }

                }
                , error: function (data) {
                    layer.msg("图书上传失败");
                }
            });
            return false;
        });

    });
});

/*输入错误则提示错误文本*/
function failvalidate(e, mess) {
    var id = $(e).attr("id");
    $("#" + id + "_error").html(mess);
}

/*输入正确则去掉错误文本*/
function success(e) {
    var id = $(e).attr("id");
    $("#" + id + "_error").html("");
}

function checkbookname(e) {
    console.log(e.value);
    if (e.value == '') {
        failvalidate(e, "图书名不能为空！");
        return;
    } else {
        $.ajax({
            url: "/book/isExistBookName",
            data: {
                bookname: e.value
            },
            dataType: "text",
            type: "get",
            success: function (data) {
                var json = jQuery.parseJSON(data);
                if (json.isSuccess == true) {
                    failvalidate(e, json.msg);
                    return;
                } else {
                    success(e);
                }
            }
        })
    }
}

function checkauthor(e) {
    if (e.value == '') {
        failvalidate(e, "作者名不能为空！");
        return;
    } else {
        success(e);
    }
}

function checkpoint(e) {
    if (e.value == '') {
        failvalidate(e, "所需积分不能为空！");
        return;
    } else {
        success(e);
    }
}

function checkintroduction(e) {
    if (e.value == '') {
        failvalidate(e, "图书简介不能为空！");
        return;
    } else {
        success(e);
    }
}
