<h1>Chaînes</h1>
<p>
les chaînes qui sont largement utilisées dans la programmation sont une séquence de caractères et dans le langage de programmation <b>Java</b>, elles sont des objets. La plate-forme <b>Java</b> fournit la classe <b>String</b> pour créer et manipuler des chaînes. Le moyen le plus direct pour créer une chaîne est le suivant :
<p>
<h2 class="title">Syntaxe</h2>
<pre style='color:#000000;background:#ffffff;'>
<span style='color:#7f0055; font-weight:bold; '>String</span> message = <span style='color:#2a00ff; '>"Hello!"</span>;
</pre>
<p>
Comme pour tout autre objet, vous pouvez créer des objets <b>String</b> en utilisant un constructeur. La classe <b>String</b> a onze constructeurs qui vous permettent de fournir la valeur initiale de la chaîne en utilisant différentes sources de données, comme un tableau de caractères par exemple.
</p>
<h2 class="title">Exemple</h2>
<pre style='color:#000000;background:#ffffff;'>
 <span style='color:#7f0055; font-weight:bold; '>char</span>[] tableau = { <span style='color:#2a00ff; '>'H'</span>, <span style='color:#2a00ff; '>'e'</span>, <span style='color:#2a00ff; '>'l'</span>, <span style='color:#2a00ff; '>'l'</span>, <span style='color:#2a00ff; '>'o'</span>, <span style='color:#2a00ff; '>'!'</span>};
 <span style='color:#7f0055; font-weight:bold; '>String</span> chaine = <span style='color:#7f0055; font-weight:bold; '>new</span> <span style='color:#7f0055; font-weight:bold; '>String</span>(tableau);  
 <span style='color:#7f0055; font-weight:bold; '>System</span>.out.pr<code>int</code>ln(chaine);
</pre>
<p>
<b>Remarque: </b> La classe <b>String</b> est immuable, de sorte qu'une fois qu'il est créé, un objet <b>String</b> ne peut plus changer de valeur.
</p>
<h2 class="title">Méthodes</h2>
<table>
  <thead>
   <tr>
    <th>Type de retour</th>
    <th>Nom</th>
    <th>Desription</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>int</code></td>
      <td>indexOf(<code>String</code>)</td>
      <td>renvoie l'index de la première occurrence de la chaîne spécifiée.</td>
    </tr>
    <tr>
      <td><code>int</code></td>
      <td>length()</td>
      <td>renvoie la longueur de la chaîne.</td>
    </tr>
    <tr>
      <td><code>boolean</code></td>
      <td>startsWith<code>String</code>)</td>
      <td>teste si cette chaîne commence par le préfixe spécifié.</td>
    </tr>
    <tr>
      <td><code>boolean</code></td>
      <td>endsWith(<code>String</code>)</td>
      <td>teste si la chaîne se termine par le suffixe spécifié.</td>
    </tr>
   
  </tbody>
</table>
<p>
Vous pouvez avoir une documentation exhaustive de la classe <b>String</b> en consultant sa <b>JavaDoc</b> <a href="https://docs.oracle.com/javase/7/docs/api/java/lang/String.html" target="_blank">ici</a>.
</p>
<div class="nav">
 	<p><a href="java/caracteres">&lt; Précédent</a></p>
 	<p><a href="java/tableau">Suivant &gt;</a></p>
</div>