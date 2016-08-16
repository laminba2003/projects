<h1>Interface</h1>

<p>
Une interface definit une action ou un groupe d'actions prédéfinis qui doivent être réalisés par la classe ou les classes qui l'implémentent.
Elle permet ainsi la mise en oeuvre d'une application dynamique et de plusieurs solutions à un même problème donné.
</p>

<h2>VoitureService.java</h2>

<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>interface</span> VoitureService {

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> acheter(Voiture v);
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> vendre(Voiture v);
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> louer(Voiture v);
	
}
</pre>


<h2>ClassicService.java</h2>

<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> ClassicService <span style='color:#7f0055; font-weight:bold; '>implements</span> VoitureService {

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> acheter(Voiture v) {
	}
	
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> vendre(Voiture v) {
	}
	
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> louer(Voiture v) {
	}

}
</pre>

<h2>PremiumService.java</h2>

<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> PremiumService <span style='color:#7f0055; font-weight:bold; '>implements</span> VoitureService {

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> acheter(Voiture v) {
	}
	
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> vendre(Voiture v) {
	}

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> louer(Voiture v) {		
	}

}
</pre>

<h2>App.java</h2>

<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> App {

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> <span style='color:#7f0055; font-weight:bold; '>void</span> main(<span style='color:#7f0055; font-weight:bold; '>String</span>[] args) {
		
		Voiture v1 = <span style='color:#7f0055; font-weight:bold; '>new</span> Voiture();
		v1.setMarque(<span style='color:#2a00ff; '>"BMX"</span>);
		v1.setModele(<span style='color:#2a00ff; '>"X5"</span>);
		
		VoitureService service = <span style='color:#7f0055; font-weight:bold; '>new</span> ClassicService();
		service.louer(v1);
		
		Voiture v2 = <span style='color:#7f0055; font-weight:bold; '>new</span> Voiture();
		v2.setMarque(<span style='color:#2a00ff; '>"Ford"</span>);
		v2.setModele(<span style='color:#2a00ff; '>"EcoSport"</span>);
		
		service = <span style='color:#7f0055; font-weight:bold; '>new</span> PremiumService();
		service.louer(v2);
		
	}

}
</pre>

<div class="nav">
 	<p><a href="<%=request.getContextPath()%>/poo/heritage">< Previous</a></p>
 	<p><a href="<%=request.getContextPath()%>/poo/package">Next ></a></p>
</div>