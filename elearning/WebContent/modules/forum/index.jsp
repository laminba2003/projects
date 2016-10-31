<%@ taglib prefix="s" uri="/struts-tags"%>
<h1>Forum :
<span id="forum">Tous</span> 
<select id="changeforum" onchange="changeforum();">
	<option value="Tous">Tous</option>
	<option value="C">C</option>
	<option value="C++">C++</option>
	<option value="Java">Java</option>
	<option value="JavaScript">javaScript</option>
	<option value="Node">Node</option>
	<option value="Php">php</option>
	<option value="Web">Web</option>
	<option value="Mobile">Mobile</option>
	<option value="POO">POO</option>
	<option value="UML">UML</option>
	<option value="Patterns">Patterns</option>
	<option value="SGBD">SGBD</option>
	<option value="XML">XML</option>
</select>
</h1>
<div class="forums forum-list">
	<div id="C" class="forum">
		<h2>
		Forum C
		<s:if test="%{#session['user']!=null}">
			<a href="forums/C/nouveau">Nouveau message</a>
		</s:if>
		</h2>
	    <table border="1" class="paginated">
	    	<thead>
	    	   <tr>
		    		<th>Message / Intitulé</th>
		    		<th>Réponses / Vues</th>
		    		<th>Auteur</th>
	    	   </tr>
	    	</thead>
	    	<tbody>
	    	   <s:iterator value="getMessages('C')">
		    	    <tr>
		    	    	<td><a href="forums/message/<s:property value='id'/>"><s:property value="title"/></a></td>
		    	    	<td><s:property value="answerCount"/>/<s:property value="viewCount"/></td>
		    	    	<td><s:property value="author"/></td>
		    	    </tr>
	    	    </s:iterator>
	    	</tbody>
	    </table>
	</div>
	
	<div id="Cplusplus" class="forum">
		<h2>
		Forum C++
		<s:if test="%{#session['user']!=null}">
			<a href="forums/Cplusplus/nouveau">Nouveau message</a>
		</s:if>
		</h2>
		<table border="1" class="paginated">
	    	<thead>
	    	   <tr>
		    		<th>Message / Intitulé</th>
		    		<th>Réponses / Vues</th>
		    		<th>Auteur</th>
	    	   </tr>
	    	</thead>
	    	<tbody>
	    	     <s:iterator value="getMessages('Cplusplus')">
		    	   <tr>
		    	    	<td><a href="forums/message/<s:property value='id'/>"><s:property value="title"/></a></td>
		    	    	<td><s:property value="answerCount"/>/<s:property value="viewCount"/></td>
		    	    	<td><s:property value="author"/></td>
		    	    </tr>
	    	    </s:iterator>
	    	</tbody>
	    </table>
	</div>
	
	<div id="Java" class="forum">
		<h2>
		Forum Java
		<s:if test="%{#session['user']!=null}">
			<a href="forums/Java/nouveau">Nouveau message</a>
		</s:if>
		</h2>
		<table border="1">
	    	<thead>
	    	   <tr>
		    		<th>Message / Intitulé</th>
		    		<th>Réponses / Vues</th>
		    		<th>Auteur</th>
	    	   </tr>
	    	</thead>
	    	<tbody>
	    	     <s:iterator value="getMessages('Java')">
		    	    <tr>
		    	    	<td><a href="forums/message/<s:property value='id'/>"><s:property value="title"/></a></td>
		    	    	<td><s:property value="answerCount"/>/<s:property value="viewCount"/></td>
		    	    	<td><s:property value="author"/></td>
		    	    </tr>
	    	    </s:iterator>
	    	</tbody>
	    </table>
	</div>
	
	<div id="JavaScript" class="forum">
		<h2>
		Forum JavaScript
		<s:if test="%{#session['user']!=null}">
			<a href="forums/JavaScript/nouveau">Nouveau message</a>
		</s:if>
		</h2>
		<table border="1">
	    	<thead>
	    	   <tr>
		    		<th>Message / Intitulé</th>
		    		<th>Réponses / Vues</th>
		    		<th>Auteur</th>
	    	   </tr>
	    	</thead>
	    	<tbody>
	    	     <s:iterator value="getMessages('JavaScript')">
		    	    <tr>
		    	    	<td><a href="forums/message/<s:property value='id'/>"><s:property value="title"/></a></td>
		    	    	<td><s:property value="answerCount"/>/<s:property value="viewCount"/></td>
		    	    	<td><s:property value="author"/></td>
		    	    </tr>
	    	    </s:iterator>
	    	</tbody>
	    </table>
	</div>
	
	<div id="Node" class="forum">
		<h2>
		Forum Node
		<s:if test="%{#session['user']!=null}">
			<a href="forums/Node/nouveau">Nouveau message</a>
		</s:if>
		</h2>
		<table border="1">
	    	<thead>
	    	   <tr>
		    		<th>Message / Intitulé</th>
		    		<th>Réponses / Vues</th>
		    		<th>Auteur</th>
	    	   </tr>
	    	</thead>
	    	<tbody>
	    	     <s:iterator value="getMessages('Node')">
		    	    <tr>
		    	    	<td><a href="forums/message/<s:property value='id'/>"><s:property value="title"/></a></td>
		    	    	<td><s:property value="answerCount"/>/<s:property value="viewCount"/></td>
		    	    	<td><s:property value="author"/></td>
		    	    </tr>
	    	    </s:iterator>
	    	</tbody>
	    </table>
	</div>
	
	<div id="Php" class="forum">
		<h2>
		Forum Php
		<s:if test="%{#session['user']!=null}">
			<a href="forums/Php/nouveau">Nouveau message</a>
		</s:if>
		</h2>
		<table border="1">
	    	<thead>
	    	   <tr>
		    		<th>Message / Intitulé</th>
		    		<th>Réponses / Vues</th>
		    		<th>Auteur</th>
	    	   </tr>
	    	</thead>
	    	<tbody>
	    	     <s:iterator value="getMessages('Php')">
		    	    <tr>
		    	    	<td><a href="forums/message/<s:property value='id'/>"><s:property value="title"/></a></td>
		    	    	<td><s:property value="answerCount"/>/<s:property value="viewCount"/></td>
		    	    	<td><s:property value="author"/></td>
		    	    </tr>
	    	    </s:iterator>
	    	</tbody>
	    </table>
	</div>
	
	<div id="Web" class="forum">
		<h2>
		Forum Web
		<s:if test="%{#session['user']!=null}">
			<a href="forums/Web/nouveau">Nouveau message</a>
		</s:if>
		</h2>
		<table border="1">
	    	<thead>
	    	   <tr>
		    		<th>Message / Intitulé</th>
		    		<th>Réponses / Vues</th>
		    		<th>Auteur</th>
	    	   </tr>
	    	</thead>
	    	<tbody>
	    	     <s:iterator value="getMessages('Web')">
		    	    <tr>
		    	    	<td><a href="forums/message/<s:property value='id'/>"><s:property value="title"/></a></td>
		    	    	<td><s:property value="answerCount"/>/<s:property value="viewCount"/></td>
		    	    	<td><s:property value="author"/></td>
		    	    </tr>
	    	    </s:iterator>
	    	</tbody>
	    </table>
	</div>
	
	<div id="Mobile" class="forum">
		<h2>
		Forum Mobile
		<s:if test="%{#session['user']!=null}">
			<a href="forums/Mobile/nouveau">Nouveau message</a>
		</s:if>
		</h2>
		<table border="1">
	    	<thead>
	    	   <tr>
		    		<th>Message / Intitulé</th>
		    		<th>Réponses / Vues</th>
		    		<th>Auteur</th>
	    	   </tr>
	    	</thead>
	    	<tbody>
	    	     <s:iterator value="getMessages('Mobile')">
		    	    <tr>
		    	    	<td><a href="forums/message/<s:property value='id'/>"><s:property value="title"/></a></td>
		    	    	<td><s:property value="answerCount"/>/<s:property value="viewCount"/></td>
		    	    	<td><s:property value="author"/></td>
		    	    </tr>
	    	    </s:iterator>
	    	</tbody>
	    </table>
	</div>
	
	<div id="POO" class="forum">
		<h2>
		Forum POO
		<s:if test="%{#session['user']!=null}">
			<a href="forums/POO/nouveau">Nouveau message</a>
		</s:if>
		</h2>
		<table border="1">
	    	<thead>
	    	   <tr>
		    		<th>Message / Intitulé</th>
		    		<th>Réponses / Vues</th>
		    		<th>Auteur</th>
	    	   </tr>
	    	</thead>
	    	<tbody>
	    	     <s:iterator value="getMessages('POO')">
		    	   <tr>
		    	    	<td><a href="forums/message/<s:property value='id'/>"><s:property value="title"/></a></td>
		    	    	<td><s:property value="answerCount"/>/<s:property value="viewCount"/></td>
		    	    	<td><s:property value="author"/></td>
		    	    </tr>
	    	    </s:iterator>
	    	</tbody>
	    </table>
	</div>
	
	<div id="UML" class="forum">
		<h2>
		Forum UML
		<s:if test="%{#session['user']!=null}">
			<a href="forums/UML/nouveau">Nouveau message</a>
		</s:if>
		</h2>
		<table border="1">
	    	<thead>
	    	   <tr>
		    		<th>Message / Intitulé</th>
		    		<th>Réponses / Vues</th>
		    		<th>Auteur</th>
	    	   </tr>
	    	</thead>
	    	<tbody>
	    	     <s:iterator value="getMessages('UML')">
		    	    <tr>
		    	    	<td><a href="forums/message/<s:property value='id'/>"><s:property value="title"/></a></td>
		    	    	<td><s:property value="answerCount"/>/<s:property value="viewCount"/></td>
		    	    	<td><s:property value="author"/></td>
		    	    </tr>
	    	    </s:iterator>
	    	</tbody>
	    </table>
	</div>
	
	<div id="Patterns" class="forum">
		<h2>
		Forum Patterns
		<s:if test="%{#session['user']!=null}">
			<a href="forums/Patterns/nouveau">Nouveau message</a>
		</s:if>
		</h2>
		<table border="1">
	    	<thead>
	    	   <tr>
		    		<th>Message / Intitulé</th>
		    		<th>Réponses / Vues</th>
		    		<th>Auteur</th>
	    	   </tr>
	    	</thead>
	    	<tbody>
	    	     <s:iterator value="getMessages('Patterns')">
		    	   <tr>
		    	    	<td><a href="forums/message/<s:property value='id'/>"><s:property value="title"/></a></td>
		    	    	<td><s:property value="answerCount"/>/<s:property value="viewCount"/></td>
		    	    	<td><s:property value="author"/></td>
		    	    </tr>
	    	    </s:iterator>
	    	</tbody>
	    </table>
	</div>
	
	<div id="SGBD" class="forum">
		<h2>
		Forum SGBD
		<s:if test="%{#session['user']!=null}">
			<a href="forums/SGBD/nouveau">Nouveau message</a>
		</s:if>
		</h2>
		<table border="1">
	    	<thead>
	    	   <tr>
		    		<th>Message / Intitulé</th>
		    		<th>Réponses / Vues</th>
		    		<th>Auteur</th>
	    	   </tr>
	    	</thead>
	    	<tbody>
	    	     <s:iterator value="getMessages('SGBD')">
		    	    <tr>
		    	    	<td><a href="forums/message/<s:property value='id'/>"><s:property value="title"/></a></td>
		    	    	<td><s:property value="answerCount"/>/<s:property value="viewCount"/></td>
		    	    	<td><s:property value="author"/></td>
		    	    </tr>
	    	    </s:iterator>
	    	</tbody>
	    </table>
	</div>
	
	<div id="XML" class="forum">
		<h2>
		Forum XML
	    <s:if test="%{#session['user']!=null}">
			<a href="forums/XML/nouveau">Nouveau message</a>
		</s:if>
		</h2>
		<table border="1">
	    	<thead>
	    	   <tr>
		    		<th>Message / Intitulé</th>
		    		<th>Réponses / Vues</th>
		    		<th>Auteur</th>
	    	   </tr>
	    	</thead>
	    	<tbody>
	    	     <s:iterator value="getMessages('XML')">
		    	   <tr>
		    	    	<td><a href="forums/message/<s:property value='id'/>"><s:property value="title"/></a></td>
		    	    	<td><s:property value="answerCount"/>/<s:property value="viewCount"/></td>
		    	    	<td><s:property value="author"/></td>
		    	    </tr>
	    	    </s:iterator>
	    	</tbody>
	    </table>
	</div>
	
	
</div>