<h1>Pattern</h1>

<p>
Dans l'informatique, un <b>pattern</b> ou <b>mod�le de conception</b> est une solution g�n�rale � un probl�me commun rencontr� dans un contexte donn�. C'est un mod�le abstrait existant qui peut �tre r�utilis� dans votre application et son impl�mentation vous incombe totalement.
Il existe 3 cat�gories de mod�les : <br>

<h2 class="title">Cat�gories</h2>

<ul>

	<li>Mod�les de cr�ation </li>
	<li>Mod�les de structure </li>
	<li>Mod�les de comportement </li>

</ul>


</p>

<h2 class="title">Singleton Pattern</h2>
<p>
L'objectif de ce pattern est d'avoir une seule instance d'une classe donn�e dans
une application et sa repr�sentation <b>UML</b> est la suivante.
</p>
<img src="${images}/singleton_pattern_uml_diagram.jpg"/>
<h2 class="title">Impl�mentation Java</h2>
<ul class="tabs"> 
      <li class="active" rel="object"><h2>SingleObject.java</h2></li>
      <li rel="demo"><h2>SingletonPatternDemo.java</h2></li>
</ul>

<div class="tab_container"> 
   <div id="object" class="tab_content">
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> SingleObject {

	<span style='color:#7f0055; font-weight:bold; '>private</span> <span style='color:#7f0055; font-weight:bold; '>static</span> SingleObject instance = <span style='color:#7f0055; font-weight:bold; '>new</span> SingleObject();
	
	<span style='color:#7f0055; font-weight:bold; '>private</span> SingleObject() {}
	
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> showMessage() {
		
	}
	
	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> SingleObject getInstance() {
		
		<span style='color:#7f0055; font-weight:bold; '>return</span> instance;
		
	}
	
}
</pre>
   </div>
   <div id="demo" class="tab_content">
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> SingletonPatternDemo {

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> <span style='color:#7f0055; font-weight:bold; '>void</span> main(<span style='color:#7f0055; font-weight:bold; '>String</span>[] args) {
		
		SingleObject instance = SingleObject.getInstance();
		instance.showMessage();


	}

}
</pre>
   </div>
</div>

<div class="nav">
 	<p><a href="poo/package">&lt; Pr�c�dent</a></p>
 	<p><a href="uml">Suivant &gt;</a></p>
</div>