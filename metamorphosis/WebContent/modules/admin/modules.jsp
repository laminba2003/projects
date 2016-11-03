<%@ taglib prefix="s" uri="/struts-tags"%>
<h1 class="module-32">Modules</h1>
<div id="content">
<fieldset class="extensions-details">
	<div id="extensions">
	
	   <s:iterator value="#application.moduleManager.modules">
	   
	      <div class="extension">
	      <a>
		  <img src="modules/admin/images/module-128.png"/>
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
