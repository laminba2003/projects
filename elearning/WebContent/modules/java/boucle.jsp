<h1>Boucle</h1>
<p>
Il peut y avoir une situation o� vous devez ex�cuter un bloc de code plusieurs fois. En g�n�ral, les instructions sont ex�cut�es s�quentiellement : La premi�re instruction dans une fonction est ex�cut�e en premier, suivi par la seconde, et ainsi de suite.
Les langages de programmation fournissent diverses structures de contr�le qui permettent des chemins d'ex�cution plus complexes.
<p>
<h2 class="title">Boucle for</h2>
<p>
Une boucle <b>for</b> est une structure de contr�le de r�p�tition qui vous permet d'�crire efficacement une boucle qui doit s'ex�cuter un certain nombre de fois.
</p>
<pre style='color:#000000;background:#ffffff;'>
   <span style='color:#7f0055; font-weight:bold; '>int</span> [] nombres = {1, 2, 3, 4, 5,6,7,8,9,10};
   <span style='color:#7f0055; font-weight:bold; '>for</span>(<span style='color:#7f0055; font-weight:bold; '>int</span> i = 0 ; i &lt; nombres.length: i++){
      <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(nombres[i]);
   }
   <span style='color:#3f7f59; '>// une autre m�thode</span>
   <span style='color:#7f0055; font-weight:bold; '>for</span>(<span style='color:#7f0055; font-weight:bold; '>int</span> nombre : nombres){
      <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(nombre);
   }
</pre>
<h2 class="title">Boucle while</h2>
<p>
 Une boucle <b>while</b> s'ex�cute de mani�re r�p�t�e tant qu'une condition donn�e est vraie.
</p>
<pre style='color:#000000;background:#ffffff;'>
   <span style='color:#7f0055; font-weight:bold; '>int</span> [] nombres = {10, 20, 30, 40, 50};
   <span style='color:#7f0055; font-weight:bold; '>int</span> i = 0;
   <span style='color:#7f0055; font-weight:bold; '>while</span>(i &lt; nombres.length){
      <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(nombres[i]);
      i++;
   }
</pre>
<h2 class="title">Boucle do..while</h2>
<p>
Une boucle <b>do..while</b> est semblable � une boucle <b>while</b>, sauf qu'elle est garantie de s'ex�cuter au moins une fois.
</p>
<pre style='color:#000000;background:#ffffff;'>
   <span style='color:#7f0055; font-weight:bold; '>int</span> [] nombres = {10, 20, 30, 40, 50};
   <span style='color:#7f0055; font-weight:bold; '>int</span> i = 0;
   <span style='color:#7f0055; font-weight:bold; '>do</span>{
      <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(nombres[i]);
      i++;
   }<span style='color:#7f0055; font-weight:bold; '>while</span>(i &lt; nombres.length);
</pre>
<div class="nav">
 	<p><a href="java/tableau">&lt; Pr�c�dent</a></p>
 	<p><a href="java/decision">Suivant &gt;</a></p>
</div>