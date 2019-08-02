$(function () {
    $("#user_info_detailed_date").datetimepicker({
        format: "yyyy-mm-dd",
        autoclose: false,
        todayBtn: "linked",
        language: 'zh-CN',
        pickerPosition: 'top-right',
        minView: "month",
        endDate: new Date()
    });
    var registration_time = $('#user_info_detailed_registration_time').attr("data-time");
    $('#user_info_detailed_registration_time').text(new Date(registration_time).Format('yy-MM-dd'));
    var birthday = $('#user_info_detailed_birthday').attr("data-time");
    $('#user_info_detailed_birthday').val(new Date(birthday).Format('yy-MM-dd'));

    $('#user_info_detailed_submit').on('click', function () {
        //console.log("birthday"+$("#user_info_detailed_date").data("datetimepicker").getDate());
        //console.log("gender"+$('#user_info_detailed_gender option:selected').val());
        var date = $("#user_info_detailed_date").data("datetimepicker").getDate();
        var birthday = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + " " + date.getHours + ":" + date.getMinutes() + ":" + date.getSeconds();
        //console.log("birthday"+birthday);
        $.ajax({
            url: '/user/modifyUserInfo'
            , dataType: "text"
            , type: "post"
            , data: {
                user_id:$('#user_info_detailed_username').attr("data-user")
                ,birthday:birthday
                ,gender:$('#user_info_detailed_gender option:selected').val()

            }
            ,success:function (data) {
                var json = jQuery.parseJSON(data);
                if(json.isSuccess == true){
                    alert("修改成功");
                }
            }
        })
    })

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

