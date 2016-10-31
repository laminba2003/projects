<h1>Boucle</h1>
<p>
Les boucles permettent de r�p�ter des actions simplement et rapidement. Voici les diff�rentes boucles fournies par JavaScript :
<p>
<h2 class="title">La boucle for</h2>
<p>
Une boucle <b>for</b> est une structure de contr�le de r�p�tition qui vous permet d'�crire efficacement une boucle qui doit s'ex�cuter un certain nombre de fois.
</p>
<pre style='color:#000000;background:#ffffff;'>
   <span style='color:#7f0055; font-weight:bold; '>var</span> nombres = [1, 2, 3, 4, 5,6,7,8,9,10];
   <span style='color:#7f0055; font-weight:bold; '>for</span>(<span style='color:#7f0055; font-weight:bold; '>var</span> i = 0 ; i &lt; nombres.length: i++){
      <span style='color:#7f0055; font-weight:bold; '>console</span>.log(nombres[i]);
   }
</pre>
<h2 class="title">La boucle while</h2>
<p>
 Une boucle <b>while</b> s'ex�cute de mani�re r�p�t�e tant qu'une condition donn�e est vraie.
</p>
<pre style='color:#000000;background:#ffffff;'>
   <span style='color:#7f0055; font-weight:bold; '>var</span> nombres = [10, 20, 30, 40, 50];
   <span style='color:#7f0055; font-weight:bold; '>var</span> i = 0;
   <span style='color:#7f0055; font-weight:bold; '>while</span>(i &lt; nombres.length){
      <span style='color:#7f0055; font-weight:bold; '>console</span>.log(nombres[i]);
      i++;
   }
</pre>
<h2 class="title">La boucle do...while</h2>
<p>
Une boucle <b>do...while</b> est semblable � une boucle <b>while</b>, sauf qu'elle est garantie de s'ex�cuter au moins une fois.
</p>
<pre style='color:#000000;background:#ffffff;'>
   <span style='color:#7f0055; font-weight:bold; '>var</span> nombres = [10, 20, 30, 40, 50];
   <span style='color:#7f0055; font-weight:bold; '>var</span> i = 0;
   <span style='color:#7f0055; font-weight:bold; '>do</span>{
      <span style='color:#7f0055; font-weight:bold; '>console</span>.log(nombres[i]);
      i++;
   }<span style='color:#7f0055; font-weight:bold; '>while</span>(i &lt; nombres.length);
</pre>
<h2 class="title">La boucle for...in</h2>
<p>
La boucle for...in permet d'it�rer sur l'ensemble des attributs �num�rables d'un objet.
</p>
<pre style='color:#000000;background:#ffffff;'>
<span style='color:#7f0055; font-weight:bold; '>for</span> (<span style='color:#7f0055; font-weight:bold; '>var</span> i <span style='color:#7f0055; font-weight:bold; '>in</span> personne) {
  console.<span style='color:#7f0055; font-weight:bold; '>log</span>(personne[i]);
}
</pre>
<h2 class="title">La boucle for...of</h2>
<p>
La boucle for...of fonctionne avec les objets it�rables et  et elle parcourt l'objet et les valeurs de ses diff�rentes propri�t�s.
</p>
<pre style='color:#000000;background:#ffffff;'>
<span style='color:#7f0055; font-weight:bold; '>let</span> arr = [3, 5, 7];
<span style='color:#7f0055; font-weight:bold; '>for</span> (<span style='color:#7f0055; font-weight:bold; '>let</span> i of arr) {
  console.<span style='color:#7f0055; font-weight:bold; '>log</span>(i); <span style='color:#3f7f59; '>// affiche "3", "5", "7" dans la console</span>
}
</pre>
<div class="nav">
 	<p><a href="javascript/tableau">&lt; Pr�c�dent</a></p>
 	<p><a href="javascript/decision">Suivant &gt;</a></p>
</div>