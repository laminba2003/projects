<div class="videos">
 <template type="text/x-dust-template">
  {#.}
       <a href="videos/watch?v={id}">
  		<div>
  		   <img src="https://i.ytimg.com/vi/{id}/mqdefault.jpg"/>
  		   <div>
  		     <span>{title}</span>
  		     <span>{channel}</span>
  		   </div>
    	</div>
        </a>
       {/.}
  </template>	
 </div>
 
 <script>
 
 document.addEventListener("DOMContentLoaded", () => {
    const url = "https://www.googleapis.com/youtube/v3/search?key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&q=${query}&part=snippet&order=date&maxResults=50";
	app.get(url,results => {
		const videos = new Array();
	    for(var i=0;i<results.items.length;i++) {
			const item = results.items[i];
			videos.push({id : item.id.videoId, title : item.snippet.title,channel : item.snippet.channelTitle,thumbnail : item.snippet.thumbnails.medium.url});
		}
	    page.render($(".videos"),videos, thumbnail => thumbnail.addClass("animated flip"));
	});
	$("#search input[type=text]").val("${query}");
});

 
 </script> 