<h1>G�n�rique</h1>
<p>
Les m�thodes et les classes g�n�riques permettent aux programmeurs de sp�cifier avec une seule d�claration de m�thode, un ensemble de m�thodes connexes, ou avec une d�claration de classe unique, un ensemble de types connexes.
<p>

<h2 class="title">Les m�thodes g�n�riques</h2>
<p>
Une d�claration g�n�rique de m�thode peut �tre appel�e avec des arguments de types diff�rents et
sur la base des types des arguments pass�s � la m�thode, le compilateur g�rera chaque appel de fa�on appropri�e. Ainsi
nous pourrions �crire une m�thode g�n�rique pour trier un tableau d'objets, puis appeler cette m�me m�thode avec des entiers, des doubles, des caract�res et ainsi de suite.
</p>
<h2 class="title">Exemple</h2>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> Test {

   <span style='color:#3f7f59; '>// m�thode g�n�rique pour afficher un tableau                         </span>
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
<h2 class="title">Les classes g�n�riques</h2>
<p>
Une d�claration de classe g�n�rique ressemble � une d�claration de classe non g�n�rique, sauf que le nom de la classe est suivi d'une section type de param�tre
et cette derni�re peut avoir un ou plusieurs param�tres s�par�s par des virgules.
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
 	<p><a href="java/collections">&lt; Pr�c�dent</a></p>
 	<p><a href="java/exception">Suivant &gt;</a></p>
</div>