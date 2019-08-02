$(function () {
    $('#user_info_left_menu li').click(function () {
        $(this).siblings('li').removeClass('user_info_left_menu_active');
        $(this).addClass('user_info_left_menu_active');
    });

});