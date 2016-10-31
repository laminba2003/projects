<h1>Tableau</h1>
<p>
Un litt�ral de tableau est une liste de z�ro ou plusieurs expressions, dont chacune repr�sente l'�l�ment d'un tableau, encadr�es par des crochets <b>[]</b>. Lorsqu'un tableau est cr�� � partir d'un litt�ral, il est initialis� avec les valeurs sp�cifi�es qui sont ses �l�ments, sa longueur correspondant au nombre d'arguments donn�s.
<p>
<h2 class="title">Exemple</h2>
<pre style='color:#000000;background:#ffffff;'>
      <span style='color:#7f0055; font-weight:bold; '>var</span> tableau = [1.9, 2.9, 3.4, 3.5]

      <span style='color:#3f7f59; '>// affiche tous les �lements</span>
      <span style='color:#7f0055; font-weight:bold; '>for</span> (<span style='color:#7f0055; font-weight:bold; '>var</span> i = 0; i &lt; tableau.length; i++) {
         <span style='color:#7f0055; font-weight:bold; '>console</span>.log(tableau[i] + <span style='color:#2a00ff; '>" "</span>);
      }
      <span style='color:#3f7f59; '>// somme des �lements</span>
      <span style='color:#7f0055; font-weight:bold; '>var</span> total = 0;
      <span style='color:#7f0055; font-weight:bold; '>for</span> (<span style='color:#7f0055; font-weight:bold; '>var</span> i = 0; i &lt; tableau.length; i++) {
         total += tableau[i];
      }
      <span style='color:#7f0055; font-weight:bold; '>console</span>.log(<span style='color:#2a00ff; '>"Le total est "</span> + total);
      <span style='color:#3f7f59; '>// calcul du max</span>
      <span style='color:#7f0055; font-weight:bold; '>var</span> max = tableau[0];
      <span style='color:#7f0055; font-weight:bold; '>for</span> (<span style='color:#7f0055; font-weight:bold; '>var</span> i = 1; i &lt; tableau.length; i++) {
         <span style='color:#7f0055; font-weight:bold; '>if</span> (tableau[i] > max) max = tableau[i];
      }
      <span style='color:#7f0055; font-weight:bold; '>console</span>.log(<span style='color:#2a00ff; '>"Le max est "</span> + max);
   }
</pre>
<div class="nav">
 	<p><a href="javascript/objet">&lt; Pr�c�dent</a></p>
 	<p><a href="javascript/boucle">Suivant &gt;</a></p>
</div>