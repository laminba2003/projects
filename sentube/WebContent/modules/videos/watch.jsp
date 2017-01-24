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
  	 <p>{description|s}</p>
  	</template>
  </div>
  
  <div class="video-comments">
    <template type="text/x-dust-template">
  	 <h1>COMMENTS - {commentCount}</h1>
  	 {#comments}
  	 <div class="video-comment">
  	     <img src="{photo}"/>
  	     <div>
  	        <span>{author}</span>
         	<p>{text|s}</p>
         </div>
  	 </div>
  	 {/comments}
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
  
 </div>
 
 <script>
 
 document.addEventListener("DOMContentLoaded", () => {
    var video = {};
    var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
	app.get("https://www.googleapis.com/youtube/v3/videos?id=${id}&key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&part=snippet,statistics",info => {
		video.title = info.items[0].snippet.title;
		document.title = video.title; 
		video.publishedAt = new Date(info.items[0].snippet.publishedAt).toLocaleDateString("en-US",options);
		video.description = info.items[0].snippet.description;
		video.viewCount = info.items[0].statistics.viewCount.replace(/\B(?=(\d{3})+\b)/g, ",");
		video.commentCount = info.items[0].statistics.commentCount.replace(/\B(?=(\d{3})+\b)/g, ",");
		app.get("https://www.googleapis.com/youtube/v3/channels?id="+info.items[0].snippet.channelId+"&key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&part=snippet,statistics",channel => {
			video.channel = channel.items[0].snippet.title;
			video.photo = channel.items[0].snippet.thumbnails.medium.url;
			video.subscriberCount = channel.items[0].statistics.subscriberCount.replace(/\B(?=(\d{3})+\b)/g, ",");
			page.render($(".watcher"),video);
			page.render($(".video-metadata"),video);
			app.get("https://www.googleapis.com/youtube/v3/search?key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&channelId="+info.items[0].snippet.channelId+"&type=video&part=snippet&order=date&maxResults=20",results => {
				const videos = new Array();
				var id = "";
			    for(var i=0;i<results.items.length;i++) {
					const item = results.items[i];
					id += i < results.items.length-1 ? item.id.videoId +"," : item.id.videoId;
					videos.push({id : item.id.videoId, title : item.snippet.title,channel : item.snippet.channelTitle,thumbnail : item.snippet.thumbnails.medium.url});
				}
			    app.get("https://www.googleapis.com/youtube/v3/videos?key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&id="+id+"&part=contentDetails",results => {
			      for(i=0;i<results.items.length;i++) {
			    	const duration = results.items[i].contentDetails.duration.substring(2, results.items[i].contentDetails.duration.length);
					const minutes = duration.substring(0, duration.indexOf('M'));
					const seconds = duration.substring(duration.indexOf('M')+1, duration.indexOf('S'));
			    	videos[i].duration = (minutes.length ? minutes : ("0"+minutes)) + " : " + (seconds.length > 1 ? seconds : ("0"+seconds));
			      }
			      page.render($(".thumbnails"),videos,thumbnail => thumbnail.addClass("animated flip"));
			      app.get("https://www.googleapis.com/youtube/v3/commentThreads?key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&videoId=${id}&part=snippet&maxResults=20",results => {
			    	  const comments = new Array();
			    	  for(i=0;i<results.items.length;i++) {
					      comments.push({author : results.items[i].snippet.topLevelComment.snippet.authorDisplayName, photo : results.items[i].snippet.topLevelComment.snippet.authorProfileImageUrl,text : results.items[i].snippet.topLevelComment.snippet.textDisplay});
					  }
			    	  page.render($(".video-comments"),{commentCount : video.commentCount,comments:comments});
				  });
			   });
			});	
		});
	});
 });
 
 </script> 