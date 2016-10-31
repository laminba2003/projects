<h1>Objet</h1>
<p>
<b>JavaScript</b> est un langage utilisant les prototypes. Il utilise des fonctions comme constructeurs pour d�finir un objet et ici, nous d�finissons un constructeur Personne comme suit :
</p>
<h2 class="title">Constructeur</h2>
<pre style='color:#000000;background:#ffffff;'>
<span style='color:#7f0055; font-weight:bold; '>var</span> Personne = <span style='color:#7f0055; font-weight:bold; '>function</span>() { 

}
</pre>
<h2 class="title">Instance</h2>
<p>
Pour cr�er une nouvelle instance, on utilise l'op�rateur <b>new</b> et on affecte le r�sultat de cette expression � une variable qu'on utilisera par la suite.
</p>
<pre style='color:#000000;background:#ffffff;'>
<span style='color:#7f0055; font-weight:bold; '>var</span> personne1 = <span style='color:#7f0055; font-weight:bold; '>new</span> Personne();
<span style='color:#7f0055; font-weight:bold; '>var</span> personne2 = <span style='color:#7f0055; font-weight:bold; '>new</span> Personne();
</pre>
<h2 class="title">Attributs</h2>
<p>
Les attributs d'un objet peuvent �tre d�finis au sein du prototype afin que tous les objets qui en h�ritent puissent en disposer.
Dans le contexte d'un objet, l'acc�s � un attribut se fait gr�ce au mot-cl� <b>this</b> qui fait r�f�rence � l'objet courant.
</p>
<pre style='color:#000000;background:#ffffff;'>
<span style='color:#7f0055; font-weight:bold; '>function</span> Personne(prenom,nom) {
  <span style='color:#7f0055; font-weight:bold; '>this</span>.prenom = prenom;
  <span style='color:#7f0055; font-weight:bold; '>this</span>.nom = nom;
  console.<span style='color:#7f0055; font-weight:bold; '>log</span>(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>Nouvel objet Personne cr��</span><span style='color:#2a00ff; '>'</span>);
}

<span style='color:#7f0055; font-weight:bold; '>var</span> personne1 = <span style='color:#7f0055; font-weight:bold; '>new</span> Personne(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>saliou</span><span style='color:#2a00ff; '>'</span>,<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>ba</span><span style='color:#2a00ff; '>'</span>);
<span style='color:#7f0055; font-weight:bold; '>var</span> personne2 = <span style='color:#7f0055; font-weight:bold; '>new</span> Personne(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>demba</span><span style='color:#2a00ff; '>'</span>,<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>fall</span><span style='color:#2a00ff; '>'</span>);

<span style='color:#3f7f59; '>//affiche le nom des personnes </span>
console.<span style='color:#7f0055; font-weight:bold; '>log</span>(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>personne1 est </span><span style='color:#2a00ff; '>'</span> + personne1.nom); 
console.<span style='color:#7f0055; font-weight:bold; '>log</span>(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>personne2 est </span><span style='color:#2a00ff; '>'</span> + personne2.nom); 
</pre>
<h2 class="title">M�thodes</h2>
<p>
Les m�thodes sont �galement des membres d'un objet. L'appel � une m�thode se fait de la m�me fa�on que pour l'acc�s � un attribut.
</p>
<pre style='color:#000000;background:#ffffff;'>
<span style='color:#7f0055; font-weight:bold; '>function</span> Personne(prenom,nom) {
  <span style='color:#7f0055; font-weight:bold; '>this</span>.prenom = prenom;
  <span style='color:#7f0055; font-weight:bold; '>this</span>.nom = nom;
  console.<span style='color:#7f0055; font-weight:bold; '>log</span>(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>Nouvel objet Personne cr��</span><span style='color:#2a00ff; '>'</span>);
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
Les objets sont des agr�gations d'attributs. Un attribut peut faire r�f�rence � un objet ou une primitive. Les primitives sont des valeurs, elles n'ont pas de propri�t�s. 
Les types primitifs boolean, string et number peuvent �tre envelopp�s par leurs homologues objet
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
 	<p><a href="javascript/programme">&lt; Pr�c�dent</a></p>
 	<p><a href="javascript/tableau">Suivant &gt;</a></p>
</div>