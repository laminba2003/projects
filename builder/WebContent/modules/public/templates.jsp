<%@ taglib prefix="s" uri="/struts-tags"%>
<h1 class="templates-16">Templates</h1>
<div id="extensions-list">
<div id="extensions-actions">
<span class="templates-16">category :</span>
<select>
 <option>application</option>
 <option>website</option>
</select>
<span>type :</span>
<select>
 <option>front-end</option>
 <option>back-end</option>
 <option>both</option>
</select>
<span>version :</span>
<select>
 <option>1.0</option>
</select>
<div id="search">
<span>Search : </span>
<input title="search"/>
</div>
<div id="share">
<span>Share : </span>
<input type="file" title="browse" accept="application/zip"/>
<input type="submit" title="upload" value="Upload"/>
</div>
</div>
<fieldset class="extensions-details">
	<div id="extensions">
	
	   <s:iterator value="#application.templateManager.templates">
	   
	      <div class="extension">
	      <a>
		  <img  src="${thumbnail}"/>
		  </a>
		  <div class="info">
		  <span class="extension-name">${name}  <a title="download" class="download-16"></a><a title="copy link" class="link-16"></a><a title="details" class="info-16"></a></span>
		  <span>${author}</span>
		  <span>type : ${type}</span>
		  <span>version : ${version}</span>
		  </div>
		  <div class="extension-description"><b>Tags</b> : <i>jsp, html, css, js</i></div>
		</div>
		
	   </s:iterator>
			
	</div>
</fieldset>
</div>