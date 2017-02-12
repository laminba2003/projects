<div class="search-results">
<div class="videos">
 <template type="text/x-dust-template">
 <h1>Search Results</h1>
  {#.}
    <div>
	  <a href="videos/watch?v={id}">
	   <div class="thumbnail" style="background:url(https://i.ytimg.com/vi/{id}/mqdefault.jpg);background-position:center;background-size:contain;background-repeat:no-repeat;">  		   	     
	     <span class="duration">{duration}</span>
	   </div>  		   
	   <div class="description">
	   	<p class="view-count"><span>{viewCount} views</span></p>
	    <p class="title"><span>{title}</span></p>
	   </div>
	 </a>
    </div>
  {/.}
  </template>	
 </div>
 </div>
 <!-- search js file include -->
 
 <script src="${js}/search.js"></script>
  
 <script>
document.addEventListener("DOMContentLoaded", () => {
	search("${query}");
});
 </script> 