<h1>Classe</h1>
<p>
Une <b>classe</b> ou <b>type</b> est un mod�le pour la fabrication d'<b>objets</b>. On d�clare une classe en sp�cifiant le mot-cl� <b>class</b> suivi d'un identifiant non r�serv� comme nom, suivi d'une paire d'accolades <b>{}</b> pour d�limiter son corps. La syntaxe standard pour d�clarer une classe <b>Java</b> est la suivante :
</p>
<h2 class="title">Syntaxe</h2>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public class</span> identifiant {
   <span style='color:#3f7f59; '>// corps de la classe</span>
}
</pre>
<p>
Par convention, la premi�re lettre du nom d'une classe est en majuscule et les caract�res suivants sont en minuscules (par exemple, <b>Etudiant</b>). Si un nom est compos� de plusieurs mots, la premi�re lettre de chaque mot est en majuscule (par exemple <b>KitEtudiant</b>). Cette convention de nommage est appel� notation <b><a href="https://fr.wikipedia.org/wiki/CamelCase" target="_blank">Camel</a></b>.
</p>
<h2 class="title">Livre.java</h2>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>public class</span> Livre {
   <span style='color:#3f7f59; '>// corps de la classe</span>
}
</pre>
<p>
Le corps d'une classe est peupl� avec des attributs et des m�thodes qui sont ses membres. Cette combinaison est connue sous le nom d'<b>encapsulation</b>. Elle nous permet de programmer � un niveau plus �lev� d'abstraction en raisonnant en terme de classes plut�t que de mani�re proc�durale.
</p>
<h2 class="title">Attributs</h2>
<p>
Une classe mod�lise une entit� du monde r�el en terme d'�tats. Par exemple, une voiture a une couleur et une marque et un compte courant a une balance. L'�tat est stock� dans une variable ou attribut. Une d�claration d'attribut a la syntaxe suivante :
</p>
<pre style='color:#000000;background:#ffffff;'>Type identifiant [ = expression ] ;
</pre>
<h2 class="title">M�thodes</h2>
<p>
En plus de la mod�lisation de l'�tat d'une entit� r�elle, une classe mod�lise aussi ses comportements. Par exemple, une voiture peut rouler ou freiner et un compte courant prend en charge les d�p�ts et les retraits. Une d�claration de m�thode a la syntaxe suivante :
</p>
<pre style='color:#000000;background:#ffffff;'>TypeDeRetour identifiant ( [liste de param�tres] )
{
   <span style='color:#3f7f59; '>// corps de la m�thode</span>
}
</pre>
<h2 class="title">Constructeurs</h2>
<p>
En plus d'attribuer explicitement des valeurs aux attributs, une classe peut d�clarer un ou plusieurs blocs de code pour l'initialisation d'objets. Chaque bloc de code est un constructeur. Sa d�claration se compose d'un en-t�te suivi d'un corps d�limit�. L'en-t�te se compose du nom de la classe suivi d'une liste de param�tres optionnels :
</p>
<pre style='color:#000000;background:#ffffff;'>NomClasse ( [liste de param�tres] )
{
   <span style='color:#3f7f59; '>// corps de la m�thode</span>
}
</pre>
<h2 class="title">Exemple</h2>
<p>
Dans cet exemple ci-dessous, nous d�clarons la Classe <b>Auteur</b> avec les attributs nom et pr�nom et la Classe
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
   
</div>	<h2 class="title">Les niveaux d'acc�s</h2>
<p>
 Un niveau d'acc�s est un indicateur de qui peut acc�der � un attribut et une m�thode. <b>Java</b> prend en charge quatre niveaux d'acc�s : public, priv�, prot�g� et package (d�faut) et il fournit trois mots-cl�s qui correspondent aux trois premiers niveaux d'acc�s :
 </p>
 <ul>
    <li><b>public :</b> Tout code d'une classe peut acc�der au membre.</li>
 	<li> <b>private :</b> Seul le code de la classe peut acc�der au membre.</li>
     <li> <b>protected :</b> Seul le code de la classe et de ses sous-classes peuvent acc�der au membre</li>
 </ul>
<h2 class="title">Les modificateurs</h2>
<ul>
   <li><b>static :</b> Il est utilis� pour la gestion de la m�moire principalement. Nous pouvons l'appliquer � des attributs, des m�thodes, des blocs de code et des classes imbriqu�es (anonymes).</li>
   <li><b>final :</b> Il est utilis� pour limiter l'utilisateur. Nous pouvons l'appliquer � des attributs, des m�thodes et classes.</li>
   <li><b>abstract :</b> Il permet � une classe de ne pouvoir cr�er d'objets et � une m�thode d'�tre cr��e sans impl�mentation.</li>
   <li><b>extends :</b> Il permet � une classe d'h�riter d'une autre ou � une interface d'h�riter d'une autre.</li>
   <li><b>implements :</b> Il permet � une classe d'impl�menter une ou plusieurs interfaces.</li>
</ul>
<div class="nav">
 	<p><a href="java/programme">&lt; Pr�c�dent</a></p>
 	<p><a href="java/objet">Suivant &gt;</a></p>
</div>