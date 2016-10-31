<h1>Introduction</h1>
<p>
<b>Node</b> ou <b>Node.js</b> développée par <b>Ryan Dahl</b> en 2009, est une plate-forme côté serveur open source construite sur le moteur <b>JavaScript</b> de <b>Google Chrome</b>. Les applications <b>Node</b> sont écrites en <b>JavaScript</b> et peuvent être exécutées sur <b>OS X</b>, <b>Microsoft Windows</b> et <b>Linux</b>.
Elle utilise un modèle I/O événementiel et non-bloquant qui la rend légere et efficace pour les applications en temps réel.
Elle fournit également une riche bibliothèque de modules qui simplifie le développement d'applications web dans une large mesure.
<b>Node</b> se révèle donc être une technologie parfaite pour : 
</p>
	<ul>
      <li> Les applications I/O </li>
      <li>Le streaming</li>
      <li>Les applications basées sur JSON</li>
      <li>Les applications web à une seule page</li> 
     </ul>


<h2 class="title">Syntaxe</h2>
<pre style='color:#000020;background:#f6f8ff;'><span style='color:#595979; '>// charge le module http pour créer un serveur http.</span>
<span style='color:#200080; font-weight:bold; '>var</span> http <span style='color:#308080; '>=</span> require<span style='color:#308080; '>(</span><span style='color:#800000; '>'</span><span style='color:#1060b6; '>http</span><span style='color:#800000; '>'</span><span style='color:#308080; '>)</span><span style='color:#406080; '>;</span>

<span style='color:#595979; '>// Configure le serveur HTTP avec un message Hello World pour tous les utilisateurs.</span>
<span style='color:#200080; font-weight:bold; '>var</span> server <span style='color:#308080; '>=</span> http<span style='color:#308080; '>.</span>createServer<span style='color:#308080; '>(</span><span style='color:#200080; font-weight:bold; '>function</span> <span style='color:#308080; '>(</span>request<span style='color:#308080; '>,</span> response<span style='color:#308080; '>)</span> <span style='color:#406080; '>{</span>
  response<span style='color:#308080; '>.</span>writeHead<span style='color:#308080; '>(</span><span style='color:#008c00; '>200</span><span style='color:#308080; '>,</span> <span style='color:#406080; '>{</span><span style='color:#800000; '>"</span><span style='color:#1060b6; '>Content-Type</span><span style='color:#800000; '>"</span><span style='color:#406080; '>:</span> <span style='color:#800000; '>"</span><span style='color:#1060b6; '>text/plain</span><span style='color:#800000; '>"</span><span style='color:#406080; '>}</span><span style='color:#308080; '>)</span><span style='color:#406080; '>;</span>
  response<span style='color:#308080; '>.</span>end<span style='color:#308080; '>(</span><span style='color:#800000; '>"</span><span style='color:#1060b6; '>Hello World</span><span style='color:#0f69ff; '>\n</span><span style='color:#800000; '>"</span><span style='color:#308080; '>)</span><span style='color:#406080; '>;</span>
<span style='color:#406080; '>}</span><span style='color:#308080; '>)</span><span style='color:#406080; '>;</span>

<span style='color:#595979; '>// le serveur écoute sur le port 80 avec comme adresse par défault : 127.0.0.1</span>
server<span style='color:#308080; '>.</span>listen<span style='color:#308080; '>(</span><span style='color:#008c00; '>80</span><span style='color:#308080; '>)</span><span style='color:#406080; '>;</span>

<span style='color:#595979; '>// Affiche un message de démarrage</span>
console<span style='color:#308080; '>.</span><span style='color:#200080; font-weight:bold; '>log</span><span style='color:#308080; '>(</span><span style='color:#800000; '>"</span><span style='color:#1060b6; '>le serveur est démarré sur : http://localhost/</span><span style='color:#800000; '>"</span><span style='color:#308080; '>)</span><span style='color:#406080; '>;</span>
</pre>
<div class="nav">
 	<p><a href="javascript">&lt; Précédent</a></p>
 	<p><a >Suivant &gt;</a></p>
</div>