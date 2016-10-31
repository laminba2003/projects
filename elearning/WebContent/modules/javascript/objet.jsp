<h1>Objet</h1>
<p>
<b>JavaScript</b> est un langage utilisant les prototypes. Il utilise des fonctions comme constructeurs pour définir un objet et ici, nous définissons un constructeur Personne comme suit :
</p>
<h2 class="title">Constructeur</h2>
<pre style='color:#000000;background:#ffffff;'>
<span style='color:#7f0055; font-weight:bold; '>var</span> Personne = <span style='color:#7f0055; font-weight:bold; '>function</span>() { 

}
</pre>
<h2 class="title">Instance</h2>
<p>
Pour créer une nouvelle instance, on utilise l'opérateur <b>new</b> et on affecte le résultat de cette expression à une variable qu'on utilisera par la suite.
</p>
<pre style='color:#000000;background:#ffffff;'>
<span style='color:#7f0055; font-weight:bold; '>var</span> personne1 = <span style='color:#7f0055; font-weight:bold; '>new</span> Personne();
<span style='color:#7f0055; font-weight:bold; '>var</span> personne2 = <span style='color:#7f0055; font-weight:bold; '>new</span> Personne();
</pre>
<h2 class="title">Attributs</h2>
<p>
Les attributs d'un objet peuvent être définis au sein du prototype afin que tous les objets qui en héritent puissent en disposer.
Dans le contexte d'un objet, l'accès à un attribut se fait grâce au mot-clé <b>this</b> qui fait référence à l'objet courant.
</p>
<pre style='color:#000000;background:#ffffff;'>
<span style='color:#7f0055; font-weight:bold; '>function</span> Personne(prenom,nom) {
  <span style='color:#7f0055; font-weight:bold; '>this</span>.prenom = prenom;
  <span style='color:#7f0055; font-weight:bold; '>this</span>.nom = nom;
  console.<span style='color:#7f0055; font-weight:bold; '>log</span>(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>Nouvel objet Personne créé</span><span style='color:#2a00ff; '>'</span>);
}

<span style='color:#7f0055; font-weight:bold; '>var</span> personne1 = <span style='color:#7f0055; font-weight:bold; '>new</span> Personne(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>saliou</span><span style='color:#2a00ff; '>'</span>,<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>ba</span><span style='color:#2a00ff; '>'</span>);
<span style='color:#7f0055; font-weight:bold; '>var</span> personne2 = <span style='color:#7f0055; font-weight:bold; '>new</span> Personne(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>demba</span><span style='color:#2a00ff; '>'</span>,<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>fall</span><span style='color:#2a00ff; '>'</span>);

<span style='color:#3f7f59; '>//affiche le nom des personnes </span>
console.<span style='color:#7f0055; font-weight:bold; '>log</span>(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>personne1 est </span><span style='color:#2a00ff; '>'</span> + personne1.nom); 
console.<span style='color:#7f0055; font-weight:bold; '>log</span>(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>personne2 est </span><span style='color:#2a00ff; '>'</span> + personne2.nom); 
</pre>
<h2 class="title">Méthodes</h2>
<p>
Les méthodes sont également des membres d'un objet. L'appel à une méthode se fait de la même façon que pour l'accès à un attribut.
</p>
<pre style='color:#000000;background:#ffffff;'>
<span style='color:#7f0055; font-weight:bold; '>function</span> Personne(prenom,nom) {
  <span style='color:#7f0055; font-weight:bold; '>this</span>.prenom = prenom;
  <span style='color:#7f0055; font-weight:bold; '>this</span>.nom = nom;
  console.<span style='color:#7f0055; font-weight:bold; '>log</span>(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>Nouvel objet Personne créé</span><span style='color:#2a00ff; '>'</span>);
}

Personne.prototype.afficheNom = <span style='color:#7f0055; font-weight:bold; '>function</span>() {
  console.<span style='color:#7f0055; font-weight:bold; '>log</span>(<span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>le nom est </span><span style='color:#2a00ff; '>"</span> + <span style='color:#7f0055; font-weight:bold; '>this</span>.nom);
};

<span style='color:#7f0055; font-weight:bold; '>var</span> personne1 = <span style='color:#7f0055; font-weight:bold; '>new</span> Personne(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>saliou</span><span style='color:#2a00ff; '>'</span>,<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>ba</span><span style='color:#2a00ff; '>'</span>);
<span style='color:#7f0055; font-weight:bold; '>var</span> personne2 = <span style='color:#7f0055; font-weight:bold; '>new</span> Personne(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>demba</span><span style='color:#2a00ff; '>'</span>,<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>fall</span><span style='color:#2a00ff; '>'</span>);

<span style='color:#3f7f59; '>//affiche le nom des personnes </span>
console.<span style='color:#7f0055; font-weight:bold; '>log</span>(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>personne1 est </span><span style='color:#2a00ff; '>'</span> + personne1..afficheNom()); 
console.<span style='color:#7f0055; font-weight:bold; '>log</span>(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>personne2 est </span><span style='color:#2a00ff; '>'</span> + personne2..afficheNom()); 
</pre>
<h2 class="title">Primitifs</h2>
<p>
En <b>JavaScript</b>, il y a 6 types primitifs : <b>undefined</b>, <b>null</b>, <b>boolean</b>, <b>string</b>, <b>number</b> et <b>Symbol</b>. Tout le reste est objet. 
Les objets sont des agrégations d'attributs. Un attribut peut faire référence à un objet ou une primitive. Les primitives sont des valeurs, elles n'ont pas de propriétés. 
Les types primitifs boolean, string et number peuvent être enveloppés par leurs homologues objet
comme suit :  
</p>
<pre style='color:#000000;background:#ffffff;'>
<span style='color:#7f0055; font-weight:bold; '>var</span> a = <span style='color:#7f0055; font-weight:bold; '>true</span>; 
<span style='color:#7f0055; font-weight:bold; '>var</span> a = <span style='color:#7f0055; font-weight:bold; '>new</span> Boolean(<span style='color:#7f0055; font-weight:bold; '>true</span>); 
 
<span style='color:#7f0055; font-weight:bold; '>var</span> b = <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>abc</span><span style='color:#2a00ff; '>"</span>; 
<span style='color:#7f0055; font-weight:bold; '>var</span> b = <span style='color:#7f0055; font-weight:bold; '>new</span> String(<span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>abc</span><span style='color:#2a00ff; '>"</span>); 

<span style='color:#7f0055; font-weight:bold; '>var</span> c = 123; 
<span style='color:#7f0055; font-weight:bold; '>var</span> c = <span style='color:#7f0055; font-weight:bold; '>new</span> Number(123);

</pre>
<div class="nav">
 	<p><a href="javascript/programme">&lt; Précédent</a></p>
 	<p><a href="javascript/tableau">Suivant &gt;</a></p>
</div>