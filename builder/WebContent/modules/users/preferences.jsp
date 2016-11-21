<%@ taglib prefix="s" uri="/struts-tags"%>
<h1 class="preferences-32">Preferences</h1>
<div id="content">

<fieldset class="preferences">
	<legend>Templates</legend>
	<div id="templates">
	
	   <s:iterator value="#application.templateManager.templates">
	   
	      <div class="template" style="display:${backend?'inline-block':'none'}">
	      <img class="selected" src="${images}/selected-32.png" style="display:${template==name?'inline-block':'none'}"/>
		  <a>
		  <img src="${thumbnail}"/>
		  </a>
		  <div class="info">
		  <span class="template-name">${name}</span>
		  <span class="template-author">${author}</span>
		  <span style="display:${template==name?'none':'inline-block'}"><a title="select" href="${module.url}/preferences/templates/select?id=${id}">[Select]</a></span>
		  </div>
		  <div class="templateDetails">
		      	  <span>Name : ${name}</span>
				  <span>Author : ${author}</span>
				  <span>Author Email : ${authorEmail}</span>
				  <span>Author Url : ${authorUrl}</span>
				  <span>Creation Date : ${creationDate}</span>
				  <span>Copyright : ${copyright}</span>
				  <span>License : ${license}</span>
				  <span>Version : ${version}</span>
		 </div>
		</div>
		
	   </s:iterator>
			
	</div>
</fieldset>

</div>
<script type="text/javascript" src="${js}/preferences.js"></script>