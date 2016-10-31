<h1>HTML</h1>
<p>
Les documents <b>HTML (HyperText Markup Language)</b> ne sont rien de plus que des fichiers texte et vous n'avez besoin que d'un simple éditeur de texte
pour en créer un. La structure de base d'un document <b>HTML</b> comprend des balises qui entourent le contenu et lui donne un sens.
La première ligne est une déclaration de type document et il permet au navigateur de savoir quelle version de <b>HTML</b> vous voulez utiliser.
</p>
<h2 class="title">Document HTML 5</h2>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; '>&lt;!DOCTYPE html></span>
<span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>html</span><span style='color:#7f0055; '>></span>
<span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>head</span><span style='color:#7f0055; '>></span>
<span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>head</span><span style='color:#7f0055; '>></span>
<span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>body</span><span style='color:#7f0055; '>></span>
    ma page web
<span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>body</span><span style='color:#7f0055; '>></span>
<span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>html</span><span style='color:#7f0055; '>></span>
</pre>
<h2 class="title">Balises</h2>
<p>
Les balises <b>HTML</b> forment sa base. Elles définissent la portée d'un élément dans le fichier et peuvent également être utilisées pour insérer 
du contenu. Elles ont un début, des attributs et une fin si elles ne sont pas vides. 
</p>
<ul class="tabs"> 
      <li class="active" rel="metadonnees"><h2>Métadonnées</h2></li>
      <li rel="division"><h2>Division</h2></li>
      <li rel="textuel"><h2>Textuel</h2></li>
      <li rel="semantique"><h2>Sémantique</h2></li>
      <li rel="multimedia"><h2>Multimédia</h2></li>
</ul>
<div class="tab_container"> 
   <div id="metadonnees" class="tab_content">
   	 <table> 
	 <thead> 
	  <tr> 
	 
	   <th scope="col">Élément</th> 
	   <th scope="col">Description</th> 
	  </tr> 
	 </thead> 
	 <tbody> 
	  
	  <tr> 
	 
	   <td valign="top"><a><code>&lt;html&gt;</code></a></td> 
	   <td>représente la racine d'un document</td> 
	  </tr> 
	 
	 <tr> 
	 
	   <td valign="top"><a><code>&lt;base&gt;</code></a></td> 
	   <td>définit l'URL de base à utiliser pour recomposer toutes les URL relatives contenues dans un document</td> 
	  </tr> 
	 
	  <tr> 
	 
	   <td valign="top"><a><code>&lt;head&gt;</code></a></td> 
	   <td>fournit des métadonnées sur le document, incluant son titre et des liens ou des définitions vers des scripts et feuilles de style.</td> 
	  </tr> 
	 
	  <tr> 
	 
	   <td valign="top"><a><code>&lt;link&gt;</code></a></td> 
	   <td>spécifie les relations entre le document courant et d'autres documents</td> 
	  </tr> 
	 
	  <tr> 
	 
	   <td valign="top"><a><code>&lt;meta&gt;</code></a></td> 
	   <td>représente toute information de méta-données ne pouvant être représentée par l'un des éléments consacrés aux méta-données.</td> 
	  </tr> 
	 
	  <tr> 
	 
	   <td valign="top"><code>&lt;style&gt;</code></td> 
	   <td>contient les informations de style pour un document ou une partie de ce document.</td> 
	  </tr> 
	 
	  <tr> 
	 
	   <td valign="top"><code>&lt;titre&gt;</code></td> 
	   <td>définit le titre du document, tel qu'il est montré dans la barre de titre du navigateur ou sur l'onglet de la page. Il ne peut contenir que du texte et les balises contenues ne sont pas interprétées.</td> 
	  </tr>  
	   
  	 </tbody>
   
   </table>
   </div>
   
    <div id="division" class="tab_content">
      
        <table> 
		 <thead> 
		  <tr> 
		 
		   <th scope="col">Élément</th> 
		   <th scope="col">Description</th> 
		  </tr> 
		 </thead> 
		 <tbody>  
		 
		 <tr>
		 
		   <td valign="top"><code>&lt;address&gt;</code></td> 
		   <td>devrait être utilisé par les auteurs pour fournir une information de contact pour l'ancêtre <code>&lt;address&gt;</code></td> 
		  </tr> 
		 
		  <tr> 
		 
		   <td valign="top"><code>&lt;article&gt;</code></td> 
		   <td>représente du contenu autonome dans un document.</td> 
		  </tr> 
		 
		  <tr> 
		 
		   <td valign="top"><code>&lt;aside&gt;</code></td> 
		   <td>est une section de la page dont le contenu est indirectement lié à ce qui l'entoure et qui pourrait être séparé de cet environnement.</td> 
		  </tr> 
		 
		  <tr> 
		 
		   <td valign="top"><code>&lt;footer&gt;</code></td> 
		   <td>représente le pied de page de la section.</td> 
		  </tr> 
		 
		  <tr> 
		 
		   <td valign="top"><code>&lt;header&gt;</code></td> 
		   <td>représente un groupe de contenu introductif ou de contenu aidant à la navigation.</td> 
		  </tr> 
		 
		  <tr> 
		 
		   <td valign="top"><code>&lt;titre&gt;</code></td> 
		   <td>implémente six niveaux de titres dans un document, <code>&lt;h1&gt;</code> est le plus important et <code>&lt;h6&gt;</code> est le moins important.</td> 
		  </tr> 
		 
		  <tr> 
		 
		   <td valign="top"><code>&lt;hgroup&gt;</code></td> 
		   <td>représente le titre d'une section. Il définit un titre unique faisant partie du<a href="/fr/docs/Web/HTML/Sections_and_Outlines_of_an_HTML5_document"> plan du document</a> en tant que titre de la section (implicite ou explicite) à laquelle il appartient.</td> 
		  </tr> 
		 
		  <tr> 
		 
		   <td valign="top"><code>&lt;nav&gt;</code></td> 
		   <td>représente une section d'une page ayant des liens vers d'autres pages ou des fragments de cette page. C'est une section qui permet de naviguer dans un document avec divers liens.</td> 
		  </tr> 
		  
		  </tbody>
  
  	</table>
    	
    </div>
   
   <div id="textuel" class="tab_content">
      <table> 
	 <thead> 
	  <tr> 
	 
	   <th scope="col">Élément</th> 
	   <th scope="col">Description</th> 
	  </tr> 
	 </thead> 
	 <tbody>
 
   <tr> 
 
   <td valign="top"><code>&lt;dd&gt;</code></td> 
   <td>indique la définition d'un terme au sein d'une liste de définitions (élément.</td> 
  </tr> 
 
  <tr> 
 
   <td valign="top"><code>&lt;div&gt;</code></td> 
   <td>est un conteneur générique permettant d'organiser le contenu mais qui ne réprésente rien de particulier.</td> 
  </tr> 
 
  <tr> 
 
   <td valign="top"><code>&lt;dl&gt;</code></td> 
   <td>forme une liste de paires associant des termes et leurs définitions. Typiquement, on utilisera cet élément pour implémenter un glossaire.</td> 
  </tr> 
 
  <tr> 
 
   <td valign="top"><code>&lt;dt&gt;</code></td> 
   <td>identifie un terme dans une liste de définition.</td> 
  </tr> 
 
  <tr> 
 
   <td valign="top"><code>&lt;figcaption&gt;</code></td> 
   <td>permet d'indiquer un sous-titre, une légende, associé à une figure, ou à une illustration.</td> 
  </tr> 
 
  <tr> 
 
   <td valign="top"><code>&lt;figure&gt;</code></td> 
   <td>représente un contenu indépendant, habituellement accompagné d'une légende.</td> 
  </tr> 
 
  <tr> 
 
   <td valign="top"><code>&lt;hr&gt;</code></td> 
   <td>représente un changement thématique entre des éléments de paragraphe.</td> 
  </tr> 
  
  </tbody>
  
  </table>
  
   </div>
   
   <div id="semantique" class="tab_content">
 	
 	    <table> 
	 <thead> 
	  <tr> 
	 
	   <th scope="col">Élément</th> 
	   <th scope="col">Description</th> 
	  </tr> 
	 </thead> 
	 <tbody>
 
  
  <tr> 
 
   <td valign="top"><code>&lt;a&gt;</code></td> 
   <td>définit un hyperlien.</td> 
  </tr> 
 
  <tr> 
 
   <td valign="top"><code>&lt;abbr&gt;</code></td> 
   <td>représente une abréviation.</td> 
  </tr> 
 
  <tr> 
 
   <td  valign="top"><code>&lt;b&gt;</code></td> 
   <td>met un texte en gras.</td> 
  </tr> 
 
 
  <tr> 
    <td  valign="top"><code>&lt;bdi&gt;</code></td> 
    <td>isole une portée (span) de texte pouvant être formaté dans une direction différente de celle du texte qui l'entoure.</td> 
  </tr> 
 
 <tr> 
    <td  valign="top"><code>&lt;bdo&gt;</code></td> 
    <td> est utilisé afin d'outrepasser la direction du texte en question.</td> 
  </tr>
  
  <tr> 
    <td  valign="top"><code>&lt;br&gt;</code></td> 
    <td>produit un retour à la ligne (retour chariot) dans le texte.</td> 
  </tr>
  
 
 </tbody> 
</table>	
 		  
   </div>
   
   <div id="multimedia" class="tab_content">
     <table> 
	 <thead> 
	  <tr> 
	 
	   <th scope="col">Élément</th> 
	   <th scope="col">Description</th> 
	  </tr> 
	 </thead> 
	 <tbody>
	 
	  <tr> 
	    <td  valign="top"><code>&lt;area&gt;</code></td> 
	    <td>définit une zone particulière d'une image et peut lui associer un lien hypertexte.</td> 
 	 </tr>
 	 
 	  <tr> 
	    <td  valign="top"><code>&lt;audio&gt;</code></td> 
	    <td>est utilisé pour intégrer un contenu sonore dans un document.</td> 
 	 </tr>
 	 
 	  <tr> 
	    <td  valign="top"><code>&lt;map&gt;</code></td> 
	    <td>est utilisé en association avec des éléments <code>&lt;area&gt;</code> afin de définir une carte d'image.</td> 
 	 </tr>
 	 
 	  <tr> 
	    <td  valign="top"><code>&lt;track&gt;</code></td> 
	    <td>est utilisé en tant qu'élément appartenant aux éléments  media qui sont <code>&lt;audio&gt;</code> et <code>&lt;video&gt;</code>.</td> 
 	 </tr>
 	 
 	  <tr> 
	    <td  valign="top"><code>&lt;video&gt;</code></td> 
	    <td>est utilisé pour intégrer des vidéo dans un document.</td> 
 	 </tr>
 	
	 </tbody>
</table>
   </div>
   
 </div>

<p>
Vous pouvez avoir une documentation exhaustive des balises <b>HTML</b> <a href="https://developer.mozilla.org/fr/docs/Web/HTML/Element" target="_blank">ici</a>.
</p>

<div class="nav">
 	<p><a href="web/rest">&lt; Précédent</a></p>
 	<p><a href="web/css">Suivant &gt;</a></p>
</div>
