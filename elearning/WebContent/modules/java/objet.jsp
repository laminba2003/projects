<h1>Objet</h1>
<p>
Une fois que vous avez déclaré une classe non abstraite, vous pouvez créer des objets à partir d'elle. Un objet n'est rien de plus qu'une instance d'une classe. Par exemple, maintenant que les classes concrétes <b>Auteur</b> et <b>Livre</b> ont été déclarées, nous pouvons créer un ou plusieurs objets <b>Auteur</b> et <b>Livre</b> 
en utilisant l'opérateur <b>new</b> suivi par un constructeur, comme suit :
</p>
<h2 class="title">App.java</h2>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> App {

  <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> <span style='color:#7f0055; font-weight:bold; '>void</span> main[<span style='color:#7f0055; font-weight:bold; '>String</span>[] args] {

       Auteur auteur = <span style='color:#7f0055; font-weight:bold; '>new</span> Auteur(<span style='color:#2a00ff; '>"Mariama"</span>,<span style='color:#2a00ff; '>"Bâ"</span>);
       Livre livre = <span style='color:#7f0055; font-weight:bold; '>new</span> Livre(<span style='color:#2a00ff; '>"Une si longue lettre"</span>,auteur);

  }

}
</pre>
<p>
l'opérateur <b>new</b> charge la classe en mémoire, puis appelle son constructeur avec des arguments.  L'objet est initialisé avec des valeurs
et le constructeur retourne une référence (une sorte de pointeur). Cette référence est ensuite affectée à une variable.
Après avoir créé un objet <b>Livre</b>, nous pouvons ensuite appeler ses méthodes <b>getTitre()</b> et <b>getAuteur()</b> pour retourner leurs valeurs de même que <b>setTitre()</b> et <b>setAuteur()</b> pour définir de nouvelles valeurs. 
Dans les deux cas, nous allons utiliser l'opérateur d'accès aux membres, le point <b>(.), </b>pour accomplir cette tâche :
</p>
<h2 class="title">App.java</h2>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> App {

  <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> <span style='color:#7f0055; font-weight:bold; '>void</span> main[<span style='color:#7f0055; font-weight:bold; '>String</span>[] args] {

       Auteur auteur = <span style='color:#7f0055; font-weight:bold; '>new</span> Auteur();
       auteur.setPrenom(<span style='color:#2a00ff; '>"Mariama"</span>);
       auteur.setNom(<span style='color:#2a00ff; '>"Bâ"</span>);
       Livre livre = <span style='color:#7f0055; font-weight:bold; '>new</span> Livre(<span style='color:#2a00ff; '>"Une si longue lettre"</span>,auteur);
       <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(livre.getTitre());
       <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(livre.getAuteur().getPrenom());
       <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(livre.getAuteur().getNom());

  }

}
</pre>
<div class="nav">
 	<p><a href="java/classe">&lt; Précédent</a></p>
 	<p><a href="java/interface">Suivant &gt;</a></p>
</div>