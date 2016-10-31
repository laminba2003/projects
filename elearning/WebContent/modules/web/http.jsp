<h1>HTTP</h1>
<p>
<b>HTTP (Hypertext Transfer Protocol)</b> permet la communication entre une variété d'hôtes et de clients, et prend en charge un mélange de configurations réseaux qui le rendent sans état. La communication se déroule généralement sur <b>TCP/IP</b> et le port par défaut est <b>80</b>.
La communication entre un hôte et un client se produit par l'intermédiaire d'une paire <b>demande/réponse</b>. Le client lance un message de requête qui est desservi par un message de réponse en retour.
</p>
<img src="${images}/http_request_response.png" style="margin-left:50px"/>
<h2 class="title">URLS</h2>
<p>
les messages de demande sont au centre de la communication web et ils sont envoyés vers des adresses ou <b>URLS (Uniform Resource Locators)</b>. 
</p>
<img src="${images}/http_url_structure.png" style="margin-left:10px"/>
<h2 class="title">Méthodes</h2>
<p>
les <b>URLS</b> révèlent l'identité de l'hôte avec lequel nous voulons communiquer, mais l'action qui doit être effectuée sur l'hôte est spécifiée via des méthodes.
</p>
<ul>
  <li><b>GET :</b> récupére une ressource existante</li>
  <li><b>POST :</b> crée une nouvelle ressource</li>
  <li><b>PUT :</b> modifie une ressource existante</li>
  <li><b>DELETE :</b> supprime une ressource existante</li> 
  <li><b>HEAD :</b> récupére les en-têtes serveur pour une ressource particulière</li>
  <li><b>TRACE :</b> récupére les informations de suivi d'une requête</li>
  <li><b>OPTIONS :</b> récupére les informations sur les capacités de serveur</li>
</ul>
<h2 class="title">Codes d'état</h2>
<p>
Avec les <b>URLS</b> et les <b>Méthodes</b>, le client peut lancer des requêtes vers le serveur. En retour, le serveur répond avec des codes d'état et des messages de réponse. Le code d'état est important car il indique au client comment interpréter une réponse.
La spécification <b>HTTP</b> en définit un certain nombre pour certains types de réponses :
</p>
<ul>
  <li><b>1xx :</b> Messages d'information</li>
  <li><b>2xx :</b> Succès</li>
  <li><b>3xx :</b> Redirection</li>
  <li><b>4xx :</b> Erreur client</li>
  <li><b>5xx :</b> Erreur Serveur</li>
</ul>
<h2 class="title">Format</h2>
<p>
La spécification <b>HTTP</b> indique qu'un message de demande ou de réponse a la structure générale suivante :
</p>
<pre style='color:#000000;background:#ffffff;'>message = &lt;start-line>
          <span style='color:#3f7f59; '>*(&lt;message-header>)</span>
          CRLF
          [&lt;message-body>]

&lt;start-line> = Request-Line | Status-Line 
&lt;message-header> = Field-Name <span style='color:#2a00ff; '>':'</span> Field-Value
</pre>
<div class="nav">
 	<p><a href="web">&lt; Précédent</a></p>
 	<p><a href="web/rest">Suivant &gt;</a></p>
</div>
