<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
   <base href="${path}"/>
   <title>${title}</title>
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
		                  <a href="${action}" class="${name}-16">${name}</a>
		                </s:iterator>
		            </s:iterator>
		         </div>
				  <div class="login" style="display:${security==true?'inline-block':'none'}">
				  <form action="users/signIn">
				   <span>Email :</span>
				   <input id="email" type="text" size="20"/>
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