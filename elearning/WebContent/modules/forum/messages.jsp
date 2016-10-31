<%@ taglib prefix="s" uri="/struts-tags"%>
<h1><span class="forum-title">Forum : ${forum}</span>
</h1>

<div class="forums">
	
	<div class="forum forum-messages">
		<h2>
		<span class="forum-title">Forum :  ${forum}</span>
		 <s:if test="%{#session['user']!=null}">
			<a href="forums/${forum}/nouveau">Nouveau message</a>
		</s:if>
		</h2>
		<table border="1" class="paginated" data-rows="10">
	    	<thead>
	    	   <tr>
		    		<th>Message / Intitulé</th>
		    		<th>Réponses / Vues</th>
		    		<th>Auteur</th>
	    	   </tr>
	    	</thead>
	    	<tbody>
	    	     <s:iterator value="%{getMessages(#session['forum'])}">
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

<script>
   $('tbody:not(:has(*))').append("<tr><td class='empty' valign='top' colspan='3'>Pas de message</td></tr>");
</script>