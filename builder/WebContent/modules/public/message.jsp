<h1 class="forum-16">Forum -> New Message</h1>
<script src="${js}/ckeditor/ckeditor.js"></script>
<div id="content" class="forum">
<h2>Compose
<a href="${forum}" title="messages" class="forum-16">Messages</a>
</h2>
<form action="${forum}">
<div class="forum-message">
  		 <div id="title">
			<span>Title : </span>
			<input type="text"/>
		 </div>
		 <div class="editor">
			<textarea  id="editor"></textarea>
		</div><br/>
		<div>	
			<input type="submit" title="send" value="Send" />
		</div>
</div>
</form>
</div>
<script type="text/javascript">
	app.ready(function(){
		app.wait();
		CKEDITOR.config.skin = 'moono-dark';
		CKEDITOR.replace('editor');
		CKEDITOR.on("instanceReady",function() {
			app.release();
		});
	});
</script>