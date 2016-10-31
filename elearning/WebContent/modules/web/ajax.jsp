<h1>AJAX</h1>
<p>
<b>AJAX (Asynchronous JavaScript et XML)</b> est une technique qui utilise l'objet <b>XMLHttpRequest</b> pour communiquer avec des scripts côté serveur
pour envoyer et recevoir des informations dans une variété de formats, y compris <b>JSON, XML, HTML</b> et même des fichiers texte. 
Sa caractéristique la plus attrayante est cependant sa nature asynchrone qui signifie qu'on peut effectuer des actions
basées sur les événements de l'utilisateur pour mettre à jour des parties d'une page web sans avoir à rafraîchir celle-ci.
</p>
<h2 class="title">Requête</h2>
<p>
Afin de faire une requête <b>AJAX</b>, vous avez juste besoin d'une instance de la classe <b>XMLHttpRequest</b>. Une telle classe a été initialement introduite dans <b>Internet Explorer</b> comme un objet <b>ActiveX</b>. Ensuite, <b>Mozilla, Safari</b> et les autres navigateurs ont suivi avant qu'elle ne devienne un standard.
</p>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>var</span> httpRequest;
<span style='color:#3f7f59; '>// ancien code de compatibilité</span>
<span style='color:#7f0055; font-weight:bold; '>if</span> (window.XMLHttpRequest) {<span style='color:#3f7f59; '>// Mozilla, Safari, IE7 + ...</span>
     httpRequest = <span style='color:#7f0055; font-weight:bold; '>new</span> XMLHttpRequest();
} <span style='color:#7f0055; font-weight:bold; '>else</span> <span style='color:#7f0055; font-weight:bold; '>if</span> (window.ActiveXObject) {<span style='color:#3f7f59; '>// IE 6 et plus</span>
     httpRequest = <span style='color:#7f0055; font-weight:bold; '>new</span> ActiveXObject(<span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>Microsoft.XMLHTTP</span><span style='color:#2a00ff; '>"</span>);
}
httpRequest.onreadystatechange = <span style='color:#7f0055; font-weight:bold; '>function</span>(){
    <span style='color:#3f7f59; '>// traite la réponse</span>
  <span style='color:#7f0055; font-weight:bold; '>if</span> (httpRequest.readyState === XMLHttpRequest.DONE) {
      <span style='color:#7f0055; font-weight:bold; '>if</span> (httpRequest.status === 200) {
       <span style='color:#3f7f59; '>// Parfait!</span>
       <span style='color:#7f0055; font-weight:bold; '>alert</span>(httpRequest.responseText);
      } <span style='color:#7f0055; font-weight:bold; '>else</span> {
       <span style='color:#3f7f59; '>// erreur,</span>
      }
  } <span style='color:#7f0055; font-weight:bold; '>else</span> {
    <span style='color:#3f7f59; '>// pas encore prête</span>
  }
}
<span style='color:#ffffff; font-weight:bold; font-style:italic; '>};</span>
httpRequest.open(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>GET</span><span style='color:#2a00ff; '>'</span>, <span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>http://www.example.org/some.file</span><span style='color:#2a00ff; '>'</span>, <span style='color:#7f0055; font-weight:bold; '>true</span>);
httpRequest.send(<span style='color:#7f0055; font-weight:bold; '>null</span>);
</pre>
<h2 class="title">JQuery</h2>
<p>
La librairire <b>jQuery</b> fournit plusieurs méthodes <b>AJAX</b> pour une simplification du processus et vous pouvez très facilement demander du <b>JSON</b> à partir d'un service web 
et charger les données directement dans les éléments <b>HTML</b> sélectionnés de votre page web comme suit :
</p>
<pre style='color:#000000;background:#ffffff;'>$(document).ready(<span style='color:#7f0055; font-weight:bold; '>function</span>() {
  
  $(<span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>#info</span><span style='color:#2a00ff; '>"</span>).click(<span style='color:#7f0055; font-weight:bold; '>function</span>(event){
				
     $.getJSON(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>/personnes/1</span><span style='color:#2a00ff; '>'</span>, <span style='color:#7f0055; font-weight:bold; '>function</span>(personne) {
            $(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>#details</span><span style='color:#2a00ff; '>'</span>).html(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>&lt;p> Nom </span><span style='color:#2a00ff; '>'</span> + personne.nom + <span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>&lt;/p></span><span style='color:#2a00ff; '>'</span>);
            $(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>#details</span><span style='color:#2a00ff; '>'</span>).append(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>&lt;p>Age : </span><span style='color:#2a00ff; '>'</span> + personne.age+ <span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>&lt;/p></span><span style='color:#2a00ff; '>'</span>);
            $(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>#details</span><span style='color:#2a00ff; '>'</span>).append(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>&lt;p> Genre: </span><span style='color:#2a00ff; '>'</span> + personne.genre+ <span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>&lt;/p></span><span style='color:#2a00ff; '>'</span>);
         });
					
   });

});
</pre>
<div class="nav">
 	<p><a href="web/json">&lt; Précédent</a></p>
 	<p><a >Suivant &gt;</a></p>
</div>
