<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8"/>
   <base href="${path}"/>
   <title>${title}</title>
   <link href="images/favicon.ico" rel="icon" sizes="16x16" type="image/x-icon" />
   <link href="images/favicon-32x32.ico" rel="icon" sizes="32x32" type="image/x-icon" />
   <link href="https://fonts.googleapis.com/css?family=Cabin" rel="stylesheet" />
   <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
   <link href="css/metamorphosis.css" rel="stylesheet"/>
   <link href="templates/dark/css/jquery.jWizard.min.css" rel="stylesheet" />
  <link href="templates/dark/css/template.css" rel="stylesheet"/>
  <link href="${module.path}/css/module.css" rel="stylesheet"/>
</head>
<body>
	<div>
	
	   <header>
		   <img src="images/logo.png"/>
		   <div class="topmenu">
		       <s:iterator value="#request.modules">
		           <a href="${url}" title="${name}"><img src="${icon}"/><span>${name}</span></a> 
		       </s:iterator>
		   </div>
		   <div class="user-actions">
				<a  class="account-16" href="users" title="Account">Account</a>
				<a  href="users/signOut" title="Sign Out" class="signout-16">Sign Out</a>
			</div>
		</header>
		<main>
		  <section>
			 <script type="text/javascript" src="js/metamorphosis.js"></script>
			 <script type="text/javascript" src="templates/dark/js/template.js"></script>
			 <script type="text/javascript" src="${module.path}/js/module.js"></script>
		 	<tiles:insertAttribute name="content"/>
		 </section>
		  <aside>
		   	  <h1 class="icon-16">${module.name}</h1>
		   	   <ul>
		   	    <s:iterator value="#request.menu.menuItems">
					<li><a href="${action}">${name}</a></li>
			   </s:iterator>
			    </ul>
		   </aside>
		</main>
		 <footer>
			<p>� 2016 Jelastic. All Rights Reserved, Jelastic, Inc.</p>
		</footer>
		 
	</div>
	
</body>
</html>
