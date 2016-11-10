<%@ taglib prefix="s" uri="/struts-tags"%>
<h1 class="icon-32">Builder/Templates
<a class="upload-16">Upload Template</a>
<a class="new-16">Create Template</a>
</h1>
<div id="content">
<fieldset class="extensions-details">
	<div id="extensions">
	
	   <s:iterator value="#application.templateManager.templates">
	   
	      <div class="extension">
	      <a>
		  <img src="templates/${id}/thumbnail.png"/>
		  </a>
		  <div class="info">
		  <span class="extension-name">${name}</span>
		  <span class="extension-author">${author}</span>
		  <span><a href="builder/templates/edit?id=${id}">[Edit]</a></span>
		  </div>
		  <div class="extensionDetails">
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
<script type="text/javascript" src="${js}/extensions.js"></script>