<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<link rel="icon" href="<%=request.getContextPath()%>/images/brain.png">
 <link href="<%=request.getContextPath()%>/css/app.css" rel="stylesheet" />
 <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
 <script type="text/javascript" src="<%=request.getContextPath()%>/js/app.js"></script></head>
<body>
	<div id="container">
	
		<header>
			<tiles:insertAttribute name="header" />
		</header>
		
		<main role="main" class="clearfix">
		
		<aside> 
		 <section>
		 	<tiles:insertAttribute name="menu" />
		 </section>
		 </aside>
	  	 <section class="content">	
	  	 		<tiles:insertAttribute name="content" />
    	</section>	
 
    	</main>
		
		<footer>
			<p>© 2016 Developpez.sn All rights reserved.</p>
		</footer>
		
	</div>
</body>
</html>