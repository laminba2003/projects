<h1>D�cision</h1>
<p>
Les structures de prise de d�cision ont une ou plusieurs conditions qui doivent �tre �valu�es par le programme, ainsi qu'une d�claration ou des d�clarations qui doivent �tre ex�cut�es si vrai, et �ventuellement, d'autres instructions � ex�cuter si faux.
<p>
<h2 class="title">La structure if..else</h2>
<p>
Une instruction <b>if</b> peut �tre suivie d'une instruction <b>else</b>, qui s'ex�cute lorsque l'expression bool�enne est fausse.
</p>
<pre style='color:#000000;background:#ffffff;'>
  <span style='color:#7f0055; font-weight:bold; '>int</span> x = 100;
   <span style='color:#7f0055; font-weight:bold; '>if</span>(x &lt; 20){
      <span style='color:#7f0055; font-weight:bold; '>System</span>.out.print(<span style='color:#2a00ff; '>"x est &lt; � 20"</span>);
   }<span style='color:#7f0055; font-weight:bold; '>else</span>{
      <span style='color:#7f0055; font-weight:bold; '>System</span>.out.print(<span style='color:#2a00ff; '>"x est > � 20"</span>);
   }  
</pre>
<h2 class="title">La structure switch</h2>
<p>
Une instruction <b>switch</b> permet de tester la valeur d'une variable contre une liste de valeurs. Chaque valeur est appel�e un cas et la variable est test�e pour chaque cas.
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
            <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(<span style='color:#2a00ff; '>"Vous avez r�ussi"</span>);
            <span style='color:#7f0055; font-weight:bold; '>break</span>;
         <span style='color:#7f0055; font-weight:bold; '>default</span> :
            <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(<span style='color:#2a00ff; '>"grade invalide"</span>);
   }
   <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(<span style='color:#2a00ff; '>"votre grade est "</span> + grade);
</pre>
<h2 class="title">L'op�rateur conditionnel ? :</h2>
<p>
Une op�ration commune est d'�tablir le maximum entre deux valeurs. Elle peut se faire en une seule ligne
en utilisant l'op�rateur conditionnel <b>? :</b>
</p>
<pre style='color:#000000;background:#ffffff;'>
   <span style='color:#7f0055; font-weight:bold; '>int</span> max;
   <span style='color:#7f0055; font-weight:bold; '>int</span> a = 15;
   <span style='color:#7f0055; font-weight:bold; '>int</span> b = 25;
   max = (a > b) ? a : b;
   <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(<span style='color:#2a00ff; '>"le max est "</span> + max);
</pre>
<div class="nav">
 	<p><a href="java/boucle">&lt; Pr�c�dent</a></p>
 	<p><a href="java/collections">Suivant &gt;</a></p>
</div>