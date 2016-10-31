<h1>Classe</h1>
<p>
Le <b>diagramme de classes</b> est l'un des diagrammes les plus fondamentaux de <b>UML</b>. Il est utilis� pour
capturer les relations statiques de votre syst�me, en d'autres termes, comment les choses sont mises ensemble
en pr�sentant les classes et les interfaces des syst�mes ainsi que les diff�rentes relations entre celles-ci.
</p>
<h2 class="title">Classe</h2>
<p>Une classe est repr�sent�e par un rectangle s�par�e en trois parties :</p>
<ul>
  <li>la premi�re partie contient le nom de la classe �crit en romain</li>
  <li>la seconde contient les attributs de la classe</li>
  <li>la derni�re contient les m�thodes de la classe</li>
</ul>
<img src="${images}/classe.png" style="margin-left:50px"/>
<h2 class="title">Classe abstraite</h2>
<p>Le nom des classes abstraites est �crit en italique</p>
<img src="${images}/classe_abstraite.png" style="margin-left:50px"/>
<h2 class="title">Classe g�n�rique</h2>
<p>Les classes g�n�riques ont, dans leur angle sup�rieur droit, un rectangle dont la bordure est en pointill� et qui contient les types des param�tres.</p>
<img src="${images}/classe_generique.png" style="margin-left:50px"/>
<h2 class="title">Attributs et M�thodes</h2>
<p>
La notion de visibilit� indique qui peut avoir acc�s � un membre d'une classe. Elle ne peut prendre que 4 valeurs :
</p>
<table>
<tbody><tr>
<th>Caract�re</th>
<th>Mot cl�</th>
<th>Description</th>
</tr>
<tr>
<td>+</td>
<td>public</td>
<td>Toutes les autres classes ont acc�s au membre.</td>
</tr>
<tr>
<td>#</td>
<td>protected</td>
<td>Seules la classe elle-m�me et ses sous-classes (h�ritage) ont acc�s au membre.</td>
</tr>
<tr>
<td>~</td>
<td>package</td>
<td>membre visible uniquement dans le package.</td>
</tr>
<tr>
<td>-</td>
<td>private</td>
<td>Seule la classe elle-m�me a acc�s � ce membre.</td>
</tr>
</tbody></table>
<h2 class="title">H�ritage</h2>
<p>
L'h�ritage est un principe de division par g�n�ralisation et sp�cialisation, repr�sent� par un trait reliant les deux classes et dont l'origine (classe m�re) se distingue de l'autre extr�mit� (classe fille) par un triangle.
</p>
<img src="${images}/heritage.png" style="margin-left:50px"/>
<h2 class="title">Association</h2>
<p>
L'association est une connexion s�mantique entre deux classes (relation logique). Une association peut �tre nomm�e. L'invocation d'une m�thode est une association.
</p>
<img src="${images}/association.jpg" style="margin-left:50px"/>
<h2 class="title">Agr�gation</h2>
<p>
L'agr�gation est une association avec relation de subordination, repr�sent�e par un trait reliant les deux classes et dont l'origine se distingue de l'autre extr�mit� (la classe subordonn�e) par un losange vide.
</p>
<img src="${images}/aggregation.jpg" style="margin-left:50px"/>
<h2 class="title">Composition</h2>
<p>
La composition est une agr�gation avec cycle de vie d�pendant : la classe compos�e est d�truite lorsque la classe m�re disparait.
</p>
<img src="${images}/composition.jpg" style="margin-left:50px"/>
<h2 class="title">D�pendance</h2>
<p>
La d�pendance implique qu'une ou plusieurs m�thodes re�oivent un objet d'une autre classe.
</p>
<img src="${images}/dependance.jpg" style="margin-left:50px"/>
<div class="nav">
 	<p><a href="uml/cas">&lt; Pr�c�dent</a></p>
 	<p><a href="uml/package">Suivant &gt;</a></p>
</div>
