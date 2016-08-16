<h1>Pattern</h1>

<p>
Dans l'informatique, un pattern est une solution g�n�rale � un probl�me commun rencontr� dans un contexte donn�. C'est un mod�le abstrait existant qui peut �tre r�utilis� dans votre application et son impl�mentation vous incombe totalement.
Il existe 3 cat�gories de mod�les : <br>

<h2>Cat�gories</h2>

<ul>

	<li>Mod�les de cr�ation </li>
	<li>Mod�les de structure </li>
	<li>Mod�les de comportement </li>

</ul>


</p>

<h2>Singleton Pattern</h2>
<p>
L'objectif de ce pattern est d'avoir une seule instance d'une classe donn�e dans
une application et sa repr�sentation UML est la suivante.
</p>
<img src="<%=request.getContextPath()%>/images/singleton_pattern_uml_diagram.jpg"/>

<h2>SingleObject.java</h2>

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

<h2>SingletonPatternDemo.java</h2>

<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> SingletonPatternDemo {

	<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> <span style='color:#7f0055; font-weight:bold; '>void</span> main(<span style='color:#7f0055; font-weight:bold; '>String</span>[] args) {
		
		SingleObject instance = SingleObject.getInstance();
		instance.showMessage();

	}

}
</pre>

<div class="nav">
 	<p><a href="<%=request.getContextPath()%>/poo/api">< Previous</a></p>
 	<p><a href="<%=request.getContextPath()%>/poo/exercices">Next ></a></p>
</div>