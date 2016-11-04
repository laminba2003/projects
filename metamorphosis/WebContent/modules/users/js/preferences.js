app.ready(function(){
	$(".template > a").click(function(){
		 $(".templateDetails").hide();
	    $(".templateDetails",$(this).parent()).fadeIn(1000);
		return false;
	});
	$("body").click(function(){
	    $(".templateDetails").fadeOut(1000);
	});
});