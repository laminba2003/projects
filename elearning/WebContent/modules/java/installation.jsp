<h1>Installation du JDK sur Microsoft Windows</h1>
<ul>
   <li>
   		<span><b>Télécharger L'installeur</b></span><br>
   		Si vous enregistrez le fichier auto-installation du <b>JDK (JAVA DEVELOPMENT KIT)</b> sur le disque sans l'exécuter à partir du <a href="http://www.oracle.com/technetwork/java/javase/downloads/index-jsp-138363.html" target="_blank">site web</a>, notez la taille du fichier spécifié sur la page de téléchargement. Une fois le téléchargement terminé, vérifiez que vous avez bien téléchargé le fichier au complet
   		et ensuite démarrez l'installation.
   </li>
   
   <li>
   		<span><b>Mettre à jour les variables d'environnement</b></span><br>
   		Si vous ne définissez pas la variable <b>PATH</b>, vous devez spécifier le chemin complet du compilateur à chaque fois que vous l'exécutez sur la console windows, tel que : <br/><br/>
       <span><i><b>C: \> C:\Program Files\Java\jdk1.8.0\bin\ javac MyClass.java</b></i></span>
       <br/><br/>
       Pour définir la variable <b>PATH</b> de façon permanente, ajoutez le chemin complet du répertoire du <b>JDK</b> comme suit.
			 <ul class="number">
		      	<li>Cliquer sur Démarrer, puis sur Panneau de configuration, puis Système.</li>
		        <li>Cliquer sur Avancé, puis sur Variables d'environnement.</li>
		        <li>Ajouter l'emplacement du dossier bin dans Variables système. Ce qui suit est une valeur typique pour la variable <b>PATH</b> :<br/>
		        <span style="margin-left:15px"><b><i>PATH = C:\windows;C:\Program Files\Java\jdk1.8.0\bin</i> </b> </span></li>
		        <li>Et vu que certains programmes peuvent en avoir besoin, Il est aussi récommandé de renseigner la valeur de la variable <b>JAVA_HOME</b> :<br/>
		    <span style="margin-left:14px"><i><b>JAVA_HOME = C:\Program Files\Java\jdk1.8.0</b></i></span></li>
		      </ul>
   	</li>
</ul>
<hr/>
<div class="nav">
 	<p><a href="java">&lt; Précédent</a></p>
 	<p><a href="java/outils">Suivant &gt;</a></p>
</div>