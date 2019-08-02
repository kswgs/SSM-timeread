$(function() {
	/*$("#header-ul").find('li').each(function (e) {
		if(e>0){
			$(this).on('mouseover',function () {
				$(this).addClass("open");
			}).on('mouseout',function () {
				$(this).removeClass("open");
			}).off('click').on('click',function () {
				alert(333);
			});
		}
	});*/


	$(".header").mouseover(function() {
		$(this).addClass("open");
		//$(this).find("ul").fadeIn("slow");
	}).mouseleave(function() {
		$(this).removeClass("open");
		//$(this).find("ul").fadeOut("slow");
	})
});