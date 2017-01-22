<div>
 <div class="video-player">
  
  <div class="video-container">
     <iframe width="853" height="200" src="//www.youtube.com/embed/${id}?rel=0" frameborder="0" allowfullscreen></iframe>
  </div>
  
   <div class="watcher">
     <template type="text/x-dust-template">
  	   <h1>{title}</h1>
  	   <div class="photo">
  	    <img src="{photo}"/>
  	   </div>
  	 <div class="singer">
  	     <a>{channel}</a><br>
  	     <span class="subscribe-button">Subscribe</span>
  	     <span class="subscribe-count">{subscriberCount}</span>
  	 </div>
  	 <div class="views">
  	      <h1>{viewCount} views</h1>
  	 </div>
  	 </template>
  </div>
  
  
  <div class="video-metadata">
    <template type="text/x-dust-template">
  	 <h1>Published on {publishedAt}</h1>
  	 <p>{description}</p>
  	</template>
  </div>
  
  <div class="video-comments">
    <template type="text/x-dust-template">
  	 <h1>COMMENTS - {commentCount}</h1>
  	</template>
  </div>
  
  </div>
  
  <div class="thumbnails">
    <template type="text/x-dust-template">
    <span>Up next</span>
       {#.}
       <a href="videos/watch?v={id}">
  		<div>
  		   <img src="{thumbnail}"/>
  		   <div>
  		     <span>{title}</span>
  		     <span>{channel}</span>
  		   </div>
    	</div>
        </a>
       {/.}
    </template>
  </div>
  
 </div>
 
 <script>
 
 document.addEventListener("DOMContentLoaded", () => {
    var url = "https://www.googleapis.com/youtube/v3/videos?id=${id}&key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&part=snippet,contentDetails,statistics,status";
    var object = {};
	app.get(url,video => {
		object.title = video.items[0].snippet.title;
		object.publishedAt = video.items[0].snippet.publishedAt;
		object.description = video.items[0].snippet.description;
		object.viewCount = video.items[0].statistics.viewCount;
		object.commentCount = video.items[0].statistics.commentCount;
		url = "https://www.googleapis.com/youtube/v3/channels?id="+video.items[0].snippet.channelId+"&key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&part=snippet,contentDetails,statistics,status";
		app.get(url,channel => {
			object.channel = channel.items[0].snippet.title;
			object.photo = channel.items[0].snippet.thumbnails.medium.url;
			object.subscriberCount = channel.items[0].statistics.subscriberCount;
			page.render($(".watcher"),object);
			page.render($(".video-metadata"),object);
			page.render($(".video-comments"),object);
			url = "https://www.googleapis.com/youtube/v3/search?key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&channelId="+video.items[0].snippet.channelId+"&part=snippet&order=date&maxResults=20";
			app.get(url,results => {
				const videos = new Array();
			    for(var i=0;i<results.items.length;i++) {
					const item = results.items[i];
					videos.push({id : item.id.videoId, title : item.snippet.title,channel : item.snippet.channelTitle,thumbnail : item.snippet.thumbnails.medium.url});
				}
			    page.render($(".thumbnails"),videos);
			});
		});
	});
 });
 
 </script> 