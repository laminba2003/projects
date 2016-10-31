<h1>Introduction</h1>
<p>
<b>Node</b> ou <b>Node.js</b> d�velopp�e par <b>Ryan Dahl</b> en 2009, est une plate-forme c�t� serveur open source construite sur le moteur <b>JavaScript</b> de <b>Google Chrome</b>. Les applications <b>Node</b> sont �crites en <b>JavaScript</b> et peuvent �tre ex�cut�es sur <b>OS X</b>, <b>Microsoft Windows</b> et <b>Linux</b>.
Elle utilise un mod�le I/O �v�nementiel et non-bloquant qui la rend l�gere et efficace pour les applications en temps r�el.
Elle fournit �galement une riche biblioth�que de modules qui simplifie le d�veloppement d'applications web dans une large mesure.
<b>Node</b> se r�v�le donc �tre une technologie parfaite pour : 
</p>
	<ul>
      <li> Les applications I/O </li>
      <li>Le streaming</li>
      <li>Les applications bas�es sur JSON</li>
      <li>Les applications web � une seule page</li> 
     </ul>


<h2 class="title">Syntaxe</h2>
<pre style='color:#000020;background:#f6f8ff;'><span style='color:#595979; '>// charge le module http pour cr�er un serveur http.</span>
<span style='color:#200080; font-weight:bold; '>var</span> http <span style='color:#308080; '>=</span> require<span style='color:#308080; '>(</span><span style='color:#800000; '>'</span><span style='color:#1060b6; '>http</span><span style='color:#800000; '>'</span><span style='color:#308080; '>)</span><span style='color:#406080; '>;</span>

<span style='color:#595979; '>// Configure le serveur HTTP avec un message Hello World pour tous les utilisateurs.</span>
<span style='color:#200080; font-weight:bold; '>var</span> server <span style='color:#308080; '>=</span> http<span style='color:#308080; '>.</span>createServer<span style='color:#308080; '>(</span><span style='color:#200080; font-weight:bold; '>function</span> <span style='color:#308080; '>(</span>request<span style='color:#308080; '>,</span> response<span style='color:#308080; '>)</span> <span style='color:#406080; '>{</span>
  response<span style='color:#308080; '>.</span>writeHead<span style='color:#308080; '>(</span><span style='color:#008c00; '>200</span><span style='color:#308080; '>,</span> <span style='color:#406080; '>{</span><span style='color:#800000; '>"</span><span style='color:#1060b6; '>Content-Type</span><span style='color:#800000; '>"</span><span style='color:#406080; '>:</span> <span style='color:#800000; '>"</span><span style='color:#1060b6; '>text/plain</span><span style='color:#800000; '>"</span><span style='color:#406080; '>}</span><span style='color:#308080; '>)</span><span style='color:#406080; '>;</span>
  response<span style='color:#308080; '>.</span>end<span style='color:#308080; '>(</span><span style='color:#800000; '>"</span><span style='color:#1060b6; '>Hello World</span><span style='color:#0f69ff; '>\n</span><span style='color:#800000; '>"</span><span style='color:#308080; '>)</span><span style='color:#406080; '>;</span>
<span style='color:#406080; '>}</span><span style='color:#308080; '>)</span><span style='color:#406080; '>;</span>

<span style='color:#595979; '>// le serveur �coute sur le port 80 avec comme adresse par d�fault : 127.0.0.1</span>
server<span style='color:#308080; '>.</span>listen<span style='color:#308080; '>(</span><span style='color:#008c00; '>80</span><span style='color:#308080; '>)</span><span style='color:#406080; '>;</span>

<span style='color:#595979; '>// Affiche un message de d�marrage</span>
console<span style='color:#308080; '>.</span><span style='color:#200080; font-weight:bold; '>log</span><span style='color:#308080; '>(</span><span style='color:#800000; '>"</span><span style='color:#1060b6; '>le serveur est d�marr� sur : http://localhost/</span><span style='color:#800000; '>"</span><span style='color:#308080; '>)</span><span style='color:#406080; '>;</span>
</pre>
<div class="nav">
 	<p><a href="javascript">&lt; Pr�c�dent</a></p>
 	<p><a >Suivant &gt;</a></p>
</div>