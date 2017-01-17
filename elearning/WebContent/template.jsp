<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
   <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
   <meta name="author" content="thinktech.sn"/>
   <meta name="category" content="internet" />
   <meta name="robots" content="All" />
   <meta name="description" content="" />
   <meta name="keywords" content="" />
   <base href="${path}/"/>
   <title>Think Dev</title>
   <link rel="icon" href="images/brain.png">
   <link href="css/app.css" rel="stylesheet" />
   <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet"/>
   <script type="text/javascript" src="js/jquery.js"></script>
   <script type="text/javascript" src="js/app.js"></script>
</head>
<body>
<a name="top"></a>
<p class="wait">
<img src="images/wait.gif"/>
</p>
	<div  class="clearfix">
	
		<header>
			<tiles:insertAttribute name="header" />
		</header>
		
		<main role="main" class="clearfix">
		
		<aside> 
		 <section>
		 	<tiles:insertAttribute name="menu" />
		 </section>
		 </aside>
	  	 <section class="content">	
	  	 		<tiles:insertAttribute name="content" />
    	</section>	
 
		 <section class="right">	
	  	 		<ul>
	  	 			<li><a href="forums">Forums</a></li>
	  	 			<s:if test="%{#session['user']!=null}">
	  	 				<li><a href="chat">Chat</a></li>
	  	 		   </s:if>
	  	 			<li>
	  	 				<a id="contact" href="#">Contact</a>
	  	 			</li>
	  	 		</ul>
	  	 		
	  	 	
    	</section>	
    	
	  	 <div class="news blue">
			<span>News</span>
			<ul>
				<li><a href="#">Version 1.0 disponible</a></li>
				<li><a href="#">Nouveaux cours disponibles</a></li>
			</ul>
		</div>

    	
    	<div class="contact">
							 <h2 class="title">Contactez-Nous</h2>	
							<div class="wrapper">
							    <form id="contact-form" action="contact" class="ccform">
							    <div class="ccfield-prepend">
							        <span class="ccform-addon"><i class="fa fa-user fa-2x"></i></span>
							        <input type="text" id="contact-name" class="ccformfield" placeholder="votre nom complet"/>
							    </div>
							    <div class="ccfield-prepend">
							        <span class="ccform-addon"><i class="fa fa-envelope fa-2x"></i></span>
							        <input type="text" id="contact-email"  class="ccformfield" placeholder="votre email"/>
							    </div>
							   
							     <div class="ccfield-prepend">
							        <span class="ccform-addon"><i class="fa fa-info fa-2x"></i></span>
							        <input type="text" id="contact-subject"  class="ccformfield" type="text" placeholder="votre sujet"/>
							    </div>
							    <div class="ccfield-prepend">
							        <span class="ccform-addon"><i class="fa fa-comment fa-2x"></i></span>
							        <textarea id="contact-message"  class="ccformfield"  rows="8" placeholder="votre message"></textarea>
							    </div>
							    <div class="ccfield-prepend">
							        <input type="submit" onclick="return sendContactMail();" class="ccbtn" value="Envoyer"/>
							    </div>
							    </form>
							</div>
	  	 				
	  	 				</div>
    	
    	</main>
		
		<footer>
			<p><a href="#top"><i class="fa fa-chevron-up backTop" aria-hidden="true"></i></a></p>
			<p>© 2017 thinktech.sn All rights reserved.</p>
		</footer>
		
	</div>
		
 <script>
				  function sendContactMail() {
					     var name = $('#contact-name').val();
					     if(name.trim() == '') {
					    	 alert("Entrez votre nom complet");
					    	 $('#contact-name').focus();
					    	 return false;
					     }
					     var email= $('#contact-email').val();
					     if(email.trim() == '') {
					    	 alert("Entrez votre email");
					    	 $('#contact-email').focus();
					    	 return false;
					     }
					     var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
					     if (!filter.test(email)) {
					       alert('votre email est invalide');
					       $('#contact-email').focus();
					       return false;
					     }
					     var subject= $('#contact-subject').val();
					     if(subject.trim() == '') {
					    	 alert("Entrez le sujet");
					    	 $('#contact-subject').focus();
					    	 return false;
					     }
					     var message= $('#contact-message').val();
					     if(message.trim() == '') {
					    	 alert("Entrez votre message");
					    	 $('#contact-message').focus();
					    	 return false;
					     }
						 var formData = {
						        'contact.name'  : name,
						         'contact.email' : email,
						         'contact.subject' : subject,
						         'contact.message' : message
						  };
						 var url = $('#contact-form').attr('action');
						 $(".wait").show();
						  $.ajax({
					          type        : 'POST',
					          url         : url,
					          data        : formData,
					          dataType    : 'json',
					          encode          : true
					      }).done(function(data) {
					    	  if(data.contact) {
					    		  $(".wait").hide();
					    		  alert("votre message a été envoyé");
					    	  } else {
					    	 	 alert("erreur lors de l'envoi du message");
					    	 	$(".wait").hide();
					    	 	 $(".contact").fadeIn(1000);
					    	 	$('#contact-name').focus();
					    	  }
				          });
						  $(".contact").fadeOut(500);
					  return false;
				  }
 			</script>
 </body>
</html>