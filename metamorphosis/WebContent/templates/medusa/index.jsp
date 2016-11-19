<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
   <title>Home</title>
   <link href="images/favicon.ico" rel="icon" sizes="16x16" type="image/x-icon" />
    <link href="https://fonts.googleapis.com/css?family=Cabin" rel="stylesheet" />
   <link href="https://fonts.googleapis.com/css?family=Exo" rel="stylesheet" />
   <link href="templates/medusa/css/template.css" rel="stylesheet"/>
 </head>
<body>

	<div>
	
		<header>
		     <img src="images/logo.png" style="display:none"/>
				 <div class="login" style="display:${security==true?'inline-block':'none'}">
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
		   <tiles:insertAttribute name="content"/>
    	</main>
		
		<footer>
			<p>� 2016 powered by Metamorphosis.</p>
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