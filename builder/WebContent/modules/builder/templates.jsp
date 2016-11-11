<%@ taglib prefix="s" uri="/struts-tags"%>
<h1 class="icon-32">Builder/Templates
<a title="upload" class="upload-16">Upload</a>
<a title="create" class="new-16">Create</a>
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
		  <span class="extension-name">${name}  <a href="builder/templates/edit?id=${id}" title="edit" class="edit-16"></a><a title="delete" class="delete-16"></a><a title="download" class="download-16"></a><a title="share" class="share-16"></a></span>
		  <span class="extension-author">${author}</span>
		  </div>
		  <div class="extensionDetails">
		      	  <span>Name : ${name}</span>
				  <span>Author : ${author}</span>
				  <span>Author Email : ${authorEmail}</span>
				  <span>Author Url : ${authorUrl}</span>
				  <span>Creation Date : ${creationDate}</span>
				  <span>Description : ${description}</span>
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