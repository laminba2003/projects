<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
   <base href="${path}"/>
   <title>Metamorphosis</title>
   <link href="images/favicon.ico" rel="icon" sizes="16x16" type="image/x-icon" />
   <link href="https://fonts.googleapis.com/css?family=Itim" rel="stylesheet" />
   <link href="https://fonts.googleapis.com/css?family=Orbitron" rel="stylesheet" />
   <link href="css/metamorphosis.css" rel="stylesheet"/>
   <link href="css/home.css" rel="stylesheet" />
 </head>
<body>

	<div>
	
		<header>
		    	 <div class="logo">
		     		<img src="images/logo.png"/>
		   		</div>
		         <div class="menu">
		            <a href="${path}" class="home-16 active">Home</a>
		            <a href="public/documentation" class="documentation-16">Documentation</a>
		            <a href="public/download" class="download-16">Download</a>
		            <a href="public/modules" class="modules-16">Modules</a>
		            <a href="public/templates" class="templates-16">Templates</a>
		         </div>
				 <div class="login" style="display:${security==true?'inline-block':'none'}">
				  <form action="users/signIn">
				   <span>Email :</span>
				   <input type="text" size="20"/>
				   <span>Password :</span>
				   <input type="password" size="20"/>
				   <input type="submit" value="Sign In"/>
				   <a>register</a>
				   <a>forgot your password?</a>
				   </form>
				</div>
			
		</header>
		
		<main>
	<div>  
		  	
		  	  	 <!-- Start WOWSlider.com BODY section -->
    <div id="wowslider-container">
    <div class="ws_images"><ul>
<li><a href="#"><img src="images/create.jpg"  title="Create" /></a>Modular web applications.</li>
<li><a href="#"><img src="images/speedup.jpg" title="Speed up" /></a>your development.</li> 
<li><a href="#"><img src="images/collaborate.jpg"  title="Collaborate with an open Community" /></a>Download and Share extensions.</li>
<li><a href="#"><img src="images/cloud.jpg"  title="Create an account" /></a>Build and Manage everything in the Cloud.</li>
</ul></div>
<div class="ws_bullets"><div>
<a href="#"><img src="images/create.jpg"/></a>
<a href="#"><img src="images/speedup.jpg"></a>
<a href="#"><img src="images/collaborate.jpg"/></a>
<a href="#"><img src="images/cloud.jpg"/></a>

</div></div>
    </div>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"
			  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
			  crossorigin="anonymous"></script>

     <script type="text/javascript" src="js/wowslider.js"></script>
  <script type="text/javascript" src="js/script.js"></script>
      <!-- End WOWSlider.com BODY section -->
 				
		</div>  
    	</main>
		
		<footer>
			<p>© 2016</p>
		</footer>
		
	</div>
<script>

$(function() {
	$("#login").val("").focus();
});
</script>
</body>
</html>