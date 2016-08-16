$('document').ready(function(){
	var array = window.location.pathname.split( '/' );
	var path = "";
	for( var i = 2;i<array.length;i++) {
		path += array[i];
		$('a[href$='+array[i]+"]").addClass('active');
	}
	if(path=="") {
		$('a[href$='+array[1]+"]").addClass('active');
	}
	$("#tutorials").hover(function(){
	    $('.dropdown').show();
	},function(){
	    $('.dropdown').hide();
	});
	
	$(".tab_content").hide();
	$(".tab_container .tab_content:first-child").show(); 

	$("ul.tabs li").click(function() {
		var parent = $(this).parent();
		$("li",parent).removeClass("active");
		$(this).addClass("active");
		var activeTab = $(this).attr("rel"); 
		$("#"+activeTab).parent().find(".tab_content").hide();
		$("#"+activeTab).fadeIn(); 
	});
	
	$('.pgwSlider').pgwSlider();
	
});