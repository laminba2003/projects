<%@ taglib prefix="s" uri="/struts-tags"%>
<h1>Forum : <a  href="forums/<s:property value='message.forum'/>/messages" class="forum-title"><s:property value="message.forum"/></a> -> Message</h1>
<script src="ckeditor/ckeditor.js"></script>
<div class="forums">
    <div class="message-info">
    <img src="images/user_64.png"/>
     <div id="title">
      <span class="property"><b>Intitulé : </b></span>
		<span><s:property value="message.title"/> </span>
      <span class="property"><b>Auteur : </b></span>
		<span><s:property value="message.author"/> </span>
		<br/>
		<span class="property"><b>Créé le : </b></span>
		<span class="date"><s:date name="message.creationDate" format="dd/MM/yyyy" /> </span>
		<span class="property"><b>Heure : </b></span>
		<span class="date"><s:date name="message.creationDate" format="hh:mm" /> </span>
		
	 </div>
	</div>
	 
	 <div>
	 	<div>
	 		<s:property value="message.content" escapeHtml="false"/>
	 	</div>
	 	<h2 class="title">Réponses [<s:property value="message.answerCount"/>]</h2>
	 	<div class="answers">
	 	
		   <s:iterator begin="0"  value="message.answers">
			    	 
				<div class="message-info">
				   <img src="images/user_64.png"/>
				    <div id="title">
						<span class="property"><b>Auteur : </b></span>
						<span class="author"><s:property value="author"/> </span>
						<span class="property"><b>Créé le : </b></span>
						<span class="date"><s:date name="creationDate" format="dd/MM/yyyy" /> </span>
						<br/>
						<span class="property"><b>Heure : </b></span>
						<span class="date"><s:date name="creationDate" format="hh:mm" /> </span>
				 	</div>
				</div>
				
				 <div>
	 				<s:property value="content" escapeHtml="false"/>
	 			</div>
	 			<hr/>
		    </s:iterator>
		
	 	</div>
	 <s:if test="%{#session['user']!=null}">
	 	<h2 class="title">Poster une réponse</h2>
	 	<div> 
		 	 <s:form  theme="simple" namespace="/forums"  action="repondre/%{message.forum}">
		 	 <s:hidden name="answer.messageId" value="%{message.id}"></s:hidden>
		 	 <s:hidden name="forum" value="%{message.forum}"></s:hidden>
	         <s:hidden name="answer.author" value="%{#session.user}"></s:hidden>
	         <div class="editor">
				 <s:textarea  id="editor1" name="answer.content"></s:textarea>
			 </div>
			 <script type="text/javascript">
				CKEDITOR.replace( 'editor1' );
				CKEDITOR.config.skin = 'flat';
			 </script>
			 <br>
			 <s:submit  id="submit" value="Envoyer" />
			</s:form>
	 	</div>
	 </s:if>
	 </div>		
</div>
<link rel="stylesheet" href="ckeditor/plugins/codesnippet/lib/highlight/styles/googlecode.css">
<script src="ckeditor/plugins/codesnippet/lib/highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
<script type="text/javascript"> 
 $('.answers:not(:has(*))').append("<span class='empty'>aucune réponse</span>");
</script>