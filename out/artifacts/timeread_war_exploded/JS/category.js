$(function () {
    signDay();
    getBookRandom_suiji();


    //修改layer弹出层的top高度，否则会显示在页面外
    layer.config({
        offset: '350px'
    });
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
            console.log("获取随机图书json信息返回：");
            console.log(json.data);
            if (json.isSuccess == true) {
                if (json.data.length > 0) {
                    for (var i = 0; i < json.data.length; i++) {
                        var color;
                        if(json.data[i].category_parent=='畅销图书'){
                            color='label-success';
                        }else if(json.data[i].category_parent=='网络小说'){
                            color='label-info';
                        }else if(json.data[i].category_parent=='网络小说(女频)'){
                            color='label-waring';
                        }else{
                            color='label-danger';
                        }


                        $("#suijituijian_list").append(
                            '<div class="suijituijian_list_neirong">'
                            + '<div class="row">'
                            + '<div class="col-lg-4">'
                            + '<img src="'
                            + json.data[i].image
                            + '">'
                            + '</div>'
                            + '<div class="col-lg-8">'
                            + '<p class="suijituijian_p"><a href="/book/getBookByIdDetailed?book_id='
                            + json.data[i].book_id
                            + '">《'
                            + json.data[i].name
                            + '》&nbsp;&nbsp;--&nbsp;&nbsp;'
                            + json.data[i].author
                            + '</a>'
                            + '</p>'
                            + '<span class="label '
                            +   color
                            +'">'
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