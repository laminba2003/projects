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
    app.get("https://www.googleapis.com/youtube/v3/search?key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&q=${query}&type=video&part=snippet&order=date&maxResults=50",results => {
		const videos = new Array();
		var id = "";
	    for(var i=0;i<results.items.length;i++) {
			const item = results.items[i];
			id += i < results.items.length-1 ? item.id.videoId +"," : item.id.videoId;
			videos.push({id : item.id.videoId, title : item.snippet.title,channel : item.snippet.channelTitle});
		}
		app.get("https://www.googleapis.com/youtube/v3/videos?key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&id="+id+"&part=contentDetails", results => {
	   	 	for(i=0;i<results.items.length;i++) {
	    		const duration = results.items[i].contentDetails.duration.substring(2, results.items[i].contentDetails.duration.length);
	    		const minutes = duration.substring(0, duration.indexOf('M'));
				const seconds = duration.substring(duration.indexOf('M')+1, duration.indexOf('S'));
	    		videos[i].duration = (minutes.length  ? minutes : ("0"+minutes)) + " : " + (seconds.length > 1 ? seconds : ("0"+seconds));
	    	}
	   	    const div = $(".videos").fadeTo(2000,1);
	    	page.render(div,videos,thumbnail => thumbnail.addClass("animated flip"));
		});
	});
	$("#search input[type=text]").val("${query}");
});

 
 </script> 