<h1 class="forum-16">Forum -> New Message</h1>
<script src="${js}/ckeditor/ckeditor.js"></script>
<div id="content" class="forum">
<h2>Compose<a href="${module.url}/forum" class="forum-16">Messages</a></h2>
<form action="${module.url}/forum">
<div class="forum-message">
  		 <div id="title">
			<span>Title : </span>
			<input type="text"/>
		 </div>
		 <div class="editor">
			<textarea  id="editor1"></textarea>
		</div><br/>
		<div>	
			<input type="submit" value="Send" />
		</div>
</div>
</form>
</div>
<script type="text/javascript">
	app.ready(function(){
		app.wait();
		CKEDITOR.config.skin = 'flat';
		CKEDITOR.replace('editor1');
		CKEDITOR.on("instanceReady",function() {
			app.release();
		});
	});
</script>