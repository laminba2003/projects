<h1>Premier Programme</h1>
<p>
L'inclusion du code <b>JavaScript</b> dans un document <b>HTML</b> est flexible et les moyens sont les suivants :
</p>
<h2 class="title">Inclusion direct dans le document <b>HTML</b> [head ou body]</h2>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>html</span><span style='color:#7f0055; '>></span>
   <span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>head</span><span style='color:#7f0055; '>></span>
      <span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>script</span> type=<span style='color:#2a00ff; '>"text/javascript"</span><span style='color:#7f0055; '>></span>
        
            <span style='color:#7f0055; font-weight:bold; '>function</span> sayHello() {
               <span style='color:#7f0055; font-weight:bold; '>alert</span>(<span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>Hello World</span><span style='color:#2a00ff; '>"</span>);
            }
         
      <span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>script</span><span style='color:#7f0055; '>></span> 
   <span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>head</span><span style='color:#7f0055; '>></span>
   <span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>body</span><span style='color:#7f0055; '>></span>
      <span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>input</span> type=<span style='color:#2a00ff; '>"button"</span> onclick=<span style='color:#2a00ff; '>"sayHello()"</span> value=<span style='color:#2a00ff; '>"Say Hello"</span> <span style='color:#7f0055; '>/></span>
   <span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>body</span><span style='color:#7f0055; '>></span>
<span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>html</span><span style='color:#7f0055; '>></span>
</pre>
<h2 class="title">Inclusion dans le document <b>HTML</b> [head ou body] via un fichier externe</h2>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>html</span><span style='color:#7f0055; '>></span>
   <span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>head</span><span style='color:#7f0055; '>></span>
      <span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>script</span> type=<span style='color:#2a00ff; '>"text/javascript"</span> src=<span style='color:#2a00ff; '>"app.js"</span> <span style='color:#7f0055; '>></span><span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>script</span><span style='color:#7f0055; '>></span>
   <span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>head</span><span style='color:#7f0055; '>></span>
   
   <span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>body</span><span style='color:#7f0055; '>></span>
      <span style='color:#7f0055; '>&lt;</span><span style='color:#7f0055; font-weight:bold; '>input</span> type=<span style='color:#2a00ff; '>"button"</span> onclick=<span style='color:#2a00ff; '>"sayHello()"</span> value=<span style='color:#2a00ff; '>"Say Hello"</span> <span style='color:#7f0055; '>/></span>
   <span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>body</span><span style='color:#7f0055; '>></span>
   
<span style='color:#7f0055; '>&lt;/</span><span style='color:#7f0055; font-weight:bold; '>html</span><span style='color:#7f0055; '>></span>
</pre>
<h2 class="title">app.js</h2>
<pre style='color:#000000;background:#ffffff;'>
   <span style='color:#7f0055; font-weight:bold; '>function</span> sayHello() {
      <span style='color:#7f0055; font-weight:bold; '>alert</span>(<span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>Hello World</span><span style='color:#2a00ff; '>"</span>);
    }
</pre>
<div class="nav">
 	<p><a href="javascript/bases">&lt; Précédent</a></p>
 	<p><a href="javascript/objet">Suivant &gt;</a></p>
</div>