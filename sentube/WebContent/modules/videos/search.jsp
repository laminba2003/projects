<div class="page-title">
<a>Search Results</a>
</div>
<div class="search-results">
<div class="videos">
 <template type="text/x-dust-template">
  {#.}
    <div class="video">
	  <a href="videos/watch?v={id}">
	   <div class="thumbnail">
	     <img src="https://i.ytimg.com/vi/{id}/mqdefault.jpg"/>  
	     <span class="index">{index}</span>  		   	     
	     <span class="duration">{duration}</span>
	   </div>  		   
	   <div class="description">
	    <p class="title"><span>{title}</span></p>
	    <p class="channel"><span>{channel}</span></p>
	   	<p><span class="publishedAt">{publishedAt}</span> - <span class="view-count">{viewCount} views</span></p>
	   	<p class="video-description"><span>{description}</span></p>
	   </div>
	 </a>
    </div>
  {/.}
  <div class="pager">
  </div>
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