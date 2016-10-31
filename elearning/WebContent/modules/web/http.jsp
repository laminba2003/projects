<h1>HTTP</h1>
<p>
<b>HTTP (Hypertext Transfer Protocol)</b> permet la communication entre une vari�t� d'h�tes et de clients, et prend en charge un m�lange de configurations r�seaux qui le rendent sans �tat. La communication se d�roule g�n�ralement sur <b>TCP/IP</b> et le port par d�faut est <b>80</b>.
La communication entre un h�te et un client se produit par l'interm�diaire d'une paire <b>demande/r�ponse</b>. Le client lance un message de requ�te qui est desservi par un message de r�ponse en retour.
</p>
<img src="${images}/http_request_response.png" style="margin-left:50px"/>
<h2 class="title">URLS</h2>
<p>
les messages de demande sont au centre de la communication web et ils sont envoy�s vers des adresses ou <b>URLS (Uniform Resource Locators)</b>. 
</p>
<img src="${images}/http_url_structure.png" style="margin-left:10px"/>
<h2 class="title">M�thodes</h2>
<p>
les <b>URLS</b> r�v�lent l'identit� de l'h�te avec lequel nous voulons communiquer, mais l'action qui doit �tre effectu�e sur l'h�te est sp�cifi�e via des m�thodes.
</p>
<ul>
  <li><b>GET :</b> r�cup�re une ressource existante</li>
  <li><b>POST :</b> cr�e une nouvelle ressource</li>
  <li><b>PUT :</b> modifie une ressource existante</li>
  <li><b>DELETE :</b> supprime une ressource existante</li> 
  <li><b>HEAD :</b> r�cup�re les en-t�tes serveur pour une ressource particuli�re</li>
  <li><b>TRACE :</b> r�cup�re les informations de suivi d'une requ�te</li>
  <li><b>OPTIONS :</b> r�cup�re les informations sur les capacit�s de serveur</li>
</ul>
<h2 class="title">Codes d'�tat</h2>
<p>
Avec les <b>URLS</b> et les <b>M�thodes</b>, le client peut lancer des requ�tes vers le serveur. En retour, le serveur r�pond avec des codes d'�tat et des messages de r�ponse. Le code d'�tat est important car il indique au client comment interpr�ter une r�ponse.
La sp�cification <b>HTTP</b> en d�finit un certain nombre pour certains types de r�ponses :
</p>
<ul>
  <li><b>1xx :</b> Messages d'information</li>
  <li><b>2xx :</b> Succ�s</li>
  <li><b>3xx :</b> Redirection</li>
  <li><b>4xx :</b> Erreur client</li>
  <li><b>5xx :</b> Erreur Serveur</li>
</ul>
<h2 class="title">Format</h2>
<p>
La sp�cification <b>HTTP</b> indique qu'un message de demande ou de r�ponse a la structure g�n�rale suivante :
</p>
<pre style='color:#000000;background:#ffffff;'>message = &lt;start-line>
          <span style='color:#3f7f59; '>*(&lt;message-header>)</span>
          CRLF
          [&lt;message-body>]

&lt;start-line> = Request-Line | Status-Line 
&lt;message-header> = Field-Name <span style='color:#2a00ff; '>':'</span> Field-Value
</pre>
<div class="nav">
 	<p><a href="web">&lt; Pr�c�dent</a></p>
 	<p><a href="web/rest">Suivant &gt;</a></p>
</div>
