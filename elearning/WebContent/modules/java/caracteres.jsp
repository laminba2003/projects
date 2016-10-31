<h1>Caract�res</h1>
<p>
Normalement, lorsque nous travaillons avec les caract�res, nous utilisons le type primitif <b>char</b>.
<p>
<h2 class="title">Primitif</h2>
<pre style='color:#000000;background:#ffffff;'>
<span style='color:#7f0055; font-weight:bold; '>char</span> ch = <span style='color:#2a00ff; '>'a'</span>;
<span style='color:#7f0055; font-weight:bold; '>char</span> uniChar = <span style='color:#2a00ff; '>'\u039A'</span>;
</pre>
<p>
Cependant, nous pouvons aussi utiliser La classe <b>Character</b> qui offre un certain nombre de m�thodes utiles pour la manipulation des caract�res en cr�ant un objet avec le constructeur comme suit :
</p>
<h2 class="title">Objet</h2>
<pre style='color:#000000;background:#ffffff;'>
<span style='color:#7f0055; font-weight:bold; '>Character</span> ch = <span style='color:#7f0055; font-weight:bold; '>new</span> <span style='color:#7f0055; font-weight:bold; '>Character</span>(<span style='color:#2a00ff; '>'a'</span>);
</pre>
<h2 class="title">M�thodes</h2>
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
      <td>compareTo(<code>Character</code>)</td>
      <td>Compare deux caract�res num�riquements.</td>
    </tr>
     <tr>
      <td><code>static boolean</code></td>
      <td>isAlphabetic(<code>int</code>)</td>
      <td>D�termine si le caract�re sp�cifi� par son code Unicode est un alphabet.</td>
    </tr>
    <tr>
      <td><code>static boolean</code></td>
      <td>isLowerCase(<code>char</code>)</td>
      <td>D�termine si le caract�re sp�cifi� est en miniscule.</td>
    </tr>
    <tr>
      <td><code>static boolean</code></td>
      <td>isUpperCase(<code>char</code>)</td>
      <td>D�termine si le caract�re sp�cifi� est en majuscule.</td>
    </tr>
  </tbody>
</table>
<p>
Vous pouvez avoir une documentation exhaustive de la classe <b>Character</b> en consultant sa <b>JavaDoc</b> <a href="https://docs.oracle.com/javase/7/docs/api/java/lang/Character.html" target="_blank">ici</a>.
</p>

<div class="nav">
 	<p><a href="java/nombres">&lt; Pr�c�dent</a></p>
 	<p><a href="java/chaines">Suivant &gt;</a></p>
</div>