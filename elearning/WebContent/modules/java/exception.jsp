<h1>Exception</h1>
<p>
Une exception est un probl�me qui se pose lors de l'ex�cution d'un programme. Quand une exception se produit, le d�roulement normal du programme est perturb�. 
Par cons�quent, les exceptions doivent �tre trait�es. En <b>Java</b>, toutes les classes d'exception sont des sous-types de la classe <b>java.lang.Exception</b> qui elle m�me est une sous-classe de la classe <b>Throwable</b>.
<p>
<img src="${images}/exceptions.jpg"/>
<h2 class="title">Le bloc try..catch </h2>
<p>
Un bloc try peut �tre suivi par plusieurs blocs catch. La syntaxe pour plusieurs blocs catch ressemble � ceci :
</p>
<pre style='color:#000000;background:#ffffff;'>
   try {
       <span style='color:#3f7f59; '>//votre code</span>
   }catch(ExceptionType1 e1){
     <span style='color:#3f7f59; '>//Catch bloc 1</span>
  }catch(ExceptionType2 e2) {
   <span style='color:#3f7f59; '>//Catch bloc 2</span>
  }catch(ExceptionType3 e3){
   <span style='color:#3f7f59; '>//Catch bloc 3</span>
  }

</pre>
<h2 class="title">Le bloc finally </h2>
<p>
Le bloc finally suit un bloc try ou un bloc catch. Il s'ex�cute toujours, ind�pendamment de l'occurrence d'une exception et sa syntaxe est la suivante :
</p>
<pre style='color:#000000;background:#ffffff;'>
   try {
       <span style='color:#3f7f59; '>//votre code</span>
   }catch(ExceptionType1 e1){
     <span style='color:#3f7f59; '>//Catch bloc 1</span>
  }catch(ExceptionType2 e2) {
   <span style='color:#3f7f59; '>//Catch bloc 2</span>
  }catch(ExceptionType3 e3){
   <span style='color:#3f7f59; '>//Catch bloc 3</span>
  }
  <span style='color:#7f0055; font-weight:bold; '>finally</span> {
   <span style='color:#3f7f59; '>// bloc finally</span>
  }
</pre>
<div class="nav">
 	<p><a href="java/generique">&lt; Pr�c�dent</a></p>
 	<p><a href="java/flux">Suivant &gt;</a></p>
</div>