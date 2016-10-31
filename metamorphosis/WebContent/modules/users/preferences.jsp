<%@ taglib prefix="s" uri="/struts-tags"%>
<h1 class="preferences-32">Preferences</h1>
<div id="content">

<fieldset class="preferences">
	<legend>Templates</legend>
	<div id="templates">
	
	   <s:iterator value="#application.templateManager.templates">
	   
	      <div class="template">
	      <img class="selected" src="modules/users/images/selected-32.png" style="display:${template==name?'inline-block':'none'}"/>
		  <a href="users/preferences/templates/details?id=${id}">
		  <img src="templates/${id}/thumbnail.png"/>
		  </a>
		  <div>
		  <span class="template-name">${name}</span>
		  <span class="template-author">${author}</span>
		  <span><a href="users/preferences/templates/select?id=${id}">[Select]</a></span>
		  </div>
		</div>
		
	   </s:iterator>
			
	</div>
</fieldset>

</div>