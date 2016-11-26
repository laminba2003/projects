<%@ taglib prefix="s" uri="/struts-tags"%>
<h1 class="templates-16">Templates</h1>
<div id="extensions">
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
<input/>
</div>
<div id="share">
<span>Share : </span>
<input type="file" accept="application/zip"/>
<input type="submit" value="Upload"/>
</div>
<fieldset class="extensions-details">
	<div id="extensions">
	
	   <s:iterator value="#application.templateManager.templates">
	   
	      <div class="extension">
	      <a>
		  <img src="${thumbnail}"/>
		  </a>
		  <div class="info">
		  <span class="extension-name">${name}  <a title="download" class="download-16"></a><a title="copy link" class="link-16"></a><a title="details" class="info-16"></a></span>
		  <span>${author}</span>
		  <span>type : ${type}</span>
		  <span>License : ${license}</span>
		  <span>downloads : 15600</span>
		  </div>
		  <div class="extension-description">${description!=null ? description : "no description provided"}</div>
		  <div class="extensionDetails">
		      	  <span>Name : ${name}</span>
		          <span>Type : ${type}</span>
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
