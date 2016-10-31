<h1>Flux et Fichier</h1>
<p>
Le package <b>java.io</b> contient presque toutes les classes dont vous pourriez avoir besoin pour manipuler des flux d'entrée <b>(InPutStream)</b> et de sortie <b>(OutPutStream)</b>.
<p>
<img src="${images}/file_io.jpg"/>
<h2 class="title">Copie d'un fichier</h2>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>import</span><span style='color:#7f0055; '> java</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; '>io</span><span style='color:#7f0055; '>.</span><span style='color:#7f0055; font-weight:bold; '>*</span><span style='color:#7f0055; '>;</span>

<span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>class</span> CopyFile {
   <span style='color:#7f0055; font-weight:bold; '>public</span> <span style='color:#7f0055; font-weight:bold; '>static</span> <span style='color:#7f0055; font-weight:bold; '>void</span> main(<span style='color:#7f0055; font-weight:bold; '>String</span> args[]) <span style='color:#7f0055; font-weight:bold; '>throws</span> <span style='color:#7f0055; font-weight:bold; '>IOException</span>
   {
      <span style='color:#7f0055; font-weight:bold; '>FileInputStream</span> in = <span style='color:#7f0055; font-weight:bold; '>null</span>;
      <span style='color:#7f0055; font-weight:bold; '>FileOutputStream</span> out = <span style='color:#7f0055; font-weight:bold; '>null</span>;

      <span style='color:#7f0055; font-weight:bold; '>try</span> {
         in = <span style='color:#7f0055; font-weight:bold; '>new</span> <span style='color:#7f0055; font-weight:bold; '>FileInputStream</span>(<span style='color:#2a00ff; '>"input.txt"</span>);
         out = <span style='color:#7f0055; font-weight:bold; '>new</span> <span style='color:#7f0055; font-weight:bold; '>FileOutputStream</span>(<span style='color:#2a00ff; '>"output.txt"</span>);
         
         <span style='color:#7f0055; font-weight:bold; '>int</span> c;
         <span style='color:#7f0055; font-weight:bold; '>while</span> ((c = in.read()) != -1) {
            out.write(c);
         }
      }<span style='color:#7f0055; font-weight:bold; '>finally</span> {
         <span style='color:#7f0055; font-weight:bold; '>if</span> (in != <span style='color:#7f0055; font-weight:bold; '>null</span>) {
            in.close();
         }
         <span style='color:#7f0055; font-weight:bold; '>if</span> (out != <span style='color:#7f0055; font-weight:bold; '>null</span>) {
            out.close();
         }
      }
   }
}
</pre>
<h2 class="title">La classe File</h2>
<p>
La classe <b>File</b> représente les fichiers et les répertoires d'une manière abstraite. Elle est utilisée pour la création, la recherche et la suppression de fichiers et de répertoires etc...
</p>
<pre style='color:#000000;background:#ffffff;'><span style='color:#7f0055; font-weight:bold; '>import</span> java.io.File;

public class CreateDir {
   public <span style='color:#7f0055; font-weight:bold; '>static</span> <span style='color:#7f0055; font-weight:bold; '>void</span> <span style='color:#7f0055; font-weight:bold; '>main</span>(<span style='color:#7f0055; font-weight:bold; '>String</span> args[]) {
      <span style='color:#7f0055; font-weight:bold; '>String</span> nom = <span style='color:#2a00ff; '>"</span><span style='color:#2a00ff; '>c:</span><span style='color:#2a00ff; '>\\</span><span style='color:#2a00ff; '>repertoire</span><span style='color:#2a00ff; '>"</span>;
      File rep = new File(nom);
      rep.mkdirs();
  }
}
</pre>
<p>
Vous pouvez avoir une documentation exhaustive de la classe <b>File</b> en consultant sa <b>JavaDoc</b> <a href="https://docs.oracle.com/javase/7/docs/api/java/io/File.html" target="_blank">ici</a>.
</p>
<div class="nav">
 	<p><a href="java/exception">&lt; Précédent</a></p>
 	<p><a  href="java/exercices">Suivant &gt;</a></p>
</div>