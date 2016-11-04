<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
   <meta name="author" content="Jelastic"/>
   <meta name="category" content="internet" />
   <meta name="robots" content="All" />
   <meta name="description" content="" />
   <meta name="keywords" content="" />
   <title>Home</title>
   <link href="images/favicon.ico" rel="icon" sizes="16x16" type="image/x-icon" />
    <link href="https://fonts.googleapis.com/css?family=Cabin" rel="stylesheet" />
   <link href="https://fonts.googleapis.com/css?family=Exo" rel="stylesheet" />
   <link href="css/home.css" rel="stylesheet" />
 </head>
<body>

	<div>
	
		<header>
		     <img src="images/logo.png" style="display:none"/>
		      <b>CRM</b>
				 <div class="login">
				  <form action="users/signIn">
				   <span>Login :</span>
				   <input id="login" type="text" size="20"/>
				   <span>Password :</span>
				   <input type="password" size="20"/>
				   <a>forgot your password?</a>
				   <input type="submit" value="Sign In"/>
				   </form>
				</div>
			
		</header>
		
		<main>
		    <h1><b>Jelastic Customer Relation Management</b></h1>
		    <img  src="images/computer.png"/>
		   	<p style="display:none">
		   	<b>Jelastic</b> offers a complete and integrated <b>CRM</b> solution that breaks down silos to deliver a seamless customer experience across marketing, sales, commerce, service, and social.
		   	 </p>		   
		   	 <p style="display:none">
		   	 Today's mobile salesforce needs a <b>CRM</b> system that is easy to use and provides the relevant information they need to make sales faster.
		   	 </p>
		   	 <p style="display:none">
              A modern, integrated <b>CRM</b> leverages a multichannel environment to provide better service at a reduced cost.
		   	</p>
    	</main>
		
		<footer>
			<p style="display:none">© 2016 Jelastic.  All Rights Reserved, Jelastic, Inc.</p>
		</footer>
		
	</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"
			  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
			  crossorigin="anonymous"></script>
<script>
$(function() {
	$("header img").fadeIn(1500);
	$("p").fadeIn(1500);
	$("#login").val("").focus();
});
</script>
</body>
</html>
