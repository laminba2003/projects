<h1>REST</h1>
<p>
<b>REST (Representational State Transfer)</b> a �t� introduite par <b>Roy Fielding</b> en 2000 lors de sa 
th�se et est une architecture web standard bas�e sur le protocole <b>HTTP</b> pour l'�change de donn�es dans lequel une ressource est accessible par une interface commune en utilisant les m�thodes standards <b>HTTP</b>.
Chaque ressource est identifi�e par une adresse <b>(URL)</b> et peut avoir en retour plusieurs repr�sentations ou formats d'entr�e et de sortie <b>(Texte, JSON,XML...)</b>.
</p>
<h2 class="title">M�thodes HTTP</h2>
<ul>
  <li><b>GET :</b> r�cup�re une ressource existante</li>
  <li><b>POST :</b> cr�e une nouvelle ressource</li>
  <li><b>PUT :</b> modifie une ressource existante</li>
  <li><b>DELETE :</b> supprime une ressource existante</li> 
</ul>
<h2 class="title">Les services web RESTful</h2>
<p>
Un service web est un ensemble de protocoles ouverts et standards utilis�s pour l'�change de donn�es entre les applications ou syst�mes. Les applications logicielles �crites dans diff�rents langages de programmation et fonctionnant sur diff�rentes plates-formes peuvent utiliser des services web pour �changer des donn�es sur des r�seaux informatiques comme l'Internet d'une mani�re similaire � la communication inter-processus sur un seul ordinateur.
Les services web bas�s sur l'architecture <b>REST</b> sont connus sous le nom de services web <b>RESTful</b> et sont de cette forme :
</p>
<table> 
 <thead> 
  <tr> 
   <th scope="col">M�thode</th> 
   <th scope="col">URL</th> 
   <th scope="col">Op�ration</th>
  </tr> 
 </thead> 
 <tbody>  
 
 <tr>
   <td><code>GET</code></td>
   <td>/livres</td>
   <td>retourne la liste des livres</td>
 </tr>
 
 <tr>
   <td><code>GET</code></td>
   <td>/livres/1</td>
   <td>retourne les informations du livre qui a l'ID 1</td>
 </tr>
 
 <tr>
   <td><code>POST</code></td>
   <td>/livres</td>
   <td>cr�e un nouveau livre</td>
 </tr>
 
 <tr>
   <td><code>PUT</code></td>
   <td>/livres/1</td>
   <td>modifie les informations du livre qui a l'ID 1</td>
 </tr>
 
 <tr>
   <td><code>DELETE</code></td>
   <td>/livres/1</td>
   <td>supprime le livre qui a l'ID 1</td>
 </tr>
 
 </tbody>
</table>
<h2 class="title">Impl�mentation avec Java EE</h2>
<p>
<b>JAX-RS</b> est la sp�cification standard (<b>API</b>) de la plate-forme <b>Java EE</b> qui offre un soutien pour la cr�ation de services web <b>RESTful</b> en utilisant des annotations pour simplifier le d�veloppement et le d�ploiement comme suit : 
</p>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>import</span><span style='color:#7f0055; '> javax</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>ws</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>rs</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>Path</span><span style='color:#7f0055; '>;</span>
<span style='color:#7f0055; font-weight:bold; '>import</span><span style='color:#7f0055; '> javax</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>ws</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>rs</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>PathParam</span><span style='color:#7f0055; '>;</span>
<span style='color:#7f0055; font-weight:bold; '>import</span><span style='color:#7f0055; '> javax</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>ws</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>rs</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>GET</span><span style='color:#7f0055; '>;</span>
<span style='color:#7f0055; font-weight:bold; '>import</span><span style='color:#7f0055; '> javax</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>ws</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>rs</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>POST</span><span style='color:#7f0055; '>;</span>
<span style='color:#7f0055; font-weight:bold; '>import</span><span style='color:#7f0055; '> javax</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>ws</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>rs</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>PUT</span><span style='color:#7f0055; '>;</span>
<span style='color:#7f0055; font-weight:bold; '>import</span><span style='color:#7f0055; '> javax</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>ws</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>rs</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>DELETE</span><span style='color:#7f0055; '>;</span>
<span style='color:#7f0055; font-weight:bold; '>import</span><span style='color:#7f0055; '> javax</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>ws</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>rs</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>Produces</span><span style='color:#7f0055; '>;</span>
<span style='color:#7f0055; font-weight:bold; '>import</span><span style='color:#7f0055; '> javax</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>ws</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>rs</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>Consumes</span><span style='color:#7f0055; '>;</span>
<span style='color:#7f0055; font-weight:bold; '>import</span><span style='color:#7f0055; '> javax</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>ws</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>rs</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>core</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>MediaType</span><span style='color:#7f0055; '>;</span>


@Path("/livres")
<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> LivreService {

   @GET
   @Produces(MediaType.APPLICATION_JSON)
   <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>List</span>&lt;Livre> getLivres(){
     ......
   }

   @GET
   @Path(<span style='color:#2a00ff; '>"{id}"</span>)
   @Produces(MediaType.APPLICATION_JSON)
   <span style='color:#7f0055; font-weight:bold; '>public</span> Livre getLivre(@PathParam <span style='color:#7f0055; font-weight:bold; '>Long</span> id){
     ......
   }	
   
   @POST
   @Consumes(MediaType.APPLICATION_JSON)
   @Produces(MediaType.APPLICATION_JSON)
   <span style='color:#7f0055; font-weight:bold; '>public</span> Livre createLivre(Livre livre){
     ......
   }
   
   @PUT
   @Path(<span style='color:#2a00ff; '>"{id}"</span>)
   @Consumes(MediaType.APPLICATION_JSON)
   @Produces(MediaType.APPLICATION_JSON)
   <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> updateLivre(@PathParam <span style='color:#7f0055; font-weight:bold; '>Long</span> id,Livre livre){
     ......
   }		

   @DELETE
   @Path(<span style='color:#2a00ff; '>"{id}"</span>)
   <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>void</span> deleteLivre(@PathParam <span style='color:#7f0055; font-weight:bold; '>Long</span> id){
     ......
   }	
}
</pre>
<h2 class="title">Impl�mentation avec Node.js</h2>
<p>
La cr�ation d'une <b>API RESTful</b> en utilisant <b>Node.js</b> et le framework <b>Express</b> est une chose relativement simple comme ci-dessous :
</p>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>var</span> express = require(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>express</span><span style='color:#2a00ff; '>'</span>);
<span style='color:#7f0055; font-weight:bold; '>var</span> bodyparser = require(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>body-parser</span><span style='color:#2a00ff; '>'</span>);

<span style='color:#7f0055; font-weight:bold; '>var</span> app = express();
app.use(bodyparser.urlencoded({extended: <span style='color:#7f0055; font-weight:bold; '>true</span>}));
app.use(bodyparser.json());

app.get(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>/livres</span><span style='color:#2a00ff; '>'</span>, <span style='color:#7f0055; font-weight:bold; '>function</span>(req, res) {
   ...
});

app.get(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>/livres/:id</span><span style='color:#2a00ff; '>'</span>, <span style='color:#7f0055; font-weight:bold; '>function</span>(req, res) {
   ...
});

app.post(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>/livres</span><span style='color:#2a00ff; '>'</span>, <span style='color:#7f0055; font-weight:bold; '>function</span>(req, res) {
   ...
});

app.put(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>/livres/:id</span><span style='color:#2a00ff; '>'</span>, <span style='color:#7f0055; font-weight:bold; '>function</span>(req, res) {
   ...
});

app.<span style='font-weight:bold; '>delete</span>(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>/livres/:id</span><span style='color:#2a00ff; '>'</span>, <span style='color:#7f0055; font-weight:bold; '>function</span>(req, res) {
    ...
});

<span style='color:#7f0055; font-weight:bold; '>var</span> server = app.listen(8000, <span style='color:#7f0055; font-weight:bold; '>function</span>() {
  console.<span style='color:#7f0055; font-weight:bold; '>log</span>(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>Serveur d�marr� sur le port </span><span style='color:#2a00ff; '>'</span> + server.address().port);
});
</pre>
<div class="nav">
 	<p><a href="web/http">&lt; Pr�c�dent</a></p>
 	<p><a href="web/html">Suivant &gt;</a></p>
</div>
