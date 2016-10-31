<h1>Objet</h1>
<p>
Un <b>objet</b> est une instance d'une classe et naturellement, il peut exister au sein d'une m�me application, plusieurs objets du m�me type. Un objet est obtenu par instantiation, ici nous cr�ons une seule voiture v de marque <b>BMW</b> et de mod�le <b>X5</b> et ensuite nous invoquons sa m�thode rouler pour d�marrer la simulation.
</p>
<h2 class="title">App.java</h2>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> App {

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> <span style='color:#7f0055; font-weight:bold; '>void</span> main(<span style='color:#7f0055; font-weight:bold; '>String</span>[] args) {
		
		Voiture v = <span style='color:#7f0055; font-weight:bold; '>new</span> Voiture();
		v.setMarque(<span style='color:#2a00ff; '>"BMW"</span>);
		v.setModele(<span style='color:#2a00ff; '>"X5"</span>);
		v.rouler();
	}

}
</pre>

<p>
	Dans un projet r�el, il est certain que nous aurons � manipuler plusieurs voitures donc � cr�er plusieurs instances et fort heureusement, la proc�dure demeure la m�me.
</p>

<h2 class="title">App.java</h2>

<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> App {

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> <span style='color:#7f0055; font-weight:bold; '>void</span> main(<span style='color:#7f0055; font-weight:bold; '>String</span>[] args) {
		
		Voiture v1 = <span style='color:#7f0055; font-weight:bold; '>new</span> Voiture();
		v1.setMarque(<span style='color:#2a00ff; '>"BMW"</span>);
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
<h2 class="title">Classe Abstraite</h2>
<p>
Une classe abstraite ne peut donner naissance � des objets et elle est essentiellement utilis�e pour la <b>d�rivation</b> ou <b>h�ritage</b>.
</p>
<img src="${images}/classe_abstraite.png" style="margin-left:10px"/>
<h2 class="title">Exemple</h2>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>abstract</span> <span style='color:#7f0055; font-weight:bold; '>class</span> Figure {

   <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>abstract</span> <span style='color:#7f0055; font-weight:bold; '>double</span> getSurface();

}
</pre>
<h2 class="title">Classe G�n�rique</h2>
<p>
Une classe g�n�rique peut donner naissance � des objets de plusieurs types.
</p>
<img src="${images}/classe_generique.png" style="margin-left:10px"/>
<h2 class="title">Exemple</h2>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> Wrapper&lt;T> {

   <span style='color:#7f0055; font-weight:bold; '>private</span> T element;

   <span style='color:#7f0055; font-weight:bold; '>public</span> Wrapper(T element) {
     <span style='color:#7f0055; font-weight:bold; '>this</span>.element = element;
   }
   
   <span style='color:#7f0055; font-weight:bold; '>public</span> T getElement() {
     <span style='color:#7f0055; font-weight:bold; '>return</span> element;
   }

}
</pre>
<div class="nav">
 	<p><a href="poo/classe">&lt; Pr�c�dent</a></p>
 	<p><a href="poo/association">Suivant &gt;</a></p>
</div>