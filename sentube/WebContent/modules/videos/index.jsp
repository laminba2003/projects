<div class="page-title">
<a>Music</a>
</div>
<div>
<div class="videos">
 <template type="text/x-dust-template">
 <h1>{title}<a title="Previous" class="video-nav-left" href="#"><i class="fa fa-angle-left"></i></a><a title="Next" class="video-nav-right" href="#"><i class="fa fa-angle-right"></i></a></h1>
  {#videos}
    <div>
	  <a href="videos/watch?v={id}" title="{title}">
	   <div class="thumbnail" style="background:url(https://i.ytimg.com/vi/{id}/mqdefault.jpg);background-position:center;background-size:contain;background-repeat:no-repeat;"> 		   	     
	     <span class="duration">{duration}</span>
	   </div>  		   
	   <div class="description">
	   	<p class="view-count"><span>{viewCount} views</span></p>
	    <p class="title"><span>{title}</span></p>
	   </div>
	 </a>
    </div>
  {/videos}
  </template>	
 </div>
 
 <div class="videos">
 <template type="text/x-dust-template">
 <h1>{title}<a title="Previous" class="video-nav-left" href="#"><i class="fa fa-angle-left"></i></a><a title="Next" class="video-nav-right" href="#"><i class="fa fa-angle-right"></i></a></h1>
  {#videos}
    <div>
	  <a href="videos/watch?v={id}" title="{title}">
	   <div class="thumbnail" style="background:url(https://i.ytimg.com/vi/{id}/mqdefault.jpg);background-position:center;background-size:contain;background-repeat:no-repeat;">  		   	     
	     <span class="duration">{duration}</span>
	   </div>  		   
	   <div class="description">
	   	<p class="view-count"><span>{viewCount} views</span></p>
	    <p class="title"><span>{title}</span></p>
	   </div>
	 </a>
    </div>
  {/videos}
  </template>	
 </div>
 </div>
 
  <!-- index js file include -->
 
 <script src="${js}/index.js"></script>