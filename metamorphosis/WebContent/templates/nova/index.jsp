<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8"/>
   <base href="${path}"/>
   <title><tiles:insertAttribute name="title"/></title>
   <link href="images/favicon.ico" rel="icon" sizes="16x16" type="image/x-icon" />
   <link href="images/favicon-32x32.ico" rel="icon" sizes="32x32" type="image/x-icon" />
   <link href="https://fonts.googleapis.com/css?family=Maven+Pro" rel="stylesheet" />
   <link href="https://fonts.googleapis.com/css?family=Exo" rel="stylesheet" />
   <link href="css/metamorphosis.css" rel="stylesheet"/>
   <link href="templates/nova/css/template.css" rel="stylesheet" />
  <link href="modules/${module}/css/module.css" rel="stylesheet" />
</head>
<body>
	<div>
		<header>
		   <img src="images/logo.png"/>
		   <div class="topmenu">
		         <s:iterator value="#application.moduleManager.modules">
		             <a href="${url}" title="${name}"><img src="${icon}"/><span>${name}</span></a> 
		         </s:iterator>
		   </div>
		   <div class="user-actions">
				<a  class="account-16" href="users/account" title="Account">Account</a>
				<a  href="users/signOut" title="Sign Out" class="signout">Sign Out</a>
			</div>
		</header>
		
		<main>
		   <aside>
		   	  <tiles:insertAttribute name="menu"/>
		   </aside>
		   <section> 
		    <script type="text/javascript" src="js/metamorphosis.js"></script>
		    <script type="text/javascript" src="templates/nova/js/template.js"></script>
		    <script type="text/javascript" src="modules/${module}/js/module.js"></script>
		    <tiles:insertAttribute name="content"/>
		   </section>
    	</main>
		
		<footer>
			<p>© 2016 Jelastic. All Rights Reserved, Jelastic, Inc.</p>
		</footer>
		
	</div>
	
</body>
</html>
