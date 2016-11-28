<h1>Forum -> New Message</h1>
<script src="${js}/ckeditor/ckeditor.js"></script>
<div id="content">
<div  class="forum-message">
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
</div>
<script type="text/javascript">
	app.wait();
	CKEDITOR.config.skin = 'flat';
	CKEDITOR.replace( 'editor1' );
	CKEDITOR.on("instanceReady",function() {
		app.release();
	});
</script>