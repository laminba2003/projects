<h1>Tableau</h1>
<p>
<b>Java</b> fournit le tableau comme structure de données pour stocker des éléments de même type avec une taille fixe.
Au lieu de déclarer des variables individuelles telles que v1, v2, ... et v100, vous déclarez une seule variable de type tableau et vous accédez aux valeurs par un index
qui commence par 0.
<p>
<h2 class="title">Exemple</h2>
<pre style='color:#000000;background:#ffffff;'>
   <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> <span style='color:#7f0055; font-weight:bold; '>void</span> main(<span style='color:#7f0055; font-weight:bold; '>String</span>[] args) {
      <span style='color:#7f0055; font-weight:bold; '>double</span>[] tableau = {1.9, 2.9, 3.4, 3.5};

      <span style='color:#3f7f59; '>// affiche tous les élements</span>
      <span style='color:#7f0055; font-weight:bold; '>for</span> (<span style='color:#7f0055; font-weight:bold; '>int</span> i = 0; i &lt; tableau.length; i++) {
         <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(tableau[i] + <span style='color:#2a00ff; '>" "</span>);
      }
      <span style='color:#3f7f59; '>// somme des élements</span>
      <span style='color:#7f0055; font-weight:bold; '>double</span> total = 0;
      <span style='color:#7f0055; font-weight:bold; '>for</span> (<span style='color:#7f0055; font-weight:bold; '>int</span> i = 0; i &lt; tableau.length; i++) {
         total += tableau[i];
      }
      <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(<span style='color:#2a00ff; '>"Le total est "</span> + total);
      <span style='color:#3f7f59; '>// calcul du max</span>
      <span style='color:#7f0055; font-weight:bold; '>double</span> max = tableau[0];
      <span style='color:#7f0055; font-weight:bold; '>for</span> (<span style='color:#7f0055; font-weight:bold; '>int</span> i = 1; i &lt; tableau.length; i++) {
         <span style='color:#7f0055; font-weight:bold; '>if</span> (tableau[i] > max) max = tableau[i];
      }
      <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(<span style='color:#2a00ff; '>"Le max est "</span> + max);
   }

}
</pre>
<div class="nav">
 	<p><a href="java/chaines">&lt; Précédent</a></p>
 	<p><a href="java/boucle">Suivant &gt;</a></p>
</div>