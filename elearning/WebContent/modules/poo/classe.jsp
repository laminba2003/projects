<h1>Classe</h1>
<p>
Dans le monde r�el, il est fr�quent de rencontrer des objets de m�me <b>type</b> ou <b>classe</b>. Par exemple, il existe des milliers de voitures. Une voiture est entre autre d�finie par une marque et un mod�le qui sont ses attributs
et son comportement d�finit ses actions ou m�thodes <b>(rouler, freiner, arr�ter...)</b>.
</p>
<h2 class="title">Repr�sentation UML</h2>
<img src="${images}/classe.png" style="margin : 10px;"/>
<p>
La repr�sentation informatique et en langage <b>Java</b> d'une voiture est la suivante, notez ici que les attributs ont �t� d�clar�s priv� et des m�thodes ou accesseurs setX et getX ont �t� respectivement cr�es pour chacun d'eux afin de pouvoir initialiser et r�cup�rer leur valeur :
</p>
<h2 class="title">Voiture.java</h2>

<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> Voiture {

	<span style='color:#7f0055; font-weight:bold; '>private</span> <span style='color:#7f0055; font-weight:bold; '>String</span> marque;
	<span style='color:#7f0055; font-weight:bold; '>private</span> <span style='color:#7f0055; font-weight:bold; '>String</span> modele;
	
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

}
</pre>
<div class="nav">
 	<p><a href="poo">&lt; Pr�c�dent</a></p>
 	<p><a href="poo/objet">Suivant &gt;</a></p>
</div>