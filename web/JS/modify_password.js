$(function () {
    $('#modify_password_submit').on('click', function () {

        $.ajax({
            url: '/user/modifyPasswordById'
            , dataType: "text"
            , type: "post"
            , data: {
                user_id:$('#modify_password_username').val()
                ,old_password:$('#old_password').val()
                ,new_password:$('#new_password').val()

            }
            ,success:function (data) {
                var json = jQuery.parseJSON(data);
                if(json.isSuccess == true){
                    $('#old_password').val("");
                    $('#new_password').val("");
                    alert(json.msg);

                }else{
                    $('#old_password').val("");
                    $('#new_password').val("");
                    alert(json.msg);
                }
            }
        })
    })
});