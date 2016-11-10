<%@ taglib prefix="s" uri="/struts-tags"%>
<h1 class="icon-32">Builder/Modules
<a class="upload-16">Upload Module</a>
<a class="new-16">Create Module</a>
</h1>
<div id="content">
<fieldset class="extensions-details">
	<div id="extensions">
	
	   <s:iterator value="#application.moduleManager.modules">
	   
	      <div class="extension">
	      <a>
		  <img src="${images}/module-128.png"/>
		  </a>
		  <div class="info">
		  <span class="extension-name">${name}</span>
		   <span class="extension-author">${author}</span>
		  <span><a href="builder/modules/edit?id=${id}">[Edit]</a></span>
		  </div>
		  <div class="extensionDetails">
		      	  <span>Name : ${name}</span>
		      	  <span>Url : /${url}</span>
		      	  <span>Home : ${home}</span>
		      	  <span>Main : ${main}</span>
		      	  <span>Visible : ${visible}</span>
		      	  <span>Administrable : ${administrable}</span>
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