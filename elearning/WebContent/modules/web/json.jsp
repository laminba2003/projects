<h1>JSON</h1>
<p>
<b>JSON (JavaScript Object Notation)</b> est un format de données d'échange léger. Il est facile pour les humains à lire et à écrire et pour les machines à analyser et  à générer.
Il est basé sur un sous-ensemble du langage de programmation <b>JavaScript</b> et est un format de texte qui est complètement indépendant du langage d'utilisation.
</p>
<h2 class="title">Objet</h2>
<p>
Cette déclaration ci-dessous crée un objet que nous pouvons accèder avec la variable <b>personne</b> et ses attributs sont sous la forme "identifiant" : "valeur", séparés par des virgules :
</p>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>var</span> personne = {
    <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>nom</span><span style='color:#2a00ff; '>"</span> : <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>Moussa Sy</span><span style='color:#2a00ff; '>"</span>,
    <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>age</span><span style='color:#2a00ff; '>"</span> : <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>24</span><span style='color:#2a00ff; '>"</span>,
    <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>ville</span><span style='color:#2a00ff; '>"</span> : <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>Dakar</span><span style='color:#2a00ff; '>"</span>,
    <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>quartier</span><span style='color:#2a00ff; '>"</span> : <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>Pikine</span><span style='color:#2a00ff; '>"</span>
};

console.<span style='color:#7f0055; font-weight:bold; '>log</span>(personne.nom);
console.<span style='color:#7f0055; font-weight:bold; '>log</span>(personne.age);
console.<span style='color:#7f0055; font-weight:bold; '>log</span>(personne.ville);
console.<span style='color:#7f0055; font-weight:bold; '>log</span>(personne.quartier);
</pre>
<h2 class="title">Objet imbriqué</h2>
<p>
Un objet peut contenir la déclaration d'autres objets et la méthode d'accès demeure la même :
</p>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>var</span> personne = {
   <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>nom</span><span style='color:#2a00ff; '>"</span> : <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>Moussa Sy</span><span style='color:#2a00ff; '>"</span>,
   <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>age</span><span style='color:#2a00ff; '>"</span> : <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>24</span><span style='color:#2a00ff; '>"</span>,
   <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>adresse</span><span style='color:#2a00ff; '>"</span> : {
      <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>ville</span><span style='color:#2a00ff; '>"</span> : <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>Dakar</span><span style='color:#2a00ff; '>"</span>,
      <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>quartier</span><span style='color:#2a00ff; '>"</span> : <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>Pikine</span><span style='color:#2a00ff; '>"</span>
   }
};

console.<span style='color:#7f0055; font-weight:bold; '>log</span>(personne.nom);
console.<span style='color:#7f0055; font-weight:bold; '>log</span>(personne.age);
console.<span style='color:#7f0055; font-weight:bold; '>log</span>(personne.adresse.ville);
console.<span style='color:#7f0055; font-weight:bold; '>log</span>(personne.adresse.quartier);
</pre>
<h2 class="title">Tableau d'objets</h2>
<p>
Cette déclaration ci-dessous crée un tableau d'objets et chaque objet est accessible via un index qui commence par 0. 
</p>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>var</span> personnes = [
      {
	<span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>nom</span><span style='color:#2a00ff; '>"</span> : <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>Moussa Sy</span><span style='color:#2a00ff; '>"</span>,
        <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>age</span><span style='color:#2a00ff; '>"</span> : <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>24</span><span style='color:#2a00ff; '>"</span>
        <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>adresse</span><span style='color:#2a00ff; '>"</span> : {
	   <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>ville</span><span style='color:#2a00ff; '>"</span> : <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>Dakar</span><span style='color:#2a00ff; '>"</span>,
	   <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>quartier</span><span style='color:#2a00ff; '>"</span> : <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>Pikine</span><span style='color:#2a00ff; '>"</span>
         }
       },
       {
	<span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>nom</span><span style='color:#2a00ff; '>"</span> : <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>Salimata Fall</span><span style='color:#2a00ff; '>"</span>,
        <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>age</span><span style='color:#2a00ff; '>"</span> : <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>26</span><span style='color:#2a00ff; '>"</span>,
        <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>adresse</span><span style='color:#2a00ff; '>"</span> : {
	   <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>ville</span><span style='color:#2a00ff; '>"</span> : <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>Louga</span><span style='color:#2a00ff; '>"</span>,
	   <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>quartier</span><span style='color:#2a00ff; '>"</span> : <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>Santhiaba</span><span style='color:#2a00ff; '>"</span>
        }
       } 
];
<span style='color:#3f7f59; '>// affiche la première personne</span>
console.<span style='color:#7f0055; font-weight:bold; '>log</span>(personnes[0].nom);
console.<span style='color:#7f0055; font-weight:bold; '>log</span>(personnes[0].age);
console.<span style='color:#7f0055; font-weight:bold; '>log</span>(personnes[0].adresse.ville);
console.<span style='color:#7f0055; font-weight:bold; '>log</span>(personnes[0].adresse.quartier);

<span style='color:#3f7f59; '>// affiche la seconde personne</span>
console.<span style='color:#7f0055; font-weight:bold; '>log</span>(personnes[1].nom);
console.<span style='color:#7f0055; font-weight:bold; '>log</span>(personnes[1].age);
console.<span style='color:#7f0055; font-weight:bold; '>log</span>(personnes[1].adresse.ville);
console.<span style='color:#7f0055; font-weight:bold; '>log</span>(personnes[1].adresse.quartier);
</pre>
<div class="nav">
 	<p><a href="web/css">&lt; Précédent</a></p>
 	<p><a href="web/ajax">Suivant &gt;</a></p>
</div>
