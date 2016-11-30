<h1 class="forum-16">Forum</h1>
<div id="content">
	<div  class="forum">
		<h2>
		Messages
			<a href="${message}" title="new message" class="new-16">New message</a>
		</h2>
	    <table border="1">
	    	<thead>
	    	   <tr>
		    		<th>Message / Title</th>
		    		<th>Answers / Views</th>
		    		<th>Author</th>
	    	   </tr>
	    	</thead>
	    	<tbody>
	    	  
	    	</tbody>
	    	
	    </table>
	</div>
</div>
<script>
   app.ready(function(){
	   $('tbody:not(:has(*))').append("<tr><td class='empty' valign='top' colspan='3'>no message</td></tr>"); 
   });
</script>