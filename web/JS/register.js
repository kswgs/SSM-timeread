$(function() {
	//checkuser("#username");
	//checkemail("#email");
});

var usernameFlag = false;
var repasswordFlag = false;
var emailFlag = false;

function failvalidate(e, mess) {
	var id = $(e).attr("id");
	/*
	 * $("#" + id + "_error").removeClass("focus"); $("#" + id +
	 * "_error").removeClass("hide"); $("#" + id + "_error").addClass("error");
	 */
	// $("#" + id + "_succeed").removeClass("sucess");
	$("#" + id + "_error").html(mess);
	if(!(usernameFlag && repasswordFlag && emailFlag)){
		$("#register").attr("disabled","disabled");
	}
	
}

/*输入正确则去掉错误文本*/
function success(e) {
	var id = $(e).attr("id");
	$("#" + id + "_error").html("");
	if(usernameFlag && repasswordFlag && emailFlag){
		$("#register").removeAttr("disabled");
	}

}

/*判断username输入*/
function checkuser(e) {
	if (e.value == '') {
		usernameFlag = false;
		failvalidate(e, "用户名不能为空！");
		return;
	}else{
		$.ajax({
			url: "/user/isExistUsername",
			data:{
				username:e.value
			},
			dataType:"text",
			type:"get",
			success:function (data) {
				var json = jQuery.parseJSON(data);
				console.log(json);
				if(json.isSuccess == true){
					usernameFlag=false;
					failvalidate(e,json.msg);
					return;
				}else{
					usernameFlag=true;
					success(e);
				}
			}
		})
	}

}

/*判断password输入*/
function checkpassword(e) {
	if (e.value == '') {
		failvalidate(e, "密码不能为空！");
		return;
	}
		success(e);
}

/*判断热repassword输入，两次密码不一致则提示*/
function checkrepassword(e) {
	var password = $("#password").val();
	if (e.value == '') {
		repasswordFlag =false;
		failvalidate(e, "确认密码不能为空！");
		return;
	}else if(e.value != password){
		repasswordFlag =false;
		failvalidate(e, "密码不一致");
		return;
	}
	repasswordFlag = true;
	success(e);
}

/*判断email输入*/
function checkemail(e) {
	var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
	if (e.value == '') {
		emailFlag =false;
		failvalidate(e, "邮箱不能为空！");
		return;
	}else if(e.value.match(reg)==null) {
		emailFlag =false;
        failvalidate(e, "请填写正确的邮箱");
        return;
    }else{
		$.ajax({
			url: "/user/isExistEmail",
			data:{
				email:e.value
			},
			dataType:"text",
			type:"get",
			success:function (data) {
				var json = jQuery.parseJSON(data);
				if(json.isSuccess == true){
					emailFlag =false;
					failvalidate(e,json.msg);
					return;
				}else{
					emailFlag=true;
					success(e);
				}
			}
		})
	}

}