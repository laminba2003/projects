<h1>Association</h1>
<p>
Une <b>association</b> est la relation inter-classe qui permet à un objet d'une classe de pouvoir collaborer avec un autre objet d'une autre classe. Leur relation peut être unidirectionnelle ou bidirectionnelle.
</p>
<h2 class="title">Représentation UML</h2>
<img src="${images}/association.png" style="margin : 10px;"/>
<h2 class="title">Exemple</h2>
<p>
Une Voiture v a un propriétaire p qui est de type Personne.
</p>

<ul class="tabs"> 
      <li class="active" rel="personne"><h2>Personne.java</h2></li>
      <li rel="voiture"><h2>Voiture.java</h2></li>
      <li rel="app"><h2>App.java</h2></li>
</ul>

<div class="tab_container"> 
   <div id="personne" class="tab_content">
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> Personne {

<span style='color:#7f0055; font-weight:bold; '>private</span> <span style='color:#7f0055; font-weight:bold; '>String</span> nom;
<span style='color:#7f0055; font-weight:bold; '>private</span> <span style='color:#7f0055; font-weight:bold; '>String</span> prenom;

<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>String</span> getNom() {
	<span style='color:#7f0055; font-weight:bold; '>return</span> nom;
}
<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> setNom(<span style='color:#7f0055; font-weight:bold; '>String</span> nom) {
	<span style='color:#7f0055; font-weight:bold; '>this</span>.nom = nom;
}
<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>String</span> getPrenom() {
	<span style='color:#7f0055; font-weight:bold; '>return</span> prenom;
}
<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> setPrenom(<span style='color:#7f0055; font-weight:bold; '>String</span> prenom) {
	<span style='color:#7f0055; font-weight:bold; '>this</span>.prenom = prenom;
	}
	
}
</pre>
   </div>
    <div id="voiture" class="tab_content">
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> Voiture {

	<span style='color:#7f0055; font-weight:bold; '>private</span> <span style='color:#7f0055; font-weight:bold; '>String</span> marque;
	<span style='color:#7f0055; font-weight:bold; '>private</span> <span style='color:#7f0055; font-weight:bold; '>String</span> modele;
	<span style='color:#7f0055; font-weight:bold; '>private</span> Personne proprietaire;
	
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> rouler() {
		
	}
	
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> freiner() {
		
	}
		
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> arreter() {
		
	}

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>String</span> getMarque() {
		<span style='color:#7f0055; font-weight:bold; '>return</span> marque;
	}

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> setMarque(<span style='color:#7f0055; font-weight:bold; '>String</span> marque) {
		<span style='color:#7f0055; font-weight:bold; '>this</span>.marque = marque;
	}

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>String</span> getModele() {
		<span style='color:#7f0055; font-weight:bold; '>return</span> modele;
	}

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> setModele(<span style='color:#7f0055; font-weight:bold; '>String</span> modele) {
		<span style='color:#7f0055; font-weight:bold; '>this</span>.modele = modele;
	}

	<span style='color:#7f0055; font-weight:bold; '>public</span> Personne getProprietaire() {
		<span style='color:#7f0055; font-weight:bold; '>return</span> proprietaire;
	}

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> setProprietaire(Personne proprietaire) {
		<span style='color:#7f0055; font-weight:bold; '>this</span>.proprietaire = proprietaire;
	}

}
</pre>	
   </div>
    <div id="app" class="tab_content">
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> App {

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> <span style='color:#7f0055; font-weight:bold; '>void</span> main(<span style='color:#7f0055; font-weight:bold; '>String</span>[] args) {
		
		Personne p = <span style='color:#7f0055; font-weight:bold; '>new</span> Personne();
		p.setPrenom(<span style='color:#2a00ff; '>"John"</span>);
		p.setNom(<span style='color:#2a00ff; '>"Doe"</span>);
		Voiture v = <span style='color:#7f0055; font-weight:bold; '>new</span> Voiture();
		v.setMarque(<span style='color:#2a00ff; '>"BMW"</span>);
		v.setModele(<span style='color:#2a00ff; '>"X5"</span>);
		v.setProprietaire(p);
		
	}

}
</pre>   
   </div>
</div>
<p>
Il existe trois types d'association :
<ul>
 <li><b>Agrégation :</b> elle est une association avec relation de subordination</li>
 <li><b>Composition :</b> elle est une agrégation avec cycle de vie dépendant</li>
 <li><b>Dépendance :</b> Une ou plusieurs méthodes reçoivent un objet d'une autre classe</li>
</ul>
</p>
<div class="nav">
 	<p><a href="poo/objet">&lt; Précédent</a></p>
 	<p><a href="poo/heritage">Suivant &gt;</a></p>
</div>