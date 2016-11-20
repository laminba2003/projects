<%@ taglib prefix="s" uri="/struts-tags"%>
<h1>Modules</h1>
<div id="content">
<span>category :</span>
<select>
 <option>application</option>
 <option>website</option>
</select>
<span>type :</span>
<select>
 <option>front-end</option>
 <option>back-end</option>
</select>
<fieldset class="extensions-details">
	<div id="extensions">
	
	   <s:iterator value="#application.moduleManager.modules">
	   
	      <div class="extension">
	      <a>
		  <img src="${images}/module-128.png"/>
		  </a>
		  <div class="info">
		  <span class="extension-name">${name} <a title="downlad" class="download-16"></a></span>
		  <span class="extension-author">${author}</span>
		  </div>
		  <div class="extensionDetails">
		          <span>Name : ${name}</span>
		          <span>Type : ${type}</span>
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