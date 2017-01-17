<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
   <meta name="author" content="thinktech.sn"/>
   <meta name="category" content="internet" />
   <meta name="robots" content="All" />
   <meta name="description" content="" />
   <meta name="keywords" content="" />
   <base href="${path}/"/>
   <title><tiles:insertAttribute name="title" ignore="true" /></title>
   <link rel="icon" href="images/brain.png">
   <link href="css/app.css" rel="stylesheet" />
   <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet"/>
   <script type="text/javascript" src="js/jquery.js"></script>
   <script type="text/javascript" src="js/app.js"></script>
   <script type="text/javascript" src="js/animation.js"></script>
</head>
<body>
<p class="wait">
<img src="images/wait.gif"/>
</p>
<a name="top"></a>
	<div id="container">
	
		<header>
			<tiles:insertAttribute name="header" />
		</header>
		
		<main role="main" class="clearfix">
		
		  	 <section class="home clearfix">	
		  	 
				 <!-- Start WOWSlider.com BODY section -->
    <div id="wowslider-container">
    <div class="ws_images"><ul>
<li><a href="#"><img src="images/apprenez.jpg" alt="." title="Apprenez" /></a>des langages et des techniques.</li>
<li><a href="#"><img src="images/developpez.jpg" title="D�veloppez" /></a>votre ma�trise du code.</li> 
<li><a href="#"><img src="images/collaborez.jpg" alt="Collaborez avec vos pairs et cr�ez des projets." title="Collaborez avec vos pairs" /></a>Cr�ez des projets.</li>
<li><a href="#"><img src="images/businessguys.jpg" alt="Entrez dans le monde du business" title="Entrez dans le" /></a>monde du business.</li>
</ul></div>
<div class="ws_bullets"><div>
<a href="#"><img src="images/apprenez.jpg"/></a>
<a href="#"><img src="images/developpez.jpg"></a>
<a href="#"><img src="images/collaborez.jpg"/></a>
<a href="#"><img src="images/businessguys.jpg"/></a>

</div></div>
    </div>
     <script type="text/javascript" src="js/wowslider.js"></script>
  <script type="text/javascript" src="js/script.js"></script>
      <!-- End WOWSlider.com BODY section -->
 				
	    	</section>	
	    	<div class="filler">
	 			<a class="scroller" href="#first"><i class="fa fa-chevron-down" aria-hidden="true"></i></a>	 			
	 		</div>
 				    
    <section class="parallax">
    	 <section>
	    	<div class="sticky clearfix" id="first">
	    		<div class="bloc-left">
	    		</div>
	    		<div class="content-left">
	    			<div id="typed-strings">
	    				<pre style='color:#fff;'>
							<span style='color:#ec4040;font-weight:bold; '>namespace</span><span style='color:#fff;'> DeveloppezSN</span>;<br>
							<span style='color:#acacfc;'>/****Debut Mission****/</span><span style='color:#fff;'></span><br>
							<span style='color:#ec4040;font-weight:bold; '>public</span> <span style='color:#ec4040;font-weight:bold; '>Class</span><span style='color:#fff;'> Mission </span><span style='color:#ec4040;font-weight:bold; '>implements</span><span style='color:#fff;'> Destiny</span><span style='color:#fff;'>{</span><span style='color:#fff;'></span><br>
							<span style="margin-left:2em"></span><span> </span><span style='color:#ec40ec;font-weight:bold; '>Use</span><span style='color:#fff;'> Talent</span><span style='color:#fff;'>;</span><span style='color:#fff;'></span><br>
							<span style="margin-left:2em"></span><span> </span><span style='color:#ec40ec;font-weight:bold; '>Use</span><span style='color:#fff;'> Vision</span><span style='color:#fff;'>;</span><span style='color:#fff;'></span><br>
							<span style="margin-left:2em"></span><span style='color:#ec40ec;font-weight:bold; '>Use</span><span style='color:#fff;'> Inspiration</span><span style='color:#fff;'>;</span><span style='color:#fff;'></span><br>
							<span style="margin-left:2em"></span><span style='color:#ec40ec;font-weight:bold; '>Use</span><span style='color:#fff;'> Motivation</span><span style='color:#fff;'>;</span><span style='color:#fff;'></span><br>
							<span style="margin-left:2em"></span><span style='color:#ec4040;font-weight:bold; '>public</span> <span style='color:#ec40ec;font-weight:bold; '>function</span> <span style='color:#fff;'>expertise</span><span style='color:#fff;'>(){</span><br>
							<span style="margin-left:4em"></span><span style='color:#ec4040;font-weight:bold; '>return</span><span style='color:#fff;'> </span><span style='color:#ecec40;'>'SUCCESS'</span><span style='color:#fff;'>;</span><br>
							<span style="margin-left:2em"></span><span style='color:#fff;'>}</span><span style='color:#fff;'></span><br>
							<span style='color:#fff;'>}</span><span style='color:#fff;'></span><br>
							<span style='color:#acacfc;'>/****Fin Mission****/</span><span style='color:#fff;'></span>					
						</pre>
	    			</div>
	    			<span id="typed"></span>
	    		</div>	    		
	    		<h1>Notre Mission</h1>
	    		<div class="mission">
	 				<p>
	 					La mission principale de <strong>Think Dev</strong> est d'�tre la plateforme de r�f�rence en d�veloppement informatique au S�n�gal pour parfaire votre vision et votre ma�trise du d�veloppement informatique.
	 				</p>
		 		</div>
		 		<a class="scroller" href="#second"><i class="fa fa-chevron-down" aria-hidden="true"></i></a>
	    	</div>
	    </section>
	    <section>
	    	<div class="sticky clearfix"  id="second">
	    		<div class="bloc-right"></div>
	    		<div class="content-right">
	    			<h1>Pack D�butant</h1>
	    			<ul>	    			
		    			<li>Cours (Concepts de base)</li>
		    			<li>Exercices</li>
		    			<li>Forum</li>
		    			<li>Chat</li>
		    		</ul>
		    		<a class="button">Disponible</a>
	    		</div>
	    		<h1>Apprenez des langages et des techniques.</h1>
	    		<div class="mission">
	 				<p>
	 					La phase initiale pour devenir un d�veloppeur est d'apprendre au moins un langage de programmation et des techniques. Et pour satisfaire ce besoin crucial, nous avons mis en place ces cours
	 					et ces outils de base.
	 				</p>
		 		</div>
		 		<a class="scroller" href="#third"><i class="fa fa-chevron-down" aria-hidden="true"></i></a>
	    	</div>
	    </section>
	     <section>
	    	<div class="sticky clearfix" id="third">
	    		<div class="bloc-left"></div>
	    		<div class="content-left">
	    			<h1>Pack Avanc�</h1>
	    			<ul>    			
		    			<li>Cours avanc�s</li>
		    			<li>Exercices avanc�s</li>
		    			<li>Challenges</li>
		    		</ul>
		    		<a class="button coming">En Cours</a>
	    		</div>
	    		<h1>D�veloppez votre ma�trise du code.</h1>
	    		<div class="mission">
	 				<p>
	 					Avec une bonne base et une solide fondation, �voluez � un niveau plus avanc� pour acqu�rir une ma�trise compl�te de votre code pour d�velopper des applications de plus haut niveau. 
	 				</p>
		 		</div>
		 		<a class="scroller" href="#fourth"><i class="fa fa-chevron-down" aria-hidden="true"></i></a>
	    	</div>
	    </section>
	    <section>
	    	<div class="sticky clearfix" id="fourth">
	    		<div class="bloc-right"></div>
	    		<div class="content-right">
	    			<h1>Pack Interm�diaire</h1>
	    			<ul>	    			
		    			<li>Cr�ation de groupes de travail</li>
		    			<li>Projets</li>
		    			<li>Mentoring</li>
		    		</ul>
		    		<a class="button coming">En Cours</a>
	    		</div>
	    		<h1>Collaborez avec vos pairs et cr�ez des projets.</h1>
	    		<div class="mission">
	 				<p>
	 					Et vu que d�veloppement rime avec collaboration, connectez avec vos pairs pour cr�ez des groupes de travail et partagez des projets et id�es.
	 				</p>
		 		</div>
		 		<a class="scroller" href="#fifth"><i class="fa fa-chevron-down" aria-hidden="true"></i></a>
	    	</div>
	    </section>
	    <section>
	    	<div class="sticky clearfix" id="fifth">
	    		<div class="bloc-left"></div>
	    		<div class="content-left">
	    			<h1>Pack Expert</h1>
	    			<ul>	    			
		    			<li>Recrutement</li>
		    			<li>Projets Freelance</li>
		    			<li>Projets outsourcing</li>
		    			<li>Cr�ation de start-up</li>
		    		</ul>
		    		<a class="button coming">En Cours</a>
	    		</div>
	    		<h1>Entrez dans le monde du business.</h1>
	    		<div class="mission">
	 				<p>
	 					Cette phase finale stipule que vous �tes arriv� � maturit� et que vous �tes maintenant ma�tre de votre propre destin. Participez au d�veloppement �conomique de votre pays en vous connectant � des entreprises ou en cr�ant la v�tre.
	 				</p>
		 		</div>
		 		<a class="scroller" href="#top"><i class="fa fa-chevron-up" aria-hidden="true"></i></a>
	    	</div>
	    </section>
	    
    </section>
   
   
 		
    	</main>
		
		<footer>
			<p><a href="#top"><i class="fa fa-chevron-up backTop" aria-hidden="true"></i></a></p>
			<p>� 2017 thinktech.sn All rights reserved.</p>
		</footer>
		
	</div>
</body>
</html>
