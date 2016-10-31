<h1>Exception</h1>
<p>
Une exception est un problème qui se pose lors de l'exécution d'un programme. Quand une exception se produit, le déroulement normal du programme est perturbé. 
Par conséquent, les exceptions doivent être traitées.
<p>
<h2 class="title">Le bloc try..catch </h2>
<p>
Un bloc try peut être suivi par plusieurs blocs catch. La syntaxe pour plusieurs blocs catch ressemble à ceci :
</p>
<pre style='color:#000000;background:#ffffff;'>
   try {
       <span style='color:#3f7f59; '>//votre code</span>
   }catch(e1){
     <span style='color:#3f7f59; '>//Catch bloc 1</span>
  }catch(e2) {
   <span style='color:#3f7f59; '>//Catch bloc 2</span>
  }catch(e3){
   <span style='color:#3f7f59; '>//Catch bloc 3</span>
  }

</pre>
<h2 class="title">Le bloc finally </h2>
<p>
Le bloc finally suit un bloc try ou un bloc catch. Il s'exécute toujours, indépendamment de l'occurrence d'une exception et sa syntaxe est la suivante :
</p>
<pre style='color:#000000;background:#ffffff;'>
   try {
       <span style='color:#3f7f59; '>//votre code</span>
   }catch(e1){
     <span style='color:#3f7f59; '>//Catch bloc 1</span>
  }catch(e2) {
   <span style='color:#3f7f59; '>//Catch bloc 2</span>
  }catch(e3){
   <span style='color:#3f7f59; '>//Catch bloc 3</span>
  }
  <span style='color:#7f0055; font-weight:bold; '>finally</span> {
   <span style='color:#3f7f59; '>// bloc finally</span>
  }
</pre>
<div class="nav">
 	<p><a href="javascript/decision">&lt; Précédent</a></p>
 	<p><a>Suivant &gt;</a></p>
</div>