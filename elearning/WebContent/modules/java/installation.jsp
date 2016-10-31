<h1>Installation du JDK sur Microsoft Windows</h1>
<ul>
   <li>
   		<span><b>T�l�charger L'installeur</b></span><br>
   		Si vous enregistrez le fichier auto-installation du <b>JDK (JAVA DEVELOPMENT KIT)</b> sur le disque sans l'ex�cuter � partir du <a href="http://www.oracle.com/technetwork/java/javase/downloads/index-jsp-138363.html" target="_blank">site web</a>, notez la taille du fichier sp�cifi� sur la page de t�l�chargement. Une fois le t�l�chargement termin�, v�rifiez que vous avez bien t�l�charg� le fichier au complet
   		et ensuite d�marrez l'installation.
   </li>
   
   <li>
   		<span><b>Mettre � jour les variables d'environnement</b></span><br>
   		Si vous ne d�finissez pas la variable <b>PATH</b>, vous devez sp�cifier le chemin complet du compilateur � chaque fois que vous l'ex�cutez sur la console windows, tel que : <br/><br/>
       <span><i><b>C: \> C:\Program Files\Java\jdk1.8.0\bin\ javac MyClass.java</b></i></span>
       <br/><br/>
       Pour d�finir la variable <b>PATH</b> de fa�on permanente, ajoutez le chemin complet du r�pertoire du <b>JDK</b> comme suit.
			 <ul class="number">
		      	<li>Cliquer sur D�marrer, puis sur Panneau de configuration, puis Syst�me.</li>
		        <li>Cliquer sur Avanc�, puis sur Variables d'environnement.</li>
		        <li>Ajouter l'emplacement du dossier bin dans Variables syst�me. Ce qui suit est une valeur typique pour la variable <b>PATH</b> :<br/>
		        <span style="margin-left:15px"><b><i>PATH = C:\windows;C:\Program Files\Java\jdk1.8.0\bin</i> </b> </span></li>
		        <li>Et vu que certains programmes peuvent en avoir besoin, Il est aussi r�command� de renseigner la valeur de la variable <b>JAVA_HOME</b> :<br/>
		    <span style="margin-left:14px"><i><b>JAVA_HOME = C:\Program Files\Java\jdk1.8.0</b></i></span></li>
		      </ul>
   	</li>
</ul>
<hr/>
<div class="nav">
 	<p><a href="java">&lt; Pr�c�dent</a></p>
 	<p><a href="java/outils">Suivant &gt;</a></p>
</div>