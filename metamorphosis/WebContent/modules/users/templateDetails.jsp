<h1 class="preferences-32">Preferences/Templates/${id}/Details</h1>
<div id="content">

	<div class="template templateDetails">
	  <img class="selected" src="modules/users/images/selected-32.png" style="display:${template==selected.name?'inline-block':'none'}"/>
	  <img src="templates/${selected.id}/thumbnail.png"/>
	  <div>
	  <span>Name : ${selected.name} <a href="users/preferences">[Back]</a> <a href="users/preferences/templates/select?id=${selected.id}" style="display:${template==selected.name?'none':'inline-block'}">[Select]</a></span>
	  <span>Author : ${selected.author}</span>
	  <span>Author Email : ${selected.authorEmail}</span>
	  <span>Author Url : ${selected.authorUrl}</span>
	  <span>Creation Date : ${selected.creationDate}</span>
	  <span>Copyright : ${selected.copyright}</span>
	  <span>License : ${selected.license}</span>
	  <span>Version : ${selected.version}</span>
	  </div>
	</div>

</div>