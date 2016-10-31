function changeforum() {
	   var forum = $("#changeforum").val();
		$("#forum").html(forum);
		$(".forum").hide();
		$(".pager").hide();
		$("#"+forum.replace(/\+/g,"plus")).show();
		$("#pager"+forum.replace(/\+/g,"plus")).show();
		if(forum == "Tous") {
			$(".forum").show();
			$(".pager").show();
		}
   }
   
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
	
	$("a#sign-in").click(function() {
		$(".register-form").hide();
		$(".recover-password-form").hide();
		$("#signIn-login").val("");
		$("#signIn-password").val("");
		$(".login-form").animate({
		    height: "toggle",
		    opacity: "show"
		}, 60, "linear",function(){
			$("#signIn-login").focus();
		});
		return false;
	});
	
	$("a#register,.sticky .button").click(function() {
		$(".login-form").hide();
		$(".recover-password-form").hide();
		$(".register-form").animate({
		    height: "toggle",
		    opacity: "show"
		}, 120, "linear",function(){
			$("#register-form input[type=text]").val("");
			$("#register-firstName").focus();
		});
		return false;
	});
	
	$("#register-type").change(function() {
		var type = $(this).val();
		if(type == "entreprise") {
			$("#register-firstName,#span-firstName").hide();
			$("#register-genre,#span-genre").hide();
			$("#register-profil,#span-profil").hide();
		} else {

			$("#register-firstName,#span-firstName").show();
			$("#register-genre,#span-genre").show();
			$("#register-profil,#span-profil").show();
		}
		return false;
	});
	
	$("#register-type").val("individuel");
	
	$("a#recover-password").click(function() {
		$(".login-form").hide();
		$(".register-form").hide();
		$(".recover-password-form").animate({
		    height: "toggle",
		    opacity: "show"
		}, 60, "linear",function(){
			$("#recover-login").focus();
		});
		return false;
	});
	
	
	$("a#contact").click(function(event) {
		$(".contact").animate({
		    height: "toggle",
		    opacity: "show"
		}, 60, "linear",function(){
			$("#contact-name").val("");
			$("#contact-email").val("");
			$("#contact-subject").val("");
			$("#contact-message").val("");
			$("#contact-name").focus();
		});
		return false;
	});
	
	$("body").click(function() {
		$(".login-form,.register-form,.contact,.recover-password-form").hide();
	});
	
	$(".login-form,.register-form,.contact,.recover-password-form").click(function() {
		return false;
	});
	
	
	$('#do-chat').click(function(evt) {
		evt.preventDefault();
		sendMessage();
	});
	
	
	$('table.paginated').each(function() {
	    var currentPage = 0;
	    var $table = $(this);
	    var numPerPage = $table.attr("data-rows")?$table.attr("data-rows") :4;
	    $table.bind('repaginate', function() {
	        $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
	    });
	    $table.trigger('repaginate');
	    var numRows = $table.find('tbody tr').length;
	    if(numRows > numPerPage) {
		    var numPages = Math.ceil(numRows / numPerPage);
		    var $pager = $('<div class="pager"></div>').attr("id","pager"+$table.parent().attr("id"));
		    for (var page = 0; page < numPages; page++) {
		        $('<span class="page-number"></span>').text(page + 1).bind('click', {
		            newPage: page
		        }, function(event) {
		            currentPage = event.data['newPage'];
		            $table.trigger('repaginate');
		            $(this).addClass('active').siblings().removeClass('active');
		        }).appendTo($pager).addClass('clickable');
		    }
		    $pager.insertAfter($table.parent()).find('span.page-number:first').addClass('active');
		 }
	});
	
	if($(".forum-title").size()) {
		$(".forum-title").html($(".forum-title:first").html().replace("Cplusplus","C++"));
	}
	$(".sticky").each(function() {
		bottom = $(this).position().top + $(this).outerHeight(true) + $(this).offset().top;
		bottom = $(document).height() - bottom - $('.home').height() -$(this).height() * 0.25 - 400;
		$(this).sticky({bottomSpacing:bottom,getWidthFrom:'body'});
	});
	
	$("#typed").typed({
        stringsElement: $('#typed-strings'),
        backDelay: 10000,
        typeSpeed: 0,
        loop:true
    });
	
	  $("#changeforum").val("Tous");
	  $('.forum tbody:not(:has(*))').append("<tr><td class='empty' valign='top' colspan='3'>aucun message</td></tr>");

	  $('a[href*=#]:not([href=#])').click(function() {
		    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') 
		        || location.hostname == this.hostname) {

		        var target = $(this.hash);
		        target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
		           if (target.length) {
		             $('html,body').animate({
		                 scrollTop: target.offset().top + 5
		            }, 600);
		            return false;
		        }
		    }
		});
	
});