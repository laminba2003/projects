<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
   <base href="${path}"/>
   <title>${title}</title>
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
		            <a href="${path}" class="home-16">Home</a>
		            <a href="public/documentation" class="documentation-16">Documentation</a>
		            <a href="public/download" class="download-16">Download</a>
		            <a href="public/modules" class="modules-16">Modules</a>
		            <a href="public/templates" class="templates-16">Templates</a>
		         </div>
				  <div class="login">
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
		  	
		  	 <tiles:insertAttribute name="content"/>
 			 <script type="text/javascript" src="js/metamorphosis.js"></script>
 			 
		</div>  
    	</main>
		
		<footer>
			<p>© 2016 Jelastic. All Rights Reserved, Jelastic, Inc.</p>
		</footer>
		
	</div>
<script>

$(function() {
	$("#login").val("").focus();
});
</script>
</body>
</html>