<h1>CSS</h1>
<p>
<b>CSS (Cascading Style Sheets)</b> est un langage simple destiné à simplifier le processus
pour rendre une page web présentable, en contrôlant la couleur du texte, le style des polices, l'espacement entre les paragraphes, 
comment les colonnes sont dimensionnées et disposées, les images de fond, les variations de l'affichage pour les différents appareils ainsi qu'une variété d'autres effets.
</p>
<h2 class="title">Syntaxe</h2>
<p>
Un fichier <b>CSS</b> comprend des règles de style qui sont interprétées par le navigateur, puis appliquées aux éléments correspondants dans votre document. Une règle de style est composée de trois parties :
</p>
<pre style='color:#000000;background:#ffffff;'>sélecteur { propriété : valeur }
</pre>
<h2 class="title">Inclusion dans le document HTML</h2>
<p>
Il y'a trois façons d'associer les styles à votre document <b>HTML</b>. Les méthodes les plus couramment utilisées sont les suivants :
</p>
<h2>Direct</h2>
<p>
Vous pouvez mettre vos règles directement dans le document en utilisant l'élément <code>&lt;style&gt;</code> comme suit :
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
Les éléments <code>&lt;link&gt;</code> ou <code>@import</code> peuvent être utilisés pour inclure un fichier de feuille de style externe dans votre document.
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
<h2>Dans l'élément</h2>
<p>
Vous pouvez utiliser l'attribut <code>style</code> pour définir des règles de style pour un élément <b>HTML</b>. Ces règles seront appliquées à cet élément seulement.
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
 	<p><a href="web/html">&lt; Précédent</a></p>
 	<p><a href="web/json">Suivant &gt;</a></p>
</div>
