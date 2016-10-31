<h1>Premier Programme</h1>
<p>
Lancer votre <b>IDE</b> et créer un projet <b>Java</b> que vous pouvez éventuellement nommer <b>java</b>
et ci-dessous figurent les instructions à suivre :
</p>
<ul class="tabs"> 
      <li class="active" rel="programme"><h2>Enoncé</h2></li>
</ul>
<div class="tab_container"> 
   <div id="programme" class="tab_content">
   	 <div>
       <ul class="number">
		  <li>Définir la classe HelloWorld en créant son fichier java.</li>
		  <li>Ajouter la méthode main pour lancer le programme : 
		  		<ul>
		  			<li> <span class="method">main(String[] args)</span> : ne retourne rien <b>(void)</b>. </li>
		  		</ul>
		  </li>
		   <li>Afficher Hello World sur la console avec la classe finale <b><a href="https://docs.oracle.com/javase/7/docs/api/java/lang/System.html" target="_blank">System</a></b> et
		   son objet <b><a href="https://docs.oracle.com/javase/7/docs/api/java/lang/System.html#out" target="_blank">out</a></b>.
		</ul>
     </div>
   </div>
 </div>
 <h2 class="title">HelloWorld.java</h2>
<p>
<pre style='color:#000000;background:#ffffff;'>
 <span style='color:#3f7f59; '>// affiche Hello World sur la console.</span>
<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> HelloWorld {
   <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> <span style='color:#7f0055; font-weight:bold; '>void</span> main(<span style='color:#7f0055; font-weight:bold; '>String</span>[] args) {
      <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(<span style='color:#2a00ff; '>"Hello World"</span>);
   }
}
</pre>
</p>

<h2 class="title">Exécution</h2>

<p>
Lancer le programme depuis votre <b>IDE</b> pour voir le résultat sur la console et en <b>Java</b>, une classe
est dite <b>finale</b> pour dire qu'elle ne peut être héritée.
</p>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>final</span> <span style='color:#7f0055; font-weight:bold; '>class</span> System {
   <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static final</span> <span style='color:#7f0055; font-weight:bold; '>PrintStream</span> out;
}
</pre>
<div class="nav">
 	<p><a href="java/outils">&lt; Précédent</a></p>
 	<p><a href="java/classe">Suivant &gt;</a></p>
</div>