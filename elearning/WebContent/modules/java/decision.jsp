<h1>Décision</h1>
<p>
Les structures de prise de décision ont une ou plusieurs conditions qui doivent être évaluées par le programme, ainsi qu'une déclaration ou des déclarations qui doivent être exécutées si vrai, et éventuellement, d'autres instructions à exécuter si faux.
<p>
<h2 class="title">La structure if..else</h2>
<p>
Une instruction <b>if</b> peut être suivie d'une instruction <b>else</b>, qui s'exécute lorsque l'expression booléenne est fausse.
</p>
<pre style='color:#000000;background:#ffffff;'>
  <span style='color:#7f0055; font-weight:bold; '>int</span> x = 100;
   <span style='color:#7f0055; font-weight:bold; '>if</span>(x &lt; 20){
      <span style='color:#7f0055; font-weight:bold; '>System</span>.out.print(<span style='color:#2a00ff; '>"x est &lt; à 20"</span>);
   }<span style='color:#7f0055; font-weight:bold; '>else</span>{
      <span style='color:#7f0055; font-weight:bold; '>System</span>.out.print(<span style='color:#2a00ff; '>"x est > à 20"</span>);
   }  
</pre>
<h2 class="title">La structure switch</h2>
<p>
Une instruction <b>switch</b> permet de tester la valeur d'une variable contre une liste de valeurs. Chaque valeur est appelée un cas et la variable est testée pour chaque cas.
</p>
<pre style='color:#000000;background:#ffffff;'>
   <span style='color:#7f0055; font-weight:bold; '>char</span> grade = <span style='color:#2a00ff; '>'C'</span>;
   <span style='color:#7f0055; font-weight:bold; '>switch</span>(grade) {
         <span style='color:#7f0055; font-weight:bold; '>case</span> <span style='color:#2a00ff; '>'A'</span> :
            <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(<span style='color:#2a00ff; '>"Excellent!"</span>); 
            <span style='color:#7f0055; font-weight:bold; '>break</span>;
         <span style='color:#7f0055; font-weight:bold; '>case</span> <span style='color:#2a00ff; '>'B'</span> :
         <span style='color:#7f0055; font-weight:bold; '>case</span> <span style='color:#2a00ff; '>'C'</span> :
            <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(<span style='color:#2a00ff; '>"Bravo!"</span>);
            <span style='color:#7f0055; font-weight:bold; '>break</span>;
         <span style='color:#7f0055; font-weight:bold; '>case</span> <span style='color:#2a00ff; '>'D'</span> :
            <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(<span style='color:#2a00ff; '>"Vous avez réussi"</span>);
            <span style='color:#7f0055; font-weight:bold; '>break</span>;
         <span style='color:#7f0055; font-weight:bold; '>default</span> :
            <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(<span style='color:#2a00ff; '>"grade invalide"</span>);
   }
   <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(<span style='color:#2a00ff; '>"votre grade est "</span> + grade);
</pre>
<h2 class="title">L'opérateur conditionnel ? :</h2>
<p>
Une opération commune est d'établir le maximum entre deux valeurs. Elle peut se faire en une seule ligne
en utilisant l'opérateur conditionnel <b>? :</b>
</p>
<pre style='color:#000000;background:#ffffff;'>
   <span style='color:#7f0055; font-weight:bold; '>int</span> max;
   <span style='color:#7f0055; font-weight:bold; '>int</span> a = 15;
   <span style='color:#7f0055; font-weight:bold; '>int</span> b = 25;
   max = (a > b) ? a : b;
   <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(<span style='color:#2a00ff; '>"le max est "</span> + max);
</pre>
<div class="nav">
 	<p><a href="java/boucle">&lt; Précédent</a></p>
 	<p><a href="java/collections">Suivant &gt;</a></p>
</div>