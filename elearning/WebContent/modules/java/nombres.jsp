<h1>Nombres</h1>
<p>
Lorsque nous travaillons avec les nombres, normalement nous utilisons les types de donn�es primitifs : byte, short, int, long, float, double, boolean, char.
Cependant, dans le d�veloppement, nous rencontrons des situations o� nous avons besoin d'utiliser leurs correspondants objet. Afin d'atteindre cet objectif, <b>Java</b> fournit des classes enveloppeurs
<b>(Byte, Short, Integer, Long, Float, Double, Boolean, Character)</b> qui sont tous des sous-classes de la classe abstraite <b>Number</b>.
<p>
<img src="${images}/number_classes.jpg" style="margin-left:20%;"/>
<p>
La conversion des types de donn�es primitifs en objet est appel� <b>boxing</b>, et cela est pris en charge par le compilateur. Vous avez juste besoin de passer la valeur du type de donn�es primitif au constructeur de la classe d�sir�e.
</p>
<h2 class="title">Exemple</h2>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> Test {

   <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> <span style='color:#7f0055; font-weight:bold; '>void</span> main(<span style='color:#7f0055; font-weight:bold; '>String</span> args[]) {
      <span style='color:#7f0055; font-weight:bold; '>Integer</span> x = <span style='color:#7f0055; font-weight:bold; '>new</span> <span style='color:#7f0055; font-weight:bold; '>Integer</span>(45);
      x =  x + 5;
      <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(x); 
   }
}
</pre>
<div class="nav">
 	<p><a href="java/primitifs">&lt; Pr�c�dent</a></p>
 	<p><a href="java/caracteres">Suivant &gt;</a></p>
</div>