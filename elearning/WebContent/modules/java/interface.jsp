<h1>Interface</h1>

<p>
Une <b>interface</b> definit une action ou un groupe d'actions prédéfinis qui doivent être réalisés par la classe ou les classes qui l'implémentent.
Elle permet ainsi la mise en oeuvre d'une application dynamique et de plusieurs solutions à un même problème donné.
</p>

<h2 class="title">LivreService.java</h2>

<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>interface</span> LivreService {

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> acheter(Livre livre);
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> vendre(Livre livre);
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> louer(Livre livre);
	
}
</pre>


<h2 class="title">ClassicService.java</h2>

<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> ClassicService <span style='color:#7f0055; font-weight:bold; '>implements</span> LivreService {

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> acheter(Livre livre) {
	}
	
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> vendre(Livre livre) {
	}
	
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> louer(Livre livre) {
	}

}
</pre>

<h2 class="title">PremiumService.java</h2>

<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> PremiumService <span style='color:#7f0055; font-weight:bold; '>implements</span> LivreService {

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> acheter(Livre livre) {
	}
	
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> vendre(Livre livre) {
	}

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> louer(Livre livre) {		
	}

}
</pre>

<h2 class="title">App.java</h2>

<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> App {

  <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> <span style='color:#7f0055; font-weight:bold; '>void</span> main(<span style='color:#7f0055; font-weight:bold; '>String</span>[] args) {
	
	Livre livre = <span style='color:#7f0055; font-weight:bold; '>new</span> Livre(<span style='color:#2a00ff; '>"Une si longue lettre"</span>,<span style='color:#7f0055; font-weight:bold; '>new</span> Auteur(<span style='color:#2a00ff; '>"Mariama"</span>,<span style='color:#2a00ff; '>"Bâ"</span>));
	LivreService service = <span style='color:#7f0055; font-weight:bold; '>new</span> ClassicService();
	service.louer(livre);
	service = <span style='color:#7f0055; font-weight:bold; '>new</span> PremiumService();
	service.louer(livre);
	
  }

}

</pre>

<div class="nav">
 	<p><a href="java/objet">&lt; Précédent</a></p>
 	<p><a href="java/primitifs">Suivant &gt;</a></p>
</div>