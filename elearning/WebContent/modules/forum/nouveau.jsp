<%@ taglib prefix="s" uri="/struts-tags"%>
<h1>Forum : <a href="<s:property value='forum'/>/messages" id="forum"><s:property value="forum"/></a> -> Nouveau Message</h1>
<script src="ckeditor/ckeditor.js"></script>
<script type="text/javascript">
CKEDITOR.config.skin = 'flat';
 $("#forum").html($("#forum").html().replace("Cplusplus","C++"));
 function validate() {
	 if($("#message-title").val().trim()=='') {
		 alert("entrez l'intitulé");
		 $("#message-title").focus();
		 return false;
	 }
	 if(CKEDITOR.instances.editor1.getData().trim()=='') {
		 alert("entrez le contenu");
		 CKEDITOR.instances.editor1.focus();
		 return false;
	 }
	 return true;
 }
</script>
<div class="forums">
  <s:form onsubmit="return validate();" theme="simple" namespace="/forums"  action="creer/%{forum}">
        <s:hidden name="message.forum" value="%{forum}"></s:hidden>
        <s:hidden name="message.author" value="%{#session.user}"></s:hidden>
		 <div id="title">
			<span>Intitulé : </span>
			<s:textfield id="message-title" type="text" placeholder="Intitulé"  name="message.title"/>
		 </div>
		 <div class="editor">
			<s:textarea  id="editor1" name="message.content"></s:textarea>
		</div><br/>
		<div>	
			<input style="cursor:pointer"  id="submit" type="submit" value="Envoyer" />
		</div>
	</s:form>
</div>
<script type="text/javascript">
	$(".wait").show();
	CKEDITOR.replace( 'editor1' );
	CKEDITOR.on("instanceReady",function() {
		$(".wait").hide();
	});
</script>