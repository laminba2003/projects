<h1>CSS</h1>
<p>
<b>CSS (Cascading Style Sheets)</b> est un langage simple destin� � simplifier le processus
pour rendre une page web pr�sentable, en contr�lant la couleur du texte, le style des polices, l'espacement entre les paragraphes, 
comment les colonnes sont dimensionn�es et dispos�es, les images de fond, les variations de l'affichage pour les diff�rents appareils ainsi qu'une vari�t� d'autres effets.
</p>
<h2 class="title">Syntaxe</h2>
<p>
Un fichier <b>CSS</b> comprend des r�gles de style qui sont interpr�t�es par le navigateur, puis appliqu�es aux �l�ments correspondants dans votre document. Une r�gle de style est compos�e de trois parties :
</p>
<pre style='color:#000000;background:#ffffff;'>s�lecteur { propri�t� : valeur }
</pre>
<h2 class="title">Inclusion dans le document HTML</h2>
<p>
Il y'a trois fa�ons d'associer les styles � votre document <b>HTML</b>. Les m�thodes les plus couramment utilis�es sont les suivants :
</p>
<h2>Direct</h2>
<p>
Vous pouvez mettre vos r�gles directement dans le document en utilisant l'�l�ment <code>&lt;style&gt;</code> comme suit :
</p>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; '>&lt;!DOCTYPE html></span>
<span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>html</span><span style='color:#7f0055; '>></span>
   <span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>head</span><span style='color:#7f0055; '>></span>
   
      <span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>style</span><span style='color:#7f0055; '> type = "text/css" media = "all"></span>
         <span style='color:#7f0055; font-weight:bold; '>body</span> {
            <span style='color:#7f0055; font-weight:bold; '>background-color</span>: linen;
         }
         <span style='color:#7f0055; font-weight:bold; '>h1</span> {
            <span style='color:#7f0055; font-weight:bold; '>color</span>: maroon;
            <span style='color:#7f0055; font-weight:bold; '>margin-left</span>: 40px;
         }
      <span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>style</span><span style='color:#7f0055; '>></span>
      
   <span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>head</span><span style='color:#7f0055; '>></span>   
   <span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>body</span><span style='color:#7f0055; '>></span>
      <span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>h1</span><span style='color:#7f0055; '>></span>This is a heading<span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>h1</span><span style='color:#7f0055; '>></span>
      <span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>p</span><span style='color:#7f0055; '>></span>This is a paragraph.<span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>p</span><span style='color:#7f0055; '>></span>
   <span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>body</span><span style='color:#7f0055; '>></span>
<span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>html</span><span style='color:#7f0055; '>></span>
</pre>
<h2>Via un fichier externe</h2>
<p>
Les �l�ments <code>&lt;link&gt;</code> ou <code>@import</code> peuvent �tre utilis�s pour inclure un fichier de feuille de style externe dans votre document.
</p>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; '>&lt;!DOCTYPE html></span>
<span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>html</span><span style='color:#7f0055; '>></span>
   <span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>head</span><span style='color:#7f0055; '>></span>
    <span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>link</span> type = <span style='color:#2a00ff; '>"text/css"</span> href = <span style='color:#2a00ff; '>"app.css"</span> media = <span style='color:#2a00ff; '>" all"</span> <span style='color:#7f0055; '>/></span>
    @import "skin.css";
   <span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>head</span><span style='color:#7f0055; '>></span>
   <span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>body</span><span style='color:#7f0055; '>></span>
      <span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>h1</span><span style='color:#7f0055; '>></span>This is a heading<span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>h1</span><span style='color:#7f0055; '>></span>
      <span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>p</span><span style='color:#7f0055; '>></span>This is a paragraph.<span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>p</span><span style='color:#7f0055; '>></span>
   <span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>body</span><span style='color:#7f0055; '>></span>
<span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>html</span><span style='color:#7f0055; '>></span>
</pre>
<h2>Dans l'�l�ment</h2>
<p>
Vous pouvez utiliser l'attribut <code>style</code> pour d�finir des r�gles de style pour un �l�ment <b>HTML</b>. Ces r�gles seront appliqu�es � cet �l�ment seulement.
</p>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>html</span><span style='color:#7f0055; '>></span>
   <span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>head</span><span style='color:#7f0055; '>></span>
   <span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>head</span><span style='color:#7f0055; '>></span>
   <span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>body</span><span style='color:#7f0055; '>></span>
      <span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>h1</span> style = <span style='color:#2a00ff; '>"</span><span style='color:#7f0055; font-weight:bold; '>color</span>:#36C;<span style='color:#2a00ff; '>"</span><span style='color:#7f0055; '>></span> This is inline CSS <span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>h1</span><span style='color:#7f0055; '>></span>
   <span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>body</span><span style='color:#7f0055; '>></span>
<span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>html</span><span style='color:#7f0055; '>></span>
</pre>
<div class="nav">
 	<p><a href="web/html">&lt; Pr�c�dent</a></p>
 	<p><a href="web/json">Suivant &gt;</a></p>
</div>
