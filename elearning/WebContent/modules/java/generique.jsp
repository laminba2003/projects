<h1>Générique</h1>
<p>
Les méthodes et les classes génériques permettent aux programmeurs de spécifier avec une seule déclaration de méthode, un ensemble de méthodes connexes, ou avec une déclaration de classe unique, un ensemble de types connexes.
<p>

<h2 class="title">Les méthodes génériques</h2>
<p>
Une déclaration générique de méthode peut être appelée avec des arguments de types différents et
sur la base des types des arguments passés à la méthode, le compilateur gèrera chaque appel de façon appropriée. Ainsi
nous pourrions écrire une méthode générique pour trier un tableau d'objets, puis appeler cette même méthode avec des entiers, des doubles, des caractères et ainsi de suite.
</p>
<h2 class="title">Exemple</h2>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> Test {

   <span style='color:#3f7f59; '>// méthode générique pour afficher un tableau                         </span>
    <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> &lt;E> <span style='color:#7f0055; font-weight:bold; '>void</span> affiche(E[] tableau) {              
        <span style='color:#7f0055; font-weight:bold; '>for</span> (E element : tableau){        
           <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(element);
        }
    }


    <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> <span style='color:#7f0055; font-weight:bold; '>void</span> main( <span style='color:#7f0055; font-weight:bold; '>String</span> args[] ) {
        <span style='color:#3f7f59; '>// tableaux de Integer, Double et Character</span>
        <span style='color:#7f0055; font-weight:bold; '>Integer</span>[] tableau1 = { 1, 2, 3, 4, 5 };
        <span style='color:#7f0055; font-weight:bold; '>Double</span>[] tableau2 = { 1.1d, 2.2d, 3.3d, 4.4d };
        <span style='color:#7f0055; font-weight:bold; '>Character</span>[] tableau3 = { <span style='color:#2a00ff; '>'H'</span>, <span style='color:#2a00ff; '>'E'</span>, <span style='color:#2a00ff; '>'L'</span>, <span style='color:#2a00ff; '>'L'</span>, <span style='color:#2a00ff; '>'O'</span> };

        <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println( <span style='color:#2a00ff; '>"Tableau Integer :"</span> );
        affiche(tableau1);

        <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println( <span style='color:#2a00ff; '>"Tableau Double :"</span> );
        affiche(tableau2);

        <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println( <span style='color:#2a00ff; '>"Tableau Character"</span> );
        affiche(tableau3);
    }
 
}
</pre>
<h2 class="title">Les classes génériques</h2>
<p>
Une déclaration de classe générique ressemble à une déclaration de classe non générique, sauf que le nom de la classe est suivi d'une section type de paramètre
et cette dernière peut avoir un ou plusieurs paramètres séparés par des virgules.
</p>
<h2 class="title">Exemple</h2>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> Afficheur&lt;E> {

  <span style='color:#7f0055; font-weight:bold; '>private</span> E tableau[];

  <span style='color:#7f0055; font-weight:bold; '>public</span> Afficheur(E tableau[]) {
    <span style='color:#7f0055; font-weight:bold; '>this</span>.tableau = tableau;
  }
  <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> affiche() {
    <span style='color:#7f0055; font-weight:bold; '>for</span>(E element : tableau){        
        <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(element);
    }
  }

  <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> <span style='color:#7f0055; font-weight:bold; '>void</span> main(<span style='color:#7f0055; font-weight:bold; '>String</span>[] args) {
     Afficheur&lt;<span style='color:#7f0055; font-weight:bold; '>Integer</span>> a1 = <span style='color:#7f0055; font-weight:bold; '>new</span> Afficheur&lt;<span style='color:#7f0055; font-weight:bold; '>Integer</span>>( { 1, 2, 3, 4, 5 });
     a1.affiche();

    Afficheur&lt;<span style='color:#7f0055; font-weight:bold; '>Double</span>> a2 = <span style='color:#7f0055; font-weight:bold; '>new</span> Afficheur&lt;<span style='color:#7f0055; font-weight:bold; '>Double</span>>({ 1.1d, 2.2d, 3.3d, 4.4d });
     a2.affiche();
     
    Afficheur&lt;<span style='color:#7f0055; font-weight:bold; '>Character</span>> a3 = <span style='color:#7f0055; font-weight:bold; '>new</span> Afficheur&lt;<span style='color:#7f0055; font-weight:bold; '>Character</span>>({ <span style='color:#2a00ff; '>'H'</span>, <span style='color:#2a00ff; '>'E'</span>, <span style='color:#2a00ff; '>'L'</span>, <span style='color:#2a00ff; '>'L'</span>, <span style='color:#2a00ff; '>'O'</span> });
     a3.affiche();
  }
}
</pre>
<div class="nav">
 	<p><a href="java/collections">&lt; Précédent</a></p>
 	<p><a href="java/exception">Suivant &gt;</a></p>
</div>