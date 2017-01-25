 
 /**  
  * WpF BGness 
  * Template Scripts
  * Created by WpFreeware Team
  *Author Uri : http://www.wpfreeware.com/

  Custom JS
  
  1. Dropdown Menu
  5. ScrollTop
  7. Preloader   
  
**/

 jQuery(function($){

  /* ----------------------------------------------------------- */
  /*  1. Dropdown Menu
  /* ----------------------------------------------------------- */

   // for hover dropdown menu
  $('ul.nav li.dropdown').hover(function() {
      $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(200);
    }, function() {
      $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(200);
  });


//login form

$("#logIn").click(function(event){
	$(".loginForm").css({top : 50, left:event.pageX-200}).show();
	$(".loginForm").removeClass("rollOut").addClass("animated rollIn");
	$(".loginForm input[type=email]").focus();
	return false;
});

$(".loginForm").click(function(event){
	if(event.target != $("button",this)[0]) return false;
});

$("body").click(function(event){
	$(".loginForm").addClass("animated rollOut");
});


});

/* ----------------------------------------------------------- */
/*  5. ScrollTop
/* ----------------------------------------------------------- */

//Check to see if the window is top if not then display button

$(window).scroll(function(){
  if ($(this).scrollTop() > 300) {
    $('.scrollToTop').fadeIn();
  } else {
    $('.scrollToTop').fadeOut();
  }
});
 
//Click event to scroll to top

$('.scrollToTop').click(function(){
  $('html, body').animate({scrollTop : 0},800);
  return false;
});


/* ----------------------------------------------------------- */
/*  7. Preloader
/* ----------------------------------------------------------- */

//<![CDATA[
  jQuery(window).ready(function() { // makes sure the whole site is loaded
    $('body').delay(100).css({'overflow':'visible'});
    $("nav li").delay(500).addClass("animated rollIn");
    $(".navbar-brand").delay(500).addClass("animated rollIn");
  })
//]]>


