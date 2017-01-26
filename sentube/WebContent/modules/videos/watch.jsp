<div>
 <div class="video-player">
  
  <div class="video-container">
     <iframe style="display:none" width="853" height="200" src="//www.youtube.com/embed/${id}?rel=0" frameborder="0" allowfullscreen></iframe>
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
  	      <div>
  	      <span class="like">{likeCount}</span>
  	      <span class="dislike">{dislikeCount}</span>
  	      </div>
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
  	        <span>{author} <span>{date}</span></span>
         	<p>{text|s}</p>
         </div>
  	 </div>
  	 {/comments}
  	  <a class="show-more">Show more</a>
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
  		     <span>{viewCount} views</span>
  		   </div>
    	</div>
        </a>
       {/.}
    </template>
  </div>
  
 </div>
 
 <script>
 
String.prototype.linkify = function() {

    // http://, https://, ftp://
    var urlPattern = /\b(?:https?|ftp):\/\/[a-z0-9-+&@#\/%?=~_|!:,.;]*[a-z0-9-+&@#\/%=~_|]/gim;

    // www. sans http:// or https://
    var pseudoUrlPattern = /(^|[^\/])(www\.[\S]+(\b|$))/gim;

    // Email addresses
    var emailAddressPattern = /[\w.]+@[a-zA-Z_-]+?(?:\.[a-zA-Z]{2,6})+/gim;

    return this.replace(urlPattern, '<a target="_blank" href="$&">$&</a>')
        .replace(pseudoUrlPattern, '$1<a target="_blank" href="http://$2">$2</a>')
        .replace(emailAddressPattern, '<a target="_blank" href="mailto:$&">$&</a>');
};
 
document.addEventListener("DOMContentLoaded", () => {
    var video = {};
    var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
	app.get("https://www.googleapis.com/youtube/v3/videos?id=${id}&key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&part=snippet,statistics",info => {
		video.title = info.items[0].snippet.title;
		document.title = video.title; 
		video.publishedAt = new Date(info.items[0].snippet.publishedAt).toLocaleDateString("en-US",options);
		video.description = info.items[0].snippet.description.linkify();
		video.viewCount = info.items[0].statistics.viewCount.replace(/\B(?=(\d{3})+\b)/g, ",");
		video.commentCount = info.items[0].statistics.commentCount.replace(/\B(?=(\d{3})+\b)/g, ",");
		video.likeCount = info.items[0].statistics.likeCount.replace(/\B(?=(\d{3})+\b)/g, ",");
		video.dislikeCount = info.items[0].statistics.dislikeCount.replace(/\B(?=(\d{3})+\b)/g, ",");
		app.get("https://www.googleapis.com/youtube/v3/channels?id="+info.items[0].snippet.channelId+"&key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&part=snippet,statistics",channel => {
			video.channel = channel.items[0].snippet.title;
			video.photo = channel.items[0].snippet.thumbnails.medium.url;
			video.subscriberCount = channel.items[0].statistics.subscriberCount.replace(/\B(?=(\d{3})+\b)/g, ",");
			app.get("https://www.googleapis.com/youtube/v3/search?key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&channelId="+info.items[0].snippet.channelId+"&type=video&part=snippet&order=date&maxResults=20",result => {
				const videos = new Array();
				var length = result.items.length, id = "";
			    for(var i=0;i<length;i++) {
					const item = result.items[i];
					id += i < length-1 ? item.id.videoId +"," : item.id.videoId;
					videos.push({id : item.id.videoId, title : item.snippet.title,channel : item.snippet.channelTitle,thumbnail : item.snippet.thumbnails.medium.url});
				}
			    app.get("https://www.googleapis.com/youtube/v3/videos?key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&id="+id+"&part=contentDetails,statistics",result => {
			      length = result.items.length;	
			      for(i=0;i<length;i++) {
			    	const duration = result.items[i].contentDetails.duration.substring(2, result.items[i].contentDetails.duration.length);
					const minutes = duration.substring(0, duration.indexOf('M'));
					const seconds = duration.substring(duration.indexOf('M')+1, duration.indexOf('S'));
			    	videos[i].duration = (minutes.length ? minutes : ("0"+minutes)) + " : " + (seconds.length > 1 ? seconds : ("0"+seconds));
			    	videos[i].viewCount = result.items[i].statistics.viewCount.replace(/\B(?=(\d{3})+\b)/g, ",");
			      }
			      page.render($(".watcher"),video);
				  page.render($(".video-metadata"),video);
				  page.render($(".thumbnails"),videos,thumbnail => thumbnail.addClass("animated flip"));
			      $(".video-container iframe").show();
			      app.get("https://www.googleapis.com/youtube/v3/commentThreads?key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&videoId=${id}&part=snippet&maxResults=20",result => {
			    	  var comments = new Array();
			    	  length = result.items.length;
			    	  for(i=0;i<length;i++) {
					      comments.push({author : result.items[i].snippet.topLevelComment.snippet.authorDisplayName, 
					    	  date : new Date(result.items[i].snippet.topLevelComment.snippet.publishedAt).toLocaleDateString("en-US",options),
					    	  photo : result.items[i].snippet.topLevelComment.snippet.authorProfileImageUrl,
					    	  text : result.items[i].snippet.topLevelComment.snippet.textDisplay});
					  }
			    	  var token = result.nextPageToken;
			    	  if(!token) video.commentCount = length;
			    	  page.render($(".video-comments"),{commentCount : video.commentCount,comments:comments}, () => {
				    	  if(!token) {
				    		  $(".video-comments a.show-more").hide();
				    	  }else {
				    		  $(".video-comments a.show-more").click(() => {
				    			  $(".video-comments a.show-more").hide();
				    			  app.get("https://www.googleapis.com/youtube/v3/commentThreads?key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&videoId=${id}&pageToken="+token+"&part=snippet&maxResults=20",result => {
				    				  comments = new Array();
							    	  length = result.items.length;
							    	  for(i=0;i<length;i++) {
									      comments.push({author : result.items[i].snippet.topLevelComment.snippet.authorDisplayName, 
									    	  date : new Date(result.items[i].snippet.topLevelComment.snippet.publishedAt).toLocaleDateString("en-US",options),
									    	  photo : result.items[i].snippet.topLevelComment.snippet.authorProfileImageUrl,
									    	  text : result.items[i].snippet.topLevelComment.snippet.textDisplay});
									  }
							    	  token = result.nextPageToken;
							    	  const container = $("<div/>");
							    	  page.render($(".video-comments"),{commentCount : video.commentCount,comments:comments},
							    	      false,container, () => {
							    		  $(".video-comment",container).insertBefore($(".video-comments a.show-more"));
							    	  });
							    	  $(".video-comments a.show-more").show();
							    	  if(!token) $(".video-comments a.show-more").hide();
				    			  });
				    		  });
				    	  }
			    	  });
				  });
			   });
			});	
		});
	});
 });
 
 </script> 