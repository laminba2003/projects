<h1>Collections</h1>
<p>
Avant <b>Java 2</b>, nous avions des classes telles que <b>Dictionary</b>, <b>Vector</b>, <b>Stack</b> et <b>Properties</b> pour stocker et manipuler des groupes d'objets
et maintenant nous avons les collections qui sont con�ues autour d'un ensemble d'interfaces et d'impl�mentations standards.
<p>
<h2 class="title">Les Interfaces</h2>
<ul>
	<li><b>Collection :</b> Il vous permet de travailler avec des groupes d'objets.</li>
	<li><b>List :</b> Il stocke une collection ordonn�e d'�l�ments.</li>
	<li><b>Set :</b> Il stocke une collection d'�l�ments uniques.</li>
	<li><b>SortedSet :</b> Il stocke une collection d'�l�ments tri�s.</li>
	<li><b>Map :</b> Il stocke une collection d'�l�ments avec une cl� unique et une valeur.</li>
	<li><b>Map.Entry :</b> Il est une classe interne de la classe <b>Map</b>.</li>
	<li><b>SortedMap :</b> Il stocke les �l�ments avec une cl� unique et une valeur dans l'ordre croissant.</li>
	<li><b>Enumeration :</b> Cette interface est pour �num�rer des �l�ments.</li>
</ul>
<h2 class="title">Les Classes ou Impl�mentations</h2>
<ul>
  <li><b>AbstractCollection</b> </li>
  <li><b>AbstractList</b> </li>
  <li><b>AbstractSequentialList</b> </li>
  <li><b>LinkedList</b> </li>
  <li><b>ArrayList</b> </li>
  <li><b>AbstractSet</b> </li>
  <li><b>HashSet</b> </li>
  <li><b>LinkedHashSet</b> </li>
  <li><b>TreeSet</b> </li>
  <li><b>AbstractMap</b> </li>
  <li><b>HashMap</b> </li>
  <li><b>TreeMap</b> </li>
  <li><b> WeakHashMap</b> </li>
  <li><b>LinkedHashMap</b> </li>
  <li><b>IdentityHashMap</b> </li>
</ul>
<h2 class="title">Exemple</h2>
<pre style='color:#000000;background:#ffffff;'>
    <span style='color:#7f0055; font-weight:bold; '>List</span> liste = <span style='color:#7f0055; font-weight:bold; '>new</span> ArrayList();
    liste.add(12);
    liste.add(<span style='color:#2a00ff; '>"toto"</span>);
    liste.add(5.255f);
    <span style='color:#7f0055; font-weight:bold; '>for</span>(<span style='color:#7f0055; font-weight:bold; '>int</span> i = 0; i &lt; liste.size(); i++) {
      <span style='color:#7f0055; font-weight:bold; '>System</span>.out.println(<span style='color:#2a00ff; '>"�l�ment � l'index "</span> + i + <span style='color:#2a00ff; '>" = "</span> + liste.get(i));
    }
</pre>
<div class="nav">
 	<p><a href="java/decision">&lt; Pr�c�dent</a></p>
 	<p><a href="java/generique">Suivant &gt;</a></p>
</div>