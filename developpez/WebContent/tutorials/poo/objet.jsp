<h1>Objet</h1>
<p>
Un objet est une instance d'une classe et naturellement, il peut exister au sein d'une même application, plusieurs objets du même type. Un objet est obtenu par instantiation, ici nous créons une seule voiture v de marque BMX et de modèle X5 et ensuite nous invoquons sa méthode rouler pour démarrer la simulation.
</p>
<h2>App.java</h2>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> App {

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> <span style='color:#7f0055; font-weight:bold; '>void</span> main(<span style='color:#7f0055; font-weight:bold; '>String</span>[] args) {
		
		Voiture v = <span style='color:#7f0055; font-weight:bold; '>new</span> Voiture();
		v.setMarque(<span style='color:#2a00ff; '>"BMX"</span>);
		v.setModele(<span style='color:#2a00ff; '>"X5"</span>);
		v.rouler();
	}

}
</pre>

<p>
	Dans un projet réel, il est certain que nous aurons à manipuler plusieurs voitures donc à créer plusieurs instances et fort heureusement, la procédure demeure la même.
</p>

<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> App {

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> <span style='color:#7f0055; font-weight:bold; '>void</span> main(<span style='color:#7f0055; font-weight:bold; '>String</span>[] args) {
		
		Voiture v1 = <span style='color:#7f0055; font-weight:bold; '>new</span> Voiture();
		v1.setMarque(<span style='color:#2a00ff; '>"BMX"</span>);
		v1.setModele(<span style='color:#2a00ff; '>"X5"</span>);
		v1.rouler();
		
		Voiture v2 = <span style='color:#7f0055; font-weight:bold; '>new</span> Voiture();
		v2.setMarque(<span style='color:#2a00ff; '>"Ford"</span>);
		v2.setModele(<span style='color:#2a00ff; '>"EcoSport"</span>);
		v2.rouler();
		
		Voiture v3 = <span style='color:#7f0055; font-weight:bold; '>new</span> Voiture();
		v3.setMarque(<span style='color:#2a00ff; '>"Peugeot"</span>);
		v3.setModele(<span style='color:#2a00ff; '>"208"</span>);
		v3.rouler();
	}

}
</pre>	

<div class="nav">
 	<p><a href="<%=request.getContextPath()%>/poo/classe">< Previous</a></p>
 	<p><a href="<%=request.getContextPath()%>/poo/association">Next ></a></p>
</div>