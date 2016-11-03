<%@ taglib prefix="s" uri="/struts-tags"%>
<h1 class="template-32">Templates</h1>
<div id="content">
<fieldset class="extensions-details">
	<div id="extensions">
	
	   <s:iterator value="#application.templateManager.templates">
	   
	      <div class="extension">
	      <img class="selected" src="modules/users/images/selected-32.png" style="display:${template==name?'inline-block':'none'}"/>
		  <a>
		  <img src="templates/${id}/thumbnail.png"/>
		  </a>
		  <div>
		  <span class="extension-name">${name}</span>
		  <span class="extension-author">${author}</span>
		  </div>
		</div>
		
	   </s:iterator>
			
	</div>
</fieldset>
</div>