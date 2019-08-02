$(function() {



	/* 忘记密码跳转 */
	$("#retake").on('click', function() {
		document.getElementById("action").action = "retake.action";
	});

	/* 账号清空 */
	$('#username').bind('input propertychange', function() {
		if ($('#username').val() != '') {
			$("#user_close").addClass("user_close");
			$("#user_close").text("x");
		} else {
			$("#user_close").removeClass("user_close");
			$("#user_close").text("");
		}

	});

	if ($('#username').val() != '') {
		$("#user_close").addClass("user_close");
		$("#user_close").text("x");
	} else {
		$("#user_close").removeClass("user_close");
		$("#user_close").text("");
	}
	$("#user_close").click(function() {
		$(this).parent().find('input').val('');
		$(this).removeClass("user_close");
		$(this).text('');
	});

});
