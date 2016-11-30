<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
   <base href="${path}"/>
   <title>${title=='Home'?'Metamorphosis':title}</title>
  <link href="images/favicon.ico" rel="icon" sizes="16x16" type="image/x-icon" />
   <link href="https://fonts.googleapis.com/css?family=Itim" rel="stylesheet" />
   <link href="https://fonts.googleapis.com/css?family=Orbitron" rel="stylesheet" />
   <link href="https://fonts.googleapis.com/css?family=Dosis" rel="stylesheet" />
   <link href="css/metamorphosis.css" rel="stylesheet"/>
   <link href="templates/medusa/css/template.css" rel="stylesheet" />
   <link href="${css}/module.css" rel="stylesheet"/>
 </head>
<body>

	<div>
	
		<header>
		    	 <div class="logo">
		    	   <a href="${path}">
		     		<img src="images/logo.png"/>
		     		</a>
		   		</div>
		         <div class="menu">
		             <s:iterator value="#request.modules" var="current">
		                 <s:iterator value="#current.menu.menuItems">
		                  <a href="${url}" class="${name}-16" title="${name}">${name}</a>
		                </s:iterator>
		            </s:iterator>
		         </div>
				  <div class="login" style="display:${security==true?'inline-block':'none'}">
				  <form action="${signIn}">
				   <span>Email :</span>
				   <input id="email" title="email" type="text" size="20"/>
				   <span>Password :</span>
				   <input title="password" type="password" size="20"/>
				   <input type="submit" title="sign in" value="Sign In"/>
				   <a title="create an account">create an account</a>
				   <a title="forgot your password?">forgot your password?</a>
				   </form>
				</div>
			
		</header>
		
		<main>
	<div>  
		  	
		  	<script type="text/javascript" src="js/metamorphosis.js"></script>
		  	 <tiles:insertAttribute name="content"/>
 			 <script>
				$(function() {
					$(".login input[type='text']").val("").focus();
				});
    		 </script>
 			 <script type="text/javascript" src="${js}/module.js"></script>
		</div>  
    	</main>
		
		<footer>
			<p>&copy; 2016 powered by Metamorphosis.</p>
		</footer>
		
	</div>
</body>
</html>