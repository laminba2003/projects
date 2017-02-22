<div class="page-title">
<a>Search Results</a>
</div>
<div class="search-results">
<div class="videos">
 <template type="text/x-dust-template">
  {#.}
    <div>
	  <a href="videos/watch?v={id}">
	   <div class="thumbnail">
	     <img src="https://i.ytimg.com/vi/{id}/mqdefault.jpg"/>   		   	     
	     <span class="duration">{duration}</span>
	   </div>  		   
	   <div class="description">
	    <p class="title"><span>{title}</span></p>
	   	<p class="view-count"><span>{viewCount} views</span></p>
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