$(function () {

    //修改layer弹出层的top高度，否则会显示在页面外
    layer.config({
        offset:'350px'
    });


    $('[data-toggle="popover"]').popover();
    var bookName = $('#bookName').text();//获取图书名
    $('#bookTitle').text(bookName);//设置页面名字

    var user_id = $('#userId').val();
    var shopping_id = $('#shoppingId').val();

    if (isNull(user_id) || isNull(shopping_id)) {
        $('.btn_jinggao').removeAttr('href');
    }

    var bookAuthor = $('#bookAuthor').text();

    if (isNull(user_id)) {
        $('.btn_jinggao').click(function () {
            $(this).attr({
                'data-content': '您必须先登录后购买才能下载'
            }).popover('show');
        });
    } else if (!isNull(user_id) && isNull(shopping_id)) {
        $('.btn_jinggao').click(function () {
            $(this).attr({
                'data-content': '您必须购买后才能下载'
            }).popover('show');
        });
    } else {
        $('.btn_jinggao').click(function () {
            //获取图书后缀
            var format = $(this).parent("td").parent("tr").find("td").eq(1).text();
            //下载的文件名设为：图书名-作者.后缀名
            var downloanName = bookName + " - " + bookAuthor + '.' + format;
            //给设置下载按钮设置download属性名
            //注意：download属性名目前只有火狐和谷歌浏览器支持
            $(this).parent("td").parent("tr").find("td").find('a').attr('download', downloanName);
        });

    }


    var bookPoint = $('#bookPoint').attr('data-point');
    var userPoint = $('#userPoint').attr('data-point');
    $('#shengyu').text(parseInt(userPoint) - parseInt(bookPoint));

    $('#shoppingSubmit').click(function () {
        /*layer.msg("正在加载，请稍等",{
            icon: 1,
        });*/
        $.ajax({
            url: "/book/shoppingBook"
            , dataType: "text"
            , type: "post"
            , data: {
                book_id: $('#bookId').val()
                , user_id: $('#userId').val()
                , book_point: bookPoint
            }
            , success: function (data) {
                var json = jQuery.parseJSON(data);
                if (json.isSuccess == true) {
                    layer.msg(json.msg,{
                        icon: 1,
                    });
                    setTimeout( function(){
                        window.location.reload();
                    }, 500 );


                }else{
                    layer.msg(json.msg,{
                        icon: 2,
                    });
                }


            }, error: function (data) {
            }
        });
    });

    $('#comment_submit').on('click', function () {

        $.ajax({
            url: "/comment/addComment"
            , dataType: "text"
            , type: "post"
            , data: {
                content: $('#comment_content').val()
                , book_id: $('#bookId').val()

            }
            , success: function (data) {
                var json = jQuery.parseJSON(data);
                if (json.isSuccess == true) {
                    layer.msg(json.msg,{
                        icon: 1,
                    });
                    $('#comment_content').val("");
                    $("#pinglun_list").find("li").remove();
                    getComment();
                } else {
                    layer.msg(json.msg);
                }


            }, error: function (data) {
                layer.msg("评论失败，请重新尝试");
            }
        });
    });


    //获取评论
    getComment();




});


function getComment() {
    $.ajax({
        url: "/comment/getCommentByBookId"
        , dataType: "text"
        , type: "post"
        , data: {
            book_id: $('#bookId').val()

        }
        , success: function (data) {
            var json = jQuery.parseJSON(data);
            if (json.isSuccess == true) {
                console.log(json.data);
                //layer.msg(json.msg);

                if (json.data.length > 0) {
                    for (var i = 0; i < json.data.length; i++) {
                        $("#pinglun_list").append(
                            '<li class="">'
                            + '<div class="col-lg-10 col-lg-offset-1 tushuxinxi_pinglun_div margin-top-10">'
                            + '<div class="tushuxinxi_pinglun_user">'
                            + '<img src="'
                            + json.data[i].userDetailed.image_path
                            + '">'
                            + '<p class="text-center">'
                            + json.data[i].user_id
                            + '</p>'
                            + '<span class="tushuxinxi_pinglun_time pull-right">'
                            + new Date(json.data[i].comment_time).Format('yy-MM-dd hh:mm:ss')
                            + '</span>'
                            + '</div>'
                            + '<div class="tushu_xian2"></div>'
                            + '<p class="margin-top-10">'
                            + json.data[i].content
                            + '</p>'
                            + '</div>'
                            + '</li>'
                        );
                    }
                } else {
                    $("#pinglun_list").append(
                        '<li>'
                        + '<div class="col-lg-10 col-lg-offset-1 tushuxinxi_pinglun_div margin-top-10">'
                        + '<p class="margin-top-10 text-center">'
                        + '本书还未有评论'
                        + ' </p>'
                        + '</div>'
                        + '</li>'
                    )

                }


            } else {
                //layer.msg(json.msg);
            }


        }, error: function (data) {
            layer.msg("获取评论失败，请重新刷新页面加载评论");
        }
    });
}

Date.prototype.Format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, // 月份
        "d+": this.getDate(), // 日
        "h+": this.getHours(), // 小时
        "m+": this.getMinutes(), // 分
        "s+": this.getSeconds(), // 秒
        "q+": Math.floor((this.getMonth() + 3) / 3), // 季度
        "S": this.getMilliseconds() // 毫秒
    };
    if (/(y+)/.test(fmt))
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + ""));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
};

function isNull(obj) {
    if (obj == null || obj == 'undefined' || obj == '') {
        return true;
    } else {
        return false;
    }
}
