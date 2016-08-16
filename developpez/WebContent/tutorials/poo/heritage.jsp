
<h1>Heritage</h1>
<p>
L'h�ritage est sp�cifique � la programmation orient�e objet. Elle consiste � cr�er une nouvelle classe � partir d'une classe de base et de mettre en place une hi�rarchie. La classe d�riv�e contiendra les attributs et les m�thodes de la classe m�re.
Par exemple, un Client c qui est une Personne peut avoir une Voiture v.
</p>

<h2>Personne.java</h2>

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

<h2>Client.java</h2>


<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> Client <span style='color:#7f0055; font-weight:bold; '>extends</span> Personne {

	<span style='color:#7f0055; font-weight:bold; '>private</span> <span style='color:#7f0055; font-weight:bold; '>String</span> telephone;
	<span style='color:#7f0055; font-weight:bold; '>private</span> <span style='color:#7f0055; font-weight:bold; '>String</span> email;
	
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>String</span> getTelephone() {
		<span style='color:#7f0055; font-weight:bold; '>return</span> telephone;
	}
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> setTelephone(<span style='color:#7f0055; font-weight:bold; '>String</span> telephone) {
		<span style='color:#7f0055; font-weight:bold; '>this</span>.telephone = telephone;
	}
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>String</span> getEmail() {
		<span style='color:#7f0055; font-weight:bold; '>return</span> email;
	}
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> setEmail(<span style='color:#7f0055; font-weight:bold; '>String</span> email) {
		<span style='color:#7f0055; font-weight:bold; '>this</span>.email = email;
	}
	
}
</pre>

<h2>Voiture.java</h2>

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
	

<h2>App.java</h2>

<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> App {

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> <span style='color:#7f0055; font-weight:bold; '>void</span> main(<span style='color:#7f0055; font-weight:bold; '>String</span>[] args) {
		
		Client c = <span style='color:#7f0055; font-weight:bold; '>new</span> Client();
		c.setPrenom(<span style='color:#2a00ff; '>"John"</span>);
		c.setNom(<span style='color:#2a00ff; '>"Doe"</span>);
		c.setEmail(<span style='color:#2a00ff; '>"johndoe@gmail.com"</span>);
		c.setTelephone(<span style='color:#2a00ff; '>"775412648"</span>);
		Voiture v = <span style='color:#7f0055; font-weight:bold; '>new</span> Voiture();
		v.setMarque(<span style='color:#2a00ff; '>"BMX"</span>);
		v.setModele(<span style='color:#2a00ff; '>"X5"</span>);
		v.setProprietaire(c);
		
	}

}
</pre>

<div class="nav">
 	<p><a href="<%=request.getContextPath()%>/poo/association">< Previous</a></p>
 	<p><a href="<%=request.getContextPath()%>/poo/interface">Next ></a></p>
</div>