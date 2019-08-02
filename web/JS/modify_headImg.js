$(function () {

});

function modify_head_image(e) {
    var formData = new FormData();
    formData.append('file', $(e).get(0).files[0]);

    var patn = /\.jpg$|\.jpeg$|\.png$|\.gif$/i;
    if (!patn.test(e.value)) {
        alert("您选择的不是图像文件.");
        e.value = "";
        return;
    }
    var objUrl = getObjectURL($(e).get(0).files[0]);
    $('#modify_head_image').attr("src",objUrl);
    $.ajax({
        url: '/user/modifyHeadImgById',
        type: 'POST',
        cache: false,
        data: formData,
        processData: false,
        contentType: false
        , success: function (data) {
            if (data.isSuccess == true) {
                alert(data.msg);
            }
        }
        , error: function (data) {

        }
    });
}

function getObjectURL(file) {
    var url = null ;
    // 下面函数执行的效果是一样的，只是需要针对不同的浏览器执行不同的 js 函数而已
    if (window.createObjectURL!=undefined) { // basic
        url = window.createObjectURL(file) ;
    } else if (window.URL!=undefined) { // mozilla(firefox)
        url = window.URL.createObjectURL(file) ;
    } else if (window.webkitURL!=undefined) { // webkit or chrome
        url = window.webkitURL.createObjectURL(file) ;
    }
    return url ;
}