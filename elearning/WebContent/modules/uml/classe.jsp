<h1>Classe</h1>
<p>
Le <b>diagramme de classes</b> est l'un des diagrammes les plus fondamentaux de <b>UML</b>. Il est utilisé pour
capturer les relations statiques de votre système, en d'autres termes, comment les choses sont mises ensemble
en présentant les classes et les interfaces des systèmes ainsi que les différentes relations entre celles-ci.
</p>
<h2 class="title">Classe</h2>
<p>Une classe est représentée par un rectangle séparée en trois parties :</p>
<ul>
  <li>la première partie contient le nom de la classe écrit en romain</li>
  <li>la seconde contient les attributs de la classe</li>
  <li>la dernière contient les méthodes de la classe</li>
</ul>
<img src="${images}/classe.png" style="margin-left:50px"/>
<h2 class="title">Classe abstraite</h2>
<p>Le nom des classes abstraites est écrit en italique</p>
<img src="${images}/classe_abstraite.png" style="margin-left:50px"/>
<h2 class="title">Classe générique</h2>
<p>Les classes génériques ont, dans leur angle supérieur droit, un rectangle dont la bordure est en pointillé et qui contient les types des paramètres.</p>
<img src="${images}/classe_generique.png" style="margin-left:50px"/>
<h2 class="title">Attributs et Méthodes</h2>
<p>
La notion de visibilité indique qui peut avoir accès à un membre d'une classe. Elle ne peut prendre que 4 valeurs :
</p>
<table>
<tbody><tr>
<th>Caractère</th>
<th>Mot clé</th>
<th>Description</th>
</tr>
<tr>
<td>+</td>
<td>public</td>
<td>Toutes les autres classes ont accès au membre.</td>
</tr>
<tr>
<td>#</td>
<td>protected</td>
<td>Seules la classe elle-même et ses sous-classes (héritage) ont accès au membre.</td>
</tr>
<tr>
<td>~</td>
<td>package</td>
<td>membre visible uniquement dans le package.</td>
</tr>
<tr>
<td>-</td>
<td>private</td>
<td>Seule la classe elle-même a accès à ce membre.</td>
</tr>
</tbody></table>
<h2 class="title">Héritage</h2>
<p>
L'héritage est un principe de division par généralisation et spécialisation, représenté par un trait reliant les deux classes et dont l'origine (classe mère) se distingue de l'autre extrémité (classe fille) par un triangle.
</p>
<img src="${images}/heritage.png" style="margin-left:50px"/>
<h2 class="title">Association</h2>
<p>
L'association est une connexion sémantique entre deux classes (relation logique). Une association peut être nommée. L'invocation d'une méthode est une association.
</p>
<img src="${images}/association.jpg" style="margin-left:50px"/>
<h2 class="title">Agrégation</h2>
<p>
L'agrégation est une association avec relation de subordination, représentée par un trait reliant les deux classes et dont l'origine se distingue de l'autre extrémité (la classe subordonnée) par un losange vide.
</p>
<img src="${images}/aggregation.jpg" style="margin-left:50px"/>
<h2 class="title">Composition</h2>
<p>
La composition est une agrégation avec cycle de vie dépendant : la classe composée est détruite lorsque la classe mère disparait.
</p>
<img src="${images}/composition.jpg" style="margin-left:50px"/>
<h2 class="title">Dépendance</h2>
<p>
La dépendance implique qu'une ou plusieurs méthodes reçoivent un objet d'une autre classe.
</p>
<img src="${images}/dependance.jpg" style="margin-left:50px"/>
<div class="nav">
 	<p><a href="uml/cas">&lt; Précédent</a></p>
 	<p><a href="uml/package">Suivant &gt;</a></p>
</div>
