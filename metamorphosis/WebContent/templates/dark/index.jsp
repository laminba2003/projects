<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8"/>
   <base href="${path}"/>
   <title><tiles:insertAttribute name="title" ignore="true" /></title>
   <link href="images/favicon.ico" rel="icon" sizes="16x16" type="image/x-icon" />
   <link href="images/favicon-32x32.ico" rel="icon" sizes="32x32" type="image/x-icon" />
   <link href="https://fonts.googleapis.com/css?family=Cabin" rel="stylesheet" />
   <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
   <link href="css/metamorphosis.css" rel="stylesheet"/>
   <link href="templates/dark/css/jquery.jWizard.min.css" rel="stylesheet" />
  <link href="templates/dark/css/template.css" rel="stylesheet"/>
  <link href="modules/${module}/css/module.css" rel="stylesheet"/>
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
				<a  href="users/signOut" title="Sign Out" class="signout-16">Sign Out</a>
			</div>
		</header>
		<main>
		  <section>
			 <script type="text/javascript" src="js/metamorphosis.js"></script>
			 <script type="text/javascript" src="templates/dark/js/template.js"></script>
			 <script type="text/javascript" src="modules/${module}/js/module.js"></script>
		 	<tiles:insertAttribute name="content"/>
		 </section>
		  <aside>
		   	  <tiles:insertAttribute name="menu"/>
		   </aside>
		</main>
		 <footer>
			<p>© 2016 Jelastic. All Rights Reserved, Jelastic, Inc.</p>
		</footer>
		 
	</div>
	
</body>
</html>
