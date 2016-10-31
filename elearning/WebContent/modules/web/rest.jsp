<h1>REST</h1>
<p>
<b>REST (Representational State Transfer)</b> a été introduite par <b>Roy Fielding</b> en 2000 lors de sa 
thèse et est une architecture web standard basée sur le protocole <b>HTTP</b> pour l'échange de données dans lequel une ressource est accessible par une interface commune en utilisant les méthodes standards <b>HTTP</b>.
Chaque ressource est identifiée par une adresse <b>(URL)</b> et peut avoir en retour plusieurs représentations ou formats d'entrée et de sortie <b>(Texte, JSON,XML...)</b>.
</p>
<h2 class="title">Méthodes HTTP</h2>
<ul>
  <li><b>GET :</b> récupére une ressource existante</li>
  <li><b>POST :</b> crée une nouvelle ressource</li>
  <li><b>PUT :</b> modifie une ressource existante</li>
  <li><b>DELETE :</b> supprime une ressource existante</li> 
</ul>
<h2 class="title">Les services web RESTful</h2>
<p>
Un service web est un ensemble de protocoles ouverts et standards utilisés pour l'échange de données entre les applications ou systèmes. Les applications logicielles écrites dans différents langages de programmation et fonctionnant sur différentes plates-formes peuvent utiliser des services web pour échanger des données sur des réseaux informatiques comme l'Internet d'une manière similaire à la communication inter-processus sur un seul ordinateur.
Les services web basés sur l'architecture <b>REST</b> sont connus sous le nom de services web <b>RESTful</b> et sont de cette forme :
</p>
<table> 
 <thead> 
  <tr> 
   <th scope="col">Méthode</th> 
   <th scope="col">URL</th> 
   <th scope="col">Opération</th>
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
   <td>crée un nouveau livre</td>
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
<h2 class="title">Implémentation avec Java EE</h2>
<p>
<b>JAX-RS</b> est la spécification standard (<b>API</b>) de la plate-forme <b>Java EE</b> qui offre un soutien pour la création de services web <b>RESTful</b> en utilisant des annotations pour simplifier le développement et le déploiement comme suit : 
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
<h2 class="title">Implémentation avec Node.js</h2>
<p>
La création d'une <b>API RESTful</b> en utilisant <b>Node.js</b> et le framework <b>Express</b> est une chose relativement simple comme ci-dessous :
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
  console.<span style='color:#7f0055; font-weight:bold; '>log</span>(<span style='color:#2a00ff; '>'</span><span style='color:#2a00ff; '>Serveur démarré sur le port </span><span style='color:#2a00ff; '>'</span> + server.address().port);
});
</pre>
<div class="nav">
 	<p><a href="web/http">&lt; Précédent</a></p>
 	<p><a href="web/html">Suivant &gt;</a></p>
</div>
