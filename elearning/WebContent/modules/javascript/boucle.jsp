<h1>Boucle</h1>
<p>
Les boucles permettent de répéter des actions simplement et rapidement. Voici les différentes boucles fournies par JavaScript :
<p>
<h2 class="title">La boucle for</h2>
<p>
Une boucle <b>for</b> est une structure de contrôle de répétition qui vous permet d'écrire efficacement une boucle qui doit s'exécuter un certain nombre de fois.
</p>
<pre style='color:#000000;background:#ffffff;'>
   <span style='color:#7f0055; font-weight:bold; '>var</span> nombres = [1, 2, 3, 4, 5,6,7,8,9,10];
   <span style='color:#7f0055; font-weight:bold; '>for</span>(<span style='color:#7f0055; font-weight:bold; '>var</span> i = 0 ; i &lt; nombres.length: i++){
      <span style='color:#7f0055; font-weight:bold; '>console</span>.log(nombres[i]);
   }
</pre>
<h2 class="title">La boucle while</h2>
<p>
 Une boucle <b>while</b> s'exécute de manière répétée tant qu'une condition donnée est vraie.
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
Une boucle <b>do...while</b> est semblable à une boucle <b>while</b>, sauf qu'elle est garantie de s'exécuter au moins une fois.
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
La boucle for...in permet d'itérer sur l'ensemble des attributs énumérables d'un objet.
</p>
<pre style='color:#000000;background:#ffffff;'>
<span style='color:#7f0055; font-weight:bold; '>for</span> (<span style='color:#7f0055; font-weight:bold; '>var</span> i <span style='color:#7f0055; font-weight:bold; '>in</span> personne) {
  console.<span style='color:#7f0055; font-weight:bold; '>log</span>(personne[i]);
}
</pre>
<h2 class="title">La boucle for...of</h2>
<p>
La boucle for...of fonctionne avec les objets itérables et  et elle parcourt l'objet et les valeurs de ses différentes propriétés.
</p>
<pre style='color:#000000;background:#ffffff;'>
<span style='color:#7f0055; font-weight:bold; '>let</span> arr = [3, 5, 7];
<span style='color:#7f0055; font-weight:bold; '>for</span> (<span style='color:#7f0055; font-weight:bold; '>let</span> i of arr) {
  console.<span style='color:#7f0055; font-weight:bold; '>log</span>(i); <span style='color:#3f7f59; '>// affiche "3", "5", "7" dans la console</span>
}
</pre>
<div class="nav">
 	<p><a href="javascript/tableau">&lt; Précédent</a></p>
 	<p><a href="javascript/decision">Suivant &gt;</a></p>
</div>