<h1>Classe</h1>
<p>
Une <b>classe</b> ou <b>type</b> est un modèle pour la fabrication d'<b>objets</b>. On déclare une classe en spécifiant le mot-clé <b>class</b> suivi d'un identifiant non réservé comme nom, suivi d'une paire d'accolades <b>{}</b> pour délimiter son corps. La syntaxe standard pour déclarer une classe <b>Java</b> est la suivante :
</p>
<h2 class="title">Syntaxe</h2>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public class</span> identifiant {
   <span style='color:#3f7f59; '>// corps de la classe</span>
}
</pre>
<p>
Par convention, la première lettre du nom d'une classe est en majuscule et les caractères suivants sont en minuscules (par exemple, <b>Etudiant</b>). Si un nom est composé de plusieurs mots, la première lettre de chaque mot est en majuscule (par exemple <b>KitEtudiant</b>). Cette convention de nommage est appelé notation <b><a href="https://fr.wikipedia.org/wiki/CamelCase" target="_blank">Camel</a></b>.
</p>
<h2 class="title">Livre.java</h2>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public class</span> Livre {
   <span style='color:#3f7f59; '>// corps de la classe</span>
}
</pre>
<p>
Le corps d'une classe est peuplé avec des attributs et des méthodes qui sont ses membres. Cette combinaison est connue sous le nom d'<b>encapsulation</b>. Elle nous permet de programmer à un niveau plus élevé d'abstraction en raisonnant en terme de classes plutôt que de maniére procédurale.
</p>
<h2 class="title">Attributs</h2>
<p>
Une classe modèlise une entité du monde réel en terme d'états. Par exemple, une voiture a une couleur et une marque et un compte courant a une balance. L'état est stocké dans une variable ou attribut. Une déclaration d'attribut a la syntaxe suivante :
</p>
<pre style='color:#000000;background:#ffffff;'>Type identifiant [ = expression ] ;
</pre>
<h2 class="title">Méthodes</h2>
<p>
En plus de la modélisation de l'état d'une entité réelle, une classe modèlise aussi ses comportements. Par exemple, une voiture peut rouler ou freiner et un compte courant prend en charge les dépôts et les retraits. Une déclaration de méthode a la syntaxe suivante :
</p>
<pre style='color:#000000;background:#ffffff;'>TypeDeRetour identifiant ( [liste de paramètres] )
{
   <span style='color:#3f7f59; '>// corps de la méthode</span>
}
</pre>
<h2 class="title">Constructeurs</h2>
<p>
En plus d'attribuer explicitement des valeurs aux attributs, une classe peut déclarer un ou plusieurs blocs de code pour l'initialisation d'objets. Chaque bloc de code est un constructeur. Sa déclaration se compose d'un en-tête suivi d'un corps délimité. L'en-tête se compose du nom de la classe suivi d'une liste de paramètres optionnels :
</p>
<pre style='color:#000000;background:#ffffff;'>NomClasse ( [liste de paramètres] )
{
   <span style='color:#3f7f59; '>// corps de la méthode</span>
}
</pre>
<h2 class="title">Exemple</h2>
<p>
Dans cet exemple ci-dessous, nous déclarons la Classe <b>Auteur</b> avec les attributs nom et prénom et la Classe
<b>Livre</b> avec les attributs titre et auteur.
</p>
<ul class="tabs"> 
      <li class="active" rel="author"><h2>Auteur.java</h2></li>
      <li rel="livre"><h2>Livre.java</h2></li>
</ul>
<div class="tab_container"> 
 <div id="author" class="tab_content">   
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> Auteur {
   <span style='color:#7f0055; font-weight:bold; '>private</span> <span style='color:#7f0055; font-weight:bold; '>String</span> prenom;
   <span style='color:#7f0055; font-weight:bold; '>private</span> <span style='color:#7f0055; font-weight:bold; '>String</span> nom;
   
   <span style='color:#7f0055; font-weight:bold; '>public</span> Auteur() {
   }
   <span style='color:#7f0055; font-weight:bold; '>public</span> Auteur(<span style='color:#7f0055; font-weight:bold; '>String</span> prenom,<span style='color:#7f0055; font-weight:bold; '>String</span> nom) {
       <span style='color:#7f0055; font-weight:bold; '>this</span>.prenom = prenom;
       <span style='color:#7f0055; font-weight:bold; '>this</span>.nom = nom;
   }
   <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>String</span> getPrenom() {
      <span style='color:#7f0055; font-weight:bold; '>return</span> prenom;
   }
   <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> setPrenom(<span style='color:#7f0055; font-weight:bold; '>String</span> prenom) {
      <span style='color:#7f0055; font-weight:bold; '>this</span>.prenom = prenom;
   }

   <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>String</span> getNom() {
     <span style='color:#7f0055; font-weight:bold; '>return</span> nom;
   }
   <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> setNom(<span style='color:#7f0055; font-weight:bold; '>String</span> nom) {
      <span style='color:#7f0055; font-weight:bold; '>this</span>.nom = nom;
   }

}
</pre>
   </div>
   
    <div id="livre" class="tab_content">
     <pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> Livre {
   <span style='color:#7f0055; font-weight:bold; '>private</span> <span style='color:#7f0055; font-weight:bold; '>String</span> titre;
   <span style='color:#7f0055; font-weight:bold; '>private</span> Auteur auteur;
   
   <span style='color:#7f0055; font-weight:bold; '>public</span> Livre() {
   }
   <span style='color:#7f0055; font-weight:bold; '>public</span> Livre(<span style='color:#7f0055; font-weight:bold; '>String</span> title,Auteur auteur) {
       <span style='color:#7f0055; font-weight:bold; '>this</span>.title = title;
       <span style='color:#7f0055; font-weight:bold; '>this</span>.auteur = auteur;
   }
   <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>String</span> getTitre() {
      <span style='color:#7f0055; font-weight:bold; '>return</span> titre;
   }
   <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> setTitre(<span style='color:#7f0055; font-weight:bold; '>String</span> titre) {
      <span style='color:#7f0055; font-weight:bold; '>this</span>.titre = titre;
   }

   <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>String</span> getAuteur() {
     <span style='color:#7f0055; font-weight:bold; '>return</span> auteur;
   }
   <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> setAuteur(Auteur auteur) {
      <span style='color:#7f0055; font-weight:bold; '>this</span>.auteur = auteur;
   }

}
</pre>
    </div>
   
</div>	<h2 class="title">Les niveaux d'accès</h2>
<p>
 Un niveau d'accès est un indicateur de qui peut accéder à un attribut et une méthode. <b>Java</b> prend en charge quatre niveaux d'accès : public, privé, protégé et package (défaut) et il fournit trois mots-clés qui correspondent aux trois premiers niveaux d'accès :
 </p>
 <ul>
    <li><b>public :</b> Tout code d'une classe peut accéder au membre.</li>
 	<li> <b>private :</b> Seul le code de la classe peut accéder au membre.</li>
     <li> <b>protected :</b> Seul le code de la classe et de ses sous-classes peuvent accéder au membre</li>
 </ul>
<h2 class="title">Les modificateurs</h2>
<ul>
   <li><b>static :</b> Il est utilisé pour la gestion de la mémoire principalement. Nous pouvons l'appliquer à des attributs, des méthodes, des blocs de code et des classes imbriquées (anonymes).</li>
   <li><b>final :</b> Il est utilisé pour limiter l'utilisateur. Nous pouvons l'appliquer à des attributs, des méthodes et classes.</li>
   <li><b>abstract :</b> Il permet à une classe de ne pouvoir créer d'objets et à une méthode d'être créée sans implémentation.</li>
   <li><b>extends :</b> Il permet à une classe d'hériter d'une autre ou à une interface d'hériter d'une autre.</li>
   <li><b>implements :</b> Il permet à une classe d'implémenter une ou plusieurs interfaces.</li>
</ul>
<div class="nav">
 	<p><a href="java/programme">&lt; Précédent</a></p>
 	<p><a href="java/objet">Suivant &gt;</a></p>
</div>