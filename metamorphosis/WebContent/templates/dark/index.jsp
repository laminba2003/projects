<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8"/>
   <base href="${path}"/>
   <title>${title}</title>
   <link href="images/favicon.ico" rel="icon" sizes="16x16" type="image/x-icon" />
   <link href="https://fonts.googleapis.com/css?family=Cabin" rel="stylesheet" />
   <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
   <link href="css/metamorphosis.css" rel="stylesheet"/>
   <link href="templates/dark/css/jquery.jWizard.min.css" rel="stylesheet" />
  <link href="templates/dark/css/template.css" rel="stylesheet"/>
  <link href="${css}/module.css" rel="stylesheet"/>
</head>
<body>
	<div>
	   <header>
		   <div class="logo">
		     <img src="images/logo.png"/>
		   </div>
		   <div class="topmenu">
		       <s:iterator value="modules">
		           <a href="${url}" title="${name}"><img src="${icon}"/><span>${name}</span></a> 
		       </s:iterator>
		   </div>
		   <div class="user-actions" style="display:${security==true?'inline-block':'none'}">
				<a  class="account-16" href="users" title="Account">Account</a>
				<a  href="${logout}" title="Log Out" class="signout-16">Log Out</a>
			</div>
		</header>
		<main>
		  <section>
		     <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
			 <script type="text/javascript" src="js/metamorphosis.js"></script>
			 <script type="text/javascript" src="js/app.js"></script>
			 <script type="text/javascript" src="templates/dark/js/template.js"></script>
			 <script type="text/javascript" src="${js}/module.js"></script>
		 	<tiles:insertAttribute name="content"/>
		 </section>
		  <aside>
		   	   <s:iterator value="#request.module.getMenus('main')" var="menu">
		   	      <h1 class="icon-16">${menu.label}</h1>
		   	   		<ul>
		   	         <s:iterator value="#menu.menuItems">
						<li><a href="${url}">${label}</a></li>
					</s:iterator>
					 </ul>
			   </s:iterator>
		   </aside>
		</main>
		 <footer>
			<p>&copy; 2016 powered by Metamorphosis.</p>
		</footer>
		 
	</div>
	
</body>
</html>
