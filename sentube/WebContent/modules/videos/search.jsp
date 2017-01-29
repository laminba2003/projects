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
 
 <script>
document.addEventListener("DOMContentLoaded", () => {
    app.get("https://www.googleapis.com/youtube/v3/search?key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&q=${query}&type=video&part=snippet&order=date&maxResults=50",result => {
		const videos = new Array();
		var length = result.items.length, id = "";
	    for(var i=0;i<length;i++) {
			const item = result.items[i];
			id += i < length-1 ? item.id.videoId +"," : item.id.videoId;
			videos.push({id : item.id.videoId, title : item.snippet.title,channel : item.snippet.channelTitle});
		}
		app.get("https://www.googleapis.com/youtube/v3/videos?key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&id="+id+"&part=contentDetails,statistics", result => {
			length = result.items.length;
	   	 	for(i=0;i<length;i++) {
	    		const duration = result.items[i].contentDetails.duration.substring(2, result.items[i].contentDetails.duration.length);
	    		const minutes = duration.substring(0, duration.indexOf('M'));
				const seconds = duration.substring(duration.indexOf('M')+1, duration.indexOf('S'));
	    		videos[i].duration = (minutes.length  ? minutes : ("0"+minutes)) + " : " + (seconds.length > 1 ? seconds : ("0"+seconds));
	    		videos[i].viewCount = result.items[i].statistics.viewCount.replace(/\B(?=(\d{3})+\b)/g, ",");
	    	}
	   	 	const div = $(".videos");
		    page.render(div,videos,thumbnail => {
		    	div.fadeTo(1000,1);
		    	thumbnail.addClass("animated flip");
		    });
		});
	});
	$("#search input[type=text]").val("${query}");
});
 </script> 