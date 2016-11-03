app.ready(function(){
	$(".template > a").click(function(){
	    $(".templateDetails",$(this).parent()).fadeIn(1000);
		return false;
	});
	$("body").click(function(){
	    $(".templateDetails").fadeOut(1000);
	});
});