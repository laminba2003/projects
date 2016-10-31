<h1>Exercices</h1>

<h2 class="title">Exercice 1</h2>

<ul class="tabs"> 
      <li class="active" rel="exo2"><h2>Enoncé</h2></li>
      <li rel="exo2-solution"><h2>Solution</h2></li>
</ul>

<div class="tab_container"> 
   <div id="exo2" class="tab_content">
   	 <div>
       <ul class="number">
		  <li>Définir une classe de base abstraite Figure.</li>
		  <li>Ajouter les méthodes abstraites suivantes : 
		  		<ul>
		  			<li> <span class="method">getPerimetre()</span> : retourne le périmètre de la figure. </li>
		  			 <li> <span class="method">getAire()</span> : retourne l'aire de la figure.</li>
		  		</ul>
		  </li>
		   <li>Créer les classes dérivées et concrétes [ Rectangle, Carré ].</li>
		  <li>Ajouter pour chacune un constructeur d'initialisation.</li>
		   <li>Créer un Rectangle et un Carré</li>
		</ul>
     </div>
   </div>
   <div id="exo2-solution" class="tab_content">
   	
   	   <h2>Figure.java</h2>
   	   <div>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>abstract</span> <span style='color:#7f0055; font-weight:bold; '>class</span> Figure {

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>abstract</span> <span style='color:#7f0055; font-weight:bold; '>int</span> getPerimetre();

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>abstract</span> <span style='color:#7f0055; font-weight:bold; '>int</span> getAire();
	
	@Override
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>String</span> toString() {
	  <span style='color:#7f0055; font-weight:bold; '>return</span> <span style='color:#2a00ff; '>" - Perimetre : "</span> + getPerimetre() + <span style='color:#2a00ff; '>" - Aire : "</span> + getAire();
	}
	
}
</pre>
   	   </div>
   		
  	   <h2>Rectangle.java</h2>
       <div>
 <pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> Rectangle <span style='color:#7f0055; font-weight:bold; '>extends</span> Figure {
	
	<span style='color:#7f0055; font-weight:bold; '>private</span> <span style='color:#7f0055; font-weight:bold; '>int</span> longueur;
	<span style='color:#7f0055; font-weight:bold; '>private</span> <span style='color:#7f0055; font-weight:bold; '>int</span> largeur;
	
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>Rectangle</span>(<span style='color:#7f0055; font-weight:bold; '>int</span> longueur, <span style='color:#7f0055; font-weight:bold; '>int</span> largeur) {
		<span style='color:#7f0055; font-weight:bold; '>this</span>.longueur = longueur;
		<span style='color:#7f0055; font-weight:bold; '>this</span>.largeur = largeur;
	}

	@Override
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>int</span> getPerimetre() {
		<span style='color:#7f0055; font-weight:bold; '>return</span> (longueur + largeur) *2;
	}
	
	@Override
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>int</span> getAire() {
		<span style='color:#7f0055; font-weight:bold; '>return</span> longueur * largeur;
	}
	
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>int</span> getLongueur() {
		<span style='color:#7f0055; font-weight:bold; '>return</span> longueur;
	}
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> setLongueur(<span style='color:#7f0055; font-weight:bold; '>int</span> longueur) {
		<span style='color:#7f0055; font-weight:bold; '>this</span>.longueur = longueur;
	}
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>int</span> getLargeur() {
		<span style='color:#7f0055; font-weight:bold; '>return</span> largeur;
	}
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> setLargeur(<span style='color:#7f0055; font-weight:bold; '>int</span> largeur) {
		<span style='color:#7f0055; font-weight:bold; '>this</span>.largeur = largeur;
	}
	
}
</pre>
 		</div>	
 		
 		<h2>Carre</h2>
  		
  		<div>
  		
  		<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> Carre <span style='color:#7f0055; font-weight:bold; '>extends</span> Figure {

	<span style='color:#7f0055; font-weight:bold; '>private</span> <span style='color:#7f0055; font-weight:bold; '>int</span> cote;
	
	<span style='color:#7f0055; font-weight:bold; '>public</span> Carre(<span style='color:#7f0055; font-weight:bold; '>int</span> cote) {
		<span style='color:#7f0055; font-weight:bold; '>this</span>.cote = cote;
	}

	@Override
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>int</span> getPerimetre() {
		<span style='color:#7f0055; font-weight:bold; '>return</span> cote * 4;
	}

	@Override
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>int</span> getAire() {
		<span style='color:#7f0055; font-weight:bold; '>return</span> cote * cote;
	}

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>int</span> getCote() {
		<span style='color:#7f0055; font-weight:bold; '>return</span> cote;
	}

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> setCote(<span style='color:#7f0055; font-weight:bold; '>int</span> cote) {
		<span style='color:#7f0055; font-weight:bold; '>this</span>.cote = cote;
	}
	
}
</pre>
  		
  		</div>
  		
  		<h2>App.java</h2>
  		
  		<div>
  		
  		<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> App {

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> <span style='color:#7f0055; font-weight:bold; '>void</span> main(<span style='color:#7f0055; font-weight:bold; '>String</span>[] args) {
		
		<span style='color:#7f0055; font-weight:bold; '>Rectangle</span> rectangle = <span style='color:#7f0055; font-weight:bold; '>new</span> <span style='color:#7f0055; font-weight:bold; '>Rectangle</span>(45,10);
		<span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(rectangle);
		Carre carre = <span style='color:#7f0055; font-weight:bold; '>new</span> Carre(15);
		<span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(carre);
		
	}

}
</pre>
  		
  		</div>
  		
   </div>
</div>

<h2 class="title">Exercice 2</h2>

<ul class="tabs"> 
      <li class="active" rel="exo3"><h2>Enoncé</h2></li>
      <li rel="exo3-solution"><h2>Solution</h2></li>
</ul>

<div class="tab_container"> 
   <div id="exo3" class="tab_content">
   	  <div>
       <ul class="number">
		  <li>Remplacer la classe abstraite Figure par une interface.</li>
		  <li>Ajouter les méthodes suivantes : 
		  		<ul>
		  			<li> <span class="method">getPerimetre()</span> : retourne le périmètre de la figure. </li>
		  			 <li> <span class="method">getAire()</span> : retourne l'aire de la figure.</li>
		  		</ul>
		  </li>
		   <li>Créer les classes [ Rectangle, Carré ] qui l'implementent.</li>
		  <li>Ajouter pour chacune un constructeur d'initialisation.</li>
		  <li>Créer un Rectangle et un Carré</li>
		</ul>
     </div>
   </div>
   <div id="exo3-solution" class="tab_content">
   	 <h2>Figure.java</h2>
   	 <div>
   	 
   	 <pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>interface</span> Figure {

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>int</span> getPerimetre();
	
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>int</span> getAire();
	
}
</pre>

   	 </div>
   	 
   	  <h2>Rectangle.java</h2>
       <div>
 <pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> Rectangle <span style='color:#7f0055; font-weight:bold; '>implements</span> Figure {
	
	<span style='color:#7f0055; font-weight:bold; '>private</span> <span style='color:#7f0055; font-weight:bold; '>int</span> longueur;
	<span style='color:#7f0055; font-weight:bold; '>private</span> <span style='color:#7f0055; font-weight:bold; '>int</span> largeur;
	
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>Rectangle</span>(<span style='color:#7f0055; font-weight:bold; '>int</span> longueur, <span style='color:#7f0055; font-weight:bold; '>int</span> largeur) {
		<span style='color:#7f0055; font-weight:bold; '>this</span>.longueur = longueur;
		<span style='color:#7f0055; font-weight:bold; '>this</span>.largeur = largeur;
	}

	@Override
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>int</span> getPerimetre() {
		<span style='color:#7f0055; font-weight:bold; '>return</span> (longueur + largeur) *2;
	}
	
	@Override
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>int</span> getAire() {
		<span style='color:#7f0055; font-weight:bold; '>return</span> longueur * largeur;
	}
	
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>int</span> getLongueur() {
		<span style='color:#7f0055; font-weight:bold; '>return</span> longueur;
	}
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> setLongueur(<span style='color:#7f0055; font-weight:bold; '>int</span> longueur) {
		<span style='color:#7f0055; font-weight:bold; '>this</span>.longueur = longueur;
	}
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>int</span> getLargeur() {
		<span style='color:#7f0055; font-weight:bold; '>return</span> largeur;
	}
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> setLargeur(<span style='color:#7f0055; font-weight:bold; '>int</span> largeur) {
		<span style='color:#7f0055; font-weight:bold; '>this</span>.largeur = largeur;
	}
	
}
</pre>
 		</div>	
 		
 		<h2>Carre</h2>
  		
  		<div>
  		
  		<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> Carre <span style='color:#7f0055; font-weight:bold; '>implements</span> Figure {

	<span style='color:#7f0055; font-weight:bold; '>private</span> <span style='color:#7f0055; font-weight:bold; '>int</span> cote;
	
	<span style='color:#7f0055; font-weight:bold; '>public</span> Carre(<span style='color:#7f0055; font-weight:bold; '>int</span> cote) {
		<span style='color:#7f0055; font-weight:bold; '>this</span>.cote = cote;
	}

	@Override
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>int</span> getPerimetre() {
		<span style='color:#7f0055; font-weight:bold; '>return</span> cote * 4;
	}

	@Override
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>int</span> getAire() {
		<span style='color:#7f0055; font-weight:bold; '>return</span> cote * cote;
	}

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>int</span> getCote() {
		<span style='color:#7f0055; font-weight:bold; '>return</span> cote;
	}

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> setCote(<span style='color:#7f0055; font-weight:bold; '>int</span> cote) {
		<span style='color:#7f0055; font-weight:bold; '>this</span>.cote = cote;
	}
	
}
</pre>
  		
  		</div>
  		
  		<h2>App.java</h2>
  		
  		<div>
  		
  		<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> App {

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> <span style='color:#7f0055; font-weight:bold; '>void</span> main(<span style='color:#7f0055; font-weight:bold; '>String</span>[] args) {
		
		<span style='color:#7f0055; font-weight:bold; '>Rectangle</span> rectangle = <span style='color:#7f0055; font-weight:bold; '>new</span> <span style='color:#7f0055; font-weight:bold; '>Rectangle</span>(45,10);
		<span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(rectangle);
		Carre carre = <span style='color:#7f0055; font-weight:bold; '>new</span> Carre(15);
		<span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(carre);
		
	}

}
</pre>
  		
  		</div>
   	 
   </div>
</div>

<h2 class="title">Exercice 3</h2>

<ul class="tabs"> 
      <li class="active" rel="exo4"><h2>Enoncé</h2></li>
      <li rel="exo4-solution"><h2>Solution</h2></li>
</ul>

<div class="tab_container"> 
   <div id="exo4" class="tab_content">
   	  <div>
       <ul class="number">
		  <li>Créer la classe Etudiant et Filière dans le package <b>entités</b>.</li>
		  <li>Ajouter pour chaque classe un constructeur d'initialisation.</li>
		  <li>Créer 3 filières et cinq étudiants.</li>
		</ul>
     </div>
   </div>
   <div id="exo4-solution" class="tab_content">
   	 <h2>Filiere.java</h2>
   	 <div>
   	 <pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>package</span><span style='color:#7f0055; '> entites</span><span style='color:#7f0055; '>;</span>

<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> Filiere {

	<span style='color:#7f0055; font-weight:bold; '>private</span> <span style='color:#7f0055; font-weight:bold; '>int</span> id;
	<span style='color:#7f0055; font-weight:bold; '>private</span> <span style='color:#7f0055; font-weight:bold; '>String</span> code;
	<span style='color:#7f0055; font-weight:bold; '>private</span> <span style='color:#7f0055; font-weight:bold; '>String</span> libelle;
	
	<span style='color:#7f0055; font-weight:bold; '>public</span> Filiere() {}

	<span style='color:#7f0055; font-weight:bold; '>public</span> Filiere(<span style='color:#7f0055; font-weight:bold; '>int</span> id, <span style='color:#7f0055; font-weight:bold; '>String</span> code, <span style='color:#7f0055; font-weight:bold; '>String</span> libelle) {
		<span style='color:#7f0055; font-weight:bold; '>this</span>.id = id;
		<span style='color:#7f0055; font-weight:bold; '>this</span>.code = code;
		<span style='color:#7f0055; font-weight:bold; '>this</span>.libelle = libelle;
	}

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>int</span> getId() {
		<span style='color:#7f0055; font-weight:bold; '>return</span> id;
	}

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> setId(<span style='color:#7f0055; font-weight:bold; '>int</span> id) {
		<span style='color:#7f0055; font-weight:bold; '>this</span>.id = id;
	}

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>String</span> getCode() {
		<span style='color:#7f0055; font-weight:bold; '>return</span> code;
	}

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> setCode(<span style='color:#7f0055; font-weight:bold; '>String</span> code) {
		<span style='color:#7f0055; font-weight:bold; '>this</span>.code = code;
	}

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>String</span> getLibelle() {
		<span style='color:#7f0055; font-weight:bold; '>return</span> libelle;
	}

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> setLibelle(<span style='color:#7f0055; font-weight:bold; '>String</span> libelle) {
		<span style='color:#7f0055; font-weight:bold; '>this</span>.libelle = libelle;
	}
	
	
}
</pre>
   	 </div>
   	 <h2>Etudiant.java</h2>
   	 <div>
   	 <pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>package</span><span style='color:#7f0055; '> entites</span><span style='color:#7f0055; '>;</span>

<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> Etudiant {

	<span style='color:#7f0055; font-weight:bold; '>private</span> <span style='color:#7f0055; font-weight:bold; '>int</span> id;
	<span style='color:#7f0055; font-weight:bold; '>private</span> <span style='color:#7f0055; font-weight:bold; '>String</span> nom;
	<span style='color:#7f0055; font-weight:bold; '>private</span> <span style='color:#7f0055; font-weight:bold; '>String</span> prenom;
	<span style='color:#7f0055; font-weight:bold; '>private</span> Filiere filiere;
	
	<span style='color:#7f0055; font-weight:bold; '>public</span> Etudiant() {}

	<span style='color:#7f0055; font-weight:bold; '>public</span> Etudiant(<span style='color:#7f0055; font-weight:bold; '>int</span> id, <span style='color:#7f0055; font-weight:bold; '>String</span> nom, <span style='color:#7f0055; font-weight:bold; '>String</span> prenom, Filiere filiere) {
		<span style='color:#7f0055; font-weight:bold; '>this</span>.id = id;
		<span style='color:#7f0055; font-weight:bold; '>this</span>.nom = nom;
		<span style='color:#7f0055; font-weight:bold; '>this</span>.prenom = prenom;
		<span style='color:#7f0055; font-weight:bold; '>this</span>.filiere = filiere;
	}

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>int</span> getId() {
		<span style='color:#7f0055; font-weight:bold; '>return</span> id;
	}
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> setId(<span style='color:#7f0055; font-weight:bold; '>int</span> id) {
		<span style='color:#7f0055; font-weight:bold; '>this</span>.id = id;
	}
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

	<span style='color:#7f0055; font-weight:bold; '>public</span> Filiere getFiliere() {
		<span style='color:#7f0055; font-weight:bold; '>return</span> filiere;
	}

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> setFiliere(Filiere filiere) {
		<span style='color:#7f0055; font-weight:bold; '>this</span>.filiere = filiere;
	}
	
	
}
</pre>
   	 </div>
   	 <h2>App.java</h2>
   	 <div>
   	  <pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>import</span><span style='color:#7f0055; '> entites</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>Filiere</span><span style='color:#7f0055; '>;</span>
<span style='color:#7f0055; font-weight:bold; '>import</span><span style='color:#7f0055; '> entites</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>Etudiant</span><span style='color:#7f0055; '>;</span>

<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> App {

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> <span style='color:#7f0055; font-weight:bold; '>void</span> main(<span style='color:#7f0055; font-weight:bold; '>String</span>[] args) {
		
		Filiere[] filieres = <span style='color:#7f0055; font-weight:bold; '>new</span> Filiere[3];
		filieres[0] = <span style='color:#7f0055; font-weight:bold; '>new</span> Filiere(1,<span style='color:#2a00ff; '>"Info"</span>, <span style='color:#2a00ff; '>"Informatique"</span>);
		filieres[1] = <span style='color:#7f0055; font-weight:bold; '>new</span> Filiere(2,<span style='color:#2a00ff; '>"TIC"</span>, <span style='color:#2a00ff; '>"Technologie et Communication"</span>);
		filieres[2] = <span style='color:#7f0055; font-weight:bold; '>new</span> Filiere(3,<span style='color:#2a00ff; '>"GC"</span>, <span style='color:#2a00ff; '>"Génie civil"</span>);
		
		Etudiant etudiants[] = <span style='color:#7f0055; font-weight:bold; '>new</span> Etudiant[5];
		etudiants[0] = <span style='color:#7f0055; font-weight:bold; '>new</span> Etudiant(1,<span style='color:#2a00ff; '>"Fall"</span>, <span style='color:#2a00ff; '>"Mohamed"</span>, filieres[0]);
		etudiants[1] = <span style='color:#7f0055; font-weight:bold; '>new</span> Etudiant(2,<span style='color:#2a00ff; '>"Ba"</span>, <span style='color:#2a00ff; '>"Issa"</span>,filieres[0]);
		etudiants[2] = <span style='color:#7f0055; font-weight:bold; '>new</span> Etudiant(3,<span style='color:#2a00ff; '>"Diagne"</span>, <span style='color:#2a00ff; '>"Seynabou"</span>,filieres[2]);
		etudiants[3] = <span style='color:#7f0055; font-weight:bold; '>new</span> Etudiant(4,<span style='color:#2a00ff; '>"Faye"</span>, <span style='color:#2a00ff; '>"Babacar"</span>,filieres[2]);
		etudiants[4] = <span style='color:#7f0055; font-weight:bold; '>new</span> Etudiant(5,<span style='color:#2a00ff; '>"Diallo"</span>, <span style='color:#2a00ff; '>"Bineta"</span>,filieres[1]);
		
		
	}

}
</pre>
   	 </div>
   </div>
</div>


<div class="nav">
 	<p><a href="poo/api">&lt; Précédent</a></p>
 	<p><a href="uml">Suivant &gt;</a></p>
</div>