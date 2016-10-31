<h1>Objet</h1>
<p>
Une fois que vous avez d�clar� une classe non abstraite, vous pouvez cr�er des objets � partir d'elle. Un objet n'est rien de plus qu'une instance d'une classe. Par exemple, maintenant que les classes concr�tes <b>Auteur</b> et <b>Livre</b> ont �t� d�clar�es, nous pouvons cr�er un ou plusieurs objets <b>Auteur</b> et <b>Livre</b> 
en utilisant l'op�rateur <b>new</b> suivi par un constructeur, comme suit :
</p>
<h2 class="title">App.java</h2>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> App {

  <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> <span style='color:#7f0055; font-weight:bold; '>void</span> main[<span style='color:#7f0055; font-weight:bold; '>String</span>[] args] {

       Auteur auteur = <span style='color:#7f0055; font-weight:bold; '>new</span> Auteur(<span style='color:#2a00ff; '>"Mariama"</span>,<span style='color:#2a00ff; '>"B�"</span>);
       Livre livre = <span style='color:#7f0055; font-weight:bold; '>new</span> Livre(<span style='color:#2a00ff; '>"Une si longue lettre"</span>,auteur);

  }

}
</pre>
<p>
l'op�rateur <b>new</b> charge la classe en m�moire, puis appelle son constructeur avec des arguments.  L'objet est initialis� avec des valeurs
et le constructeur retourne une r�f�rence (une sorte de pointeur). Cette r�f�rence est ensuite affect�e � une variable.
Apr�s avoir cr�� un objet <b>Livre</b>, nous pouvons ensuite appeler ses m�thodes <b>getTitre()</b> et <b>getAuteur()</b> pour retourner leurs valeurs de m�me que <b>setTitre()</b> et <b>setAuteur()</b> pour d�finir de nouvelles valeurs. 
Dans les deux cas, nous allons utiliser l'op�rateur d'acc�s aux membres, le point <b>(.), </b>pour accomplir cette t�che :
</p>
<h2 class="title">App.java</h2>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> App {

  <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> <span style='color:#7f0055; font-weight:bold; '>void</span> main[<span style='color:#7f0055; font-weight:bold; '>String</span>[] args] {

       Auteur auteur = <span style='color:#7f0055; font-weight:bold; '>new</span> Auteur();
       auteur.setPrenom(<span style='color:#2a00ff; '>"Mariama"</span>);
       auteur.setNom(<span style='color:#2a00ff; '>"B�"</span>);
       Livre livre = <span style='color:#7f0055; font-weight:bold; '>new</span> Livre(<span style='color:#2a00ff; '>"Une si longue lettre"</span>,auteur);
       <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(livre.getTitre());
       <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(livre.getAuteur().getPrenom());
       <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(livre.getAuteur().getNom());

  }

}
</pre>
<div class="nav">
 	<p><a href="java/classe">&lt; Pr�c�dent</a></p>
 	<p><a href="java/interface">Suivant &gt;</a></p>
</div>