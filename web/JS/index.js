$(function () {

    //修改layer弹出层的top高度，否则会显示在页面外
    layer.config({
        offset: '350px'
    });


    $('#remen').find('li').each(function (e) {
        $(this).on('click', function () {
            $(this).find('a').addClass('btn-info');
            $(this).siblings().find('a').removeClass('btn-info');
        });
    });

    $('#zuixinleixing_changxiao').find('li').each(function (e) {
        $(this).on('click', function () {
            $(this).find('a').addClass('btn-info');
            $(this).siblings().find('a').removeClass('btn-info');
        });
    });

    $('#zuixinleixing_wangluo').find('li').each(function (e) {
        $(this).on('click', function () {
            $(this).find('a').addClass('btn-info');
            $(this).siblings().find('a').removeClass('btn-info');
        });
    });


    $('.fenleiremen_ul>li').each(function (e) {
        if (e % 5 == 0) {
            $(this).find('.fenleirenmen_active').removeClass('display_none');

        } else {
            $(this).find('.fenleirenmen_neirong_div').css(
                {
                    'height': '35px'
                }
            );
        }

    });

    //循环添加点击事件
    $("#zuixinleixing_changxiao").find('li').each(function (i) {
        $('#zuixinleixing_changxiang_biaotou_' + (i + 1)).on('click', function () {
            zuixinleixing_changxiao_show($('#changxiao_leixing_' + (i + 1)), $(this).attr("data-category"));
        });
    });

    $("#zuixinleixing_wangluo").find('li').each(function (i) {
        $('#zuixinleixing_wangluo_biaotou_' + (i + 1)).on('click', function () {
            zuixinleixing_wangluo_show($('#wangluo_leixing_' + (i + 1)), $(this).attr("data-category"));
        });
    });

    //循环给热门表头添加电机事件
    $("#remen").find('li').each(function (i) {
        $('#hot_table_' + (i + 1)).on('click', function () {
            hot_show($('#hot_' + (i + 1)), $(this).attr("data-time"));
        });
    });
    hot_show($('#hot_1'), $('#hot_time_1').attr("data-time"));

    //轮播图
    adImageShow();

    //公告栏
    noticeShow();

    //随机图书
    getBookRandom_suiji();

    //推荐图书
    getBookRecommend();

    //新书
    xinshuShow();

    //
    fenleiremen($('#remenfenlei_changxiao'),$('#remenfenlei_changxiao').attr('data-categoryParent'));
    fenleiremen($('#remenfenlei_wangluo'),$('#remenfenlei_wangluo').attr('data-categoryParent'));
    fenleiremen($('#remenfenlei_wangluonvpin'),$('#remenfenlei_wangluonvpin').attr('data-categoryParent'));
    fenleiremen($('#remenfenlei_xuexi'),$('#remenfenlei_xuexi').attr('data-categoryParent'));


    zuixinleixing_changxiao_show($('#changxiao_leixing_1'), $('#zuixinleixing_changxiang_biaotou_1').attr("data-category"));
    zuixinleixing_wangluo_show($('#wangluo_leixing_1'), $('#zuixinleixing_wangluo_biaotou_1').attr("data-category"));


    //登录后判断今日是否签到
    signDay();

    //给签到按钮绑定签到事件
    $('#btn_sign').on('click', function () {
        $.ajax({
            url: '/sign/signDay'
            , dataType: "text"
            , type: "post"
            , success: function (data) {
                var json = jQuery.parseJSON(data);
                //console.log("点击签到按钮json信息返回：");
                //console.log(json);
                if (json.isSuccess == true) {
                    $('#btn_sign').addClass("disabled").text("已签到");
                    var point = $('#userPoint').attr('data-point');
                    $('#userPoint').text(json.data);
                    layer.msg("签到成功", {
                        icon: 1,
                    });
                    //window.location.reload();
                }else{
                    console.log("json=="+json);
                }

            }
        })
    });


});


function fenleirenmen_display(e) {
    $(e).find('.fenleirenmen_active').removeClass('display_none');
    $(e).siblings().find('.fenleirenmen_active').addClass('display_none');

    $(e).find('.fenleirenmen_neirong_div').css(
        {
            'height': '180px'
        }
    );
    $(e).siblings().find('.fenleirenmen_neirong_div').css(
        {
            'height': '35px'
        }
    );
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


function xinshuShow() {
    $.ajax({
        url: '/book/getNewBook'
        , dataType: "text"
        , type: "post"
        , data: {
            count: 9
            , category: '0'
            , categoryParent: '0'

        }
        , success: function (data) {
            var json = jQuery.parseJSON(data);
            if (json.isSuccess == true) {
                //console.log(json.msg);
                //console.log(data);
                //console.log(json.data.length);

                for (var i = 0; i < json.data.length; i++) {
                    $('#xinshu_img_a_' + (i + 1)).attr('href', "/book/getBookByIdDetailed?book_id=" + json.data[i].book_id);
                    $('#xinshu_img_' + (i + 1)).attr('src', json.data[i].image);
                    $('#xinshu_time_' + (i + 1)).text(new Date(json.data[i].upload_time).Format('yy-MM-dd'));
                    $('#xinshu_name_' + (i + 1)).html("《" + json.data[i].name + "》--&nbsp;" + json.data[i].author);
                    $('#xinshu_name_' + (i + 1)).attr('href', "/book/getBookByIdDetailed?book_id=" + json.data[i].book_id);
                }
            }
        }
    })

}

function zuixinleixing_changxiao_show(id, category) {

    var id = $(id).attr('id');
    $.ajax({
        url: '/book/getNewBook'
        , dataType: "text"
        , type: "post"
        , data: {
            count: 3
            , category: category
            , categoryParent: '0'

        }
        , success: function (data) {
            var json = jQuery.parseJSON(data);
            // console.log(json);
            if (json.isSuccess == true) {
                // alert(json.data);
                for (var i = 0; i < json.data.length; i++) {
                    $('#xinshuleixing_changxiao_img_a_' + id + "_" + (i + 1)).attr('href', "/book/getBookByIdDetailed?book_id=" + json.data[i].book_id);
                    $('#xinshuleixing_changxiao_img_' + id + "_" + (i + 1)).attr('src', json.data[i].image);
                    $('#xinshuleixing_changxiao_name_a_' + id + "_" + (i + 1)).attr('href', "/book/getBookByIdDetailed?book_id=" + json.data[i].book_id).html("《" + json.data[i].name + "》--&nbsp&nbsp;" + json.data[i].author);
                    $('#xinshuleixing_changxiao_introduction_' + id + "_" + (i + 1)).text(json.data[i].introduction);
                    $('#xinshuleixing_changxiao_time_' + id + "_" + (i + 1)).text(new Date(json.data[i].upload_time).Format('yy-MM-dd'));
                }
            }
        }
    })
}


function zuixinleixing_wangluo_show(id, category) {

    var id = $(id).attr('id');
    $.ajax({
        url: '/book/getNewBook'
        , dataType: "text"
        , type: "post"
        , data: {
            count: 3
            , category: category
            , categoryParent: '0'

        }
        , success: function (data) {
            var json = jQuery.parseJSON(data);
            //console.log(json);
            if (json.isSuccess == true) {
                // alert(json.data);
                for (var i = 0; i < json.data.length; i++) {
                    $('#xinshuleixing_wangluo_img_a_' + id + "_" + (i + 1)).attr('href', "/book/getBookByIdDetailed?book_id=" + json.data[i].book_id);
                    $('#xinshuleixing_wangluo_img_' + id + "_" + (i + 1)).attr('src', json.data[i].image);
                    $('#xinshuleixing_wangluo_name_a_' + id + "_" + (i + 1)).attr('href', "/book/getBookByIdDetailed?book_id=" + json.data[i].book_id).html("《" + json.data[i].name + "》--&nbsp;&nbsp;" + json.data[i].author);
                    $('#xinshuleixing_wangluo_introduction_' + id + "_" + (i + 1)).text(json.data[i].introduction);
                    $('#xinshuleixing_wangluo_time_' + id + "_" + (i + 1)).text(new Date(json.data[i].upload_time).Format('yy-MM-dd'));
                }
            }
        }
    })
}


function signDay() {
    var user_id = $('#userId').val();
    if (user_id == null || user_id == 'undefined' || user_id == '') {
        return;
    } else {
        $.ajax({
            url: '/sign/isExistSignByDay'
            , dataType: "text"
            , type: "post"
            , success: function (data) {
                var json = jQuery.parseJSON(data);
                //console.log("登录后签到json信息返回：");
                //console.log(json);
                if (json.isSuccess == true) {
                    $('#btn_sign').addClass("disabled").text("已签到");
                } else {
                    $('#btn_sign').removeClass("disabled").text("立即签到");
                }
            }
        })
    }

}


function adImageShow() {

    $.ajax({
        url: '/adImage/adImageShow'
        , dataType: "text"
        , type: "post"
        , success: function (data) {
            var json = jQuery.parseJSON(data);
            //console.log("获取轮播图json信息返回：");
            //console.log(json);
            if (json.isSuccess == true) {
                $('#lunbo_img').find('img').each(function (i) {
                    $(this).attr("src", json.data[i].image_path);
                })
            }

        }
        , error: function (data) {
            console.log("轮播信息获取失败");
        }
    })
}

function noticeShow() {
    $.ajax({
        url: '/notice/getNoticeByNewTime'
        , dataType: "text"
        , type: "post"
        , data: {
            count: 5
        }
        , success: function (data) {
            var json = jQuery.parseJSON(data);
            //console.log("获取公告栏json信息返回：");
            //console.log(json.data);
            if (json.isSuccess == true) {
                if (json.data.length > 0) {
                    for (var i = 0; i < json.data.length; i++) {
                        $("#gonggao-liebiao").append(
                            '<div class="col-lg-8 pull-left text-center gonggao-div">'
                            + '<a href="#">'
                            + json.data[i].title
                            + '</a>'
                            + '</div>'
                            + '<div class="col-lg-4 gonggao-div">'
                            + '<P>'
                            + new Date(json.data[i].notice_time).Format('yy-MM-dd')
                            + '</P>'
                            + '</div>'
                        )
                    }
                }

            }

        }
        , error: function (data) {
            var json = jQuery.parseJSON(data);
            console.log(json.msg);
        }
    })

}

//随机图书列表
function getBookRandom_suiji() {
    $.ajax({
        url: '/book/getBookByRandom'
        , dataType: "text"
        , type: "post"
        , data: {
            count: 10
        }
        , success: function (data) {
            var json = jQuery.parseJSON(data);
            //console.log("获取随机图书json信息返回：");
            //console.log(json.data);
            if (json.isSuccess == true) {
                if (json.data.length > 0) {
                    for (var i = 0; i < json.data.length; i++) {
                        var color;
                        if (json.data[i].category_parent == '畅销图书') {
                            color = 'label-success';
                        } else if (json.data[i].category_parent == '网络小说') {
                            color = 'label-info';
                        } else if (json.data[i].category_parent == '网络小说（女频）') {
                            color = 'label-warning';
                        } else {
                            color = 'label-danger';
                        }


                        $("#suijituijian_list").append(
                            '<div class="suijituijian_list_neirong">'
                            + '<div class="row">'
                            + '<div class="col-lg-3">'
                            + '<img src="'
                            + json.data[i].image
                            + '">'
                            + '</div>'
                            + '<div class="col-lg-9">'
                            + '<p class="suijituijian_p"><a target="_blank" href="/book/getBookByIdDetailed?book_id='
                            + json.data[i].book_id
                            + '">《'
                            + json.data[i].name
                            + '》&nbsp;&nbsp;--&nbsp;&nbsp;'
                            + json.data[i].author
                            + '</a>'
                            + '</p>'
                            + '<span class="label '
                            + color
                            + '">'
                            + json.data[i].category_parent
                            + '</span>'
                            + '<span class="pull-right suijituijian_time">'
                            + new Date(json.data[i].upload_time).Format('yy-MM-dd')
                            + '</span>'
                            + '</div>'
                            + ' </div>'
                            + ' </div>'
                        )
                    }
                }

            }

        }
        , error: function (data) {
            var json = jQuery.parseJSON(data);
            console.log(json.msg);
        }
    })
}


//推荐图书列表
//目前为随机
function getBookRecommend() {
    $.ajax({
        url: '/book/getBookByRandom'
        , dataType: "text"
        , type: "post"
        , data: {
            count: 9
        }
        , success: function (data) {
            var json = jQuery.parseJSON(data);
            //console.log("获取推荐图书json信息返回：");
            //console.log(json.data);
            if (json.isSuccess == true) {
                if (json.data.length > 0) {
                    for (var i = 0; i < json.data.length; i++) {
                        var color;
                        if (json.data[i].category_parent == '畅销图书') {
                            color = 'label-success';
                        } else if (json.data[i].category_parent == '网络小说') {
                            color = 'label-info';
                        } else if (json.data[i].category_parent == '网络小说（女频）') {
                            color = 'label-warning';
                        } else {
                            color = 'label-danger';
                        }


                        $("#tuijian-liebiao").append(
                            '<div class="col-xs-4 tuijian-div">'
                            + '<span class="label '
                            + color
                            + '">'
                            + json.data[i].category_parent
                            + '</span>&nbsp;&nbsp;&nbsp;'
                            + '</div>'
                            + '<div class="col-xs-8 pull-left tuijian-div"><a '
                            + 'target="_blank" href="/book/getBookByIdDetailed?book_id='
                            + json.data[i].book_id
                            + '">《'
                            + json.data[i].name
                            + '》&nbsp;&nbsp;--&nbsp;&nbsp;'
                            + json.data[i].author
                            + '</a>'
                            + '</div>'
                        )
                    }
                }

            }

        }
        , error: function (data) {
            var json = jQuery.parseJSON(data);
            console.log(json.msg);
        }
    })
}


function hot_show(id, time) {

    //var id = $(id).attr('id');
    $.ajax({
        url: '/book/getBookByRandom'
        , dataType: "text"
        , type: "post"
        , data: {
            count: 10
        }
        , success: function (data) {
            var json = jQuery.parseJSON(data);
            //console.log("获取推荐图书json信息返回：");
            //console.log(json.data);
            if (json.isSuccess == true) {
                if (json.data.length > 0) {
                    for (var i = 0; i < json.data.length; i++) {
                        var color;
                        if (json.data[i].category_parent == '畅销图书') {
                            color = 'label-success';
                        } else if (json.data[i].category_parent == '网络小说') {
                            color = 'label-info';
                        } else if (json.data[i].category_parent == '网络小说（女频）') {
                            color = 'label-warning';
                        } else {
                            color = 'label-danger';
                        }


                        id.append(
                            '<div class="col-lg-4 remen-div">'
                            + '<span class="label '
                            + color
                            + '">'
                            + json.data[i].category_parent
                            + '</span>&nbsp;&nbsp;&nbsp;'
                            + '</div>'
                            + '<div class="col-lg-8 pull-left remen-div">'
                            + '<a target="_blank" href="/book/getBookByIdDetailed?book_id='
                            + json.data[i].book_id
                            + '">《'
                            + json.data[i].name
                            + '》&nbsp;&nbsp;--&nbsp;&nbsp;'
                            + json.data[i].author
                            + '</a>'
                            + '</div>'
                        )
                    }
                }

            }

        }
        , error: function (data) {
            var json = jQuery.parseJSON(data);
            console.log(json.msg);
        }
    })
}


function fenleiremen(id,categoryParent) {
    var id = $(id).attr('id');
    $.ajax({
        url: '/book/getNewBook'
        , dataType: "text"
        , type: "post"
        , data: {
            count: 5
            , category: 0
            , categoryParent: categoryParent

        }
        , success: function (data) {
            var json = jQuery.parseJSON(data);
            //console.log("获取热门图书json信息返回：");
            //console.log(json.msg);
            //console.log(json.data);
            if (json.isSuccess == true) {
                if (json.data.length > 0) {
                    for(var i =0;i < json.data.length;i++){
                        $('#'+id+'_name_'+(i+1)).attr('href',"/book/getBookByIdDetailed?book_id=" + json.data[i].book_id).html("《" + json.data[i].name + "》--&nbsp;&nbsp;" + json.data[i].author);
                        $('#'+id+'_img_a_'+(i+1)).attr('href',"/book/getBookByIdDetailed?book_id=" + json.data[i].book_id);
                        $('#'+id+'_img_'+(i+1)).attr('src',json.data[i].image);
                        $('#'+id+'_p_a_'+(i+1)).attr('href',"/book/getBookByIdDetailed?book_id=" + json.data[i].book_id);
                        $('#'+id+'_p_'+(i+1)).html(json.data[i].introduction);
                    }

                }

            }

        }
        , error: function (data) {
            var json = jQuery.parseJSON(data);
            console.log(json.msg);
        }
    })
}
