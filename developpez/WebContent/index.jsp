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
 <link href="<%=request.getContextPath()%>/css/pgwslider.min.css" rel="stylesheet" />
 <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
 <script type="text/javascript" src="<%=request.getContextPath()%>/js/app.js"></script>
 <script type="text/javascript" src="<%=request.getContextPath()%>/js/pgwslider.min.js"></script>
</head>
<body>
	<div id="container">
	
		<header>
			<tiles:insertAttribute name="header" />
		</header>
		
		<main role="main" class="clearfix">
		  	 <section class="home">	
				<ul class="pgwSlider">
				    <li><img src="<%=request.getContextPath()%>/images/apprenez.jpg" alt="Apprenez" data-description="Apprenez"></li>
				    <li><img src="<%=request.getContextPath()%>/images/startup.jpg" alt="Développez" data-description="Développez"></li>
				    <li><img src="<%=request.getContextPath()%>/images/collaborez.jpg" alt="Collaborez" data-description="Collaborez"></li>
				    <li><img src="<%=request.getContextPath()%>/images/inspirez.jpg" alt="Inspirez" data-description="Inspirez"></li>
				</ul>
				<div>
					<h1>Mission</h1>
	 				<p>
	 					La mission principale de <span id="sitename">Developpez.sn</span> est d'être la plate-forme de référence en développement informatique au Sénégal pour les étudiants ainsi que pour  les professionnels. Elle propose une large gamme de cours et de services élaborées par des professionnels ayant pour seul objectif de parfaire votre vision et votre maîtrise du développement informatique. 
	 					Et vu que développement rime avec collaboration, la plate-forme vous offre aussi tous les outils nécessaires pour communiquer et interagir avec d'autres développeurs.
	 					Notre service de recrutement pourra aussi vous mettre en relation avec nos entreprises partenaires tout au long du processus.
	 				</p>
	 		
	 				<h1>Nos Offres</h1>
	 				
	 				<h1>Nos Partenaires</h1>
 		
 				</div>
 				
	    	</section>	
 		
    	</main>
		
		<footer>
			<p>© 2016 Developpez.sn All rights reserved.</p>
		</footer>
		
	</div>
</body>
</html>
