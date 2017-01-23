<div class="videos">
 <template type="text/x-dust-template">
 <h1>Search Results</h1>
  {#.}
       <a href="videos/watch?v={id}">
  		<div>
  		   <img src="https://i.ytimg.com/vi/{id}/mqdefault.jpg"/>
  		   <span>{duration}</span>
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
    const url = "https://www.googleapis.com/youtube/v3/search?key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&q=${query}&type=video&part=snippet&order=date&maxResults=50";
	app.get(url,results => {
		const videos = new Array();
		var id = "";
	    for(var i=0;i<results.items.length;i++) {
			const item = results.items[i];
			id += i < results.items.length-1 ? item.id.videoId +"," : item.id.videoId;
			videos.push({id : item.id.videoId, title : item.snippet.title,channel : item.snippet.channelTitle});
		}
		const url = "https://www.googleapis.com/youtube/v3/videos?key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&id="+id+"&part=contentDetails";
		app.get(url,results => {
	   	 	for(i=0;i<results.items.length;i++) {
	    		const duration = results.items[i].contentDetails.duration.substring(2, results.items[i].contentDetails.duration.length);
	    		const minutes = duration.substring(0, duration.indexOf('M'));
				const secondes = duration.substring(duration.indexOf('M')+1, duration.indexOf('S'));
	    		videos[i].duration = (minutes.length  ? minutes : ("0"+minutes)) + " : " + (secondes.length > 1 ? secondes : ("0"+secondes));
	    	}
	    	page.render($(".videos"),videos,thumbnail => thumbnail.addClass("animated flip"));
		});
	});
	$("#search input[type=text]").val("${query}");
});

 
 </script> 