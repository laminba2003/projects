<div>
 <div class="video-player">
  
  <div class="video-container">
     <iframe id="player" style="display:none" width="853" height="200" frameborder="0" allowfullscreen></iframe>
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
  
  <div class="channel">
    <template type="text/x-dust-template">
      <h1>{title}</h1>
      <img src="{image}"/>
      <h1>Latest Videos</h1>
      <div class="videos">
       {#videos}
	    <div>
		  <a id="{id}">
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
	 </div>
    </template>	   
  </div> 
  
  </div>
  
  <div class="thumbnails">
    <template type="text/x-dust-template">
      <h1>Up next</h1>
       {#.}
  		<div>
  		  <a id="{id}">
  		   <div class="thumbnail" style="background-image:url(https://i.ytimg.com/vi/{id}/mqdefault.jpg);background-position:center;background-size:contain;background-repeat:no-repeat;background-color:#000">
  		     <span>{index}</span>  		   
  		     <span>{duration}</span>
  		   </div>  		   
  		   <div class="description">
  		     <span>{title}</span>
  		     <span>{channel}</span>
  		     <span>{viewCount} views</span>
  		   </div>
  		 </a>
       </div>
       {/.}
      <a class="show-more">Show more</a>
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

const display = (videoId,cache) => {
	var video = {};
    var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
	app.get("https://www.googleapis.com/youtube/v3/videos?id="+videoId+"&key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&part=snippet,statistics",info => {
		video.videoId = videoId;
		video.title = info.items[0].snippet.title;
		document.title = video.title;
		video.publishedAt = new Date(info.items[0].snippet.publishedAt).toLocaleDateString("en-US",options);
		video.description = info.items[0].snippet.description.linkify();
		video.viewCount = info.items[0].statistics.viewCount.replace(/\B(?=(\d{3})+\b)/g, ",");
		video.commentCount = info.items[0].statistics.commentCount ? info.items[0].statistics.commentCount.replace(/\B(?=(\d{3})+\b)/g, ",") : 0;
		video.likeCount = info.items[0].statistics.likeCount.replace(/\B(?=(\d{3})+\b)/g, ",");
		video.dislikeCount = info.items[0].statistics.dislikeCount.replace(/\B(?=(\d{3})+\b)/g, ",");
		getChannelInfo(video,info.items[0].snippet.channelId,cache);
		$(".video-container iframe").attr("src","//www.youtube.com/embed/"+video.videoId+"?enablejsapi=1").show();
		getComments(video,options);
	},true);
}; 

const getChannelInfo = (video,channelId,cache) => {
	app.get("https://www.googleapis.com/youtube/v3/channels?id="+channelId+"&key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&part=snippet,statistics,brandingSettings",result => {
		video.channel = result.items[0].snippet.title;
		video.photo = result.items[0].snippet.thumbnails.medium.url;
		video.subscriberCount = result.items[0].statistics.subscriberCount.replace(/\B(?=(\d{3})+\b)/g, ",");
		page.render($(".watcher"),video);
		page.render($(".video-metadata"),video);
		if(!cache) getVideos(channelId);
		const channel = {id : channelId,title : video.channel,image : result.items[0].brandingSettings.image.bannerImageUrl};
		if(!cache) getLatestVideos(channel);
	},true);	
};

const getVideos = channelId => {
	app.get("https://www.googleapis.com/youtube/v3/search?key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&channelId="+channelId+"&type=video&part=snippet&order=viewCount&maxResults=20",result => {
		const videos = new Array();
		var length = result.items.length, id = "";
	    for(var i=0;i<length;i++) {
			const item = result.items[i];
			id += i < length-1 ? item.id.videoId +"," : item.id.videoId;
			videos.push({index : i+1,id : item.id.videoId, title : item.snippet.title,channel : item.snippet.channelTitle});
		}
	    var token = result.nextPageToken;
	    app.get("https://www.googleapis.com/youtube/v3/videos?key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&id="+id+"&part=contentDetails,statistics",result => {
	      length = result.items.length;	
	      for(i=0;i<length;i++) {
	    	const duration = result.items[i].contentDetails.duration.substring(2, result.items[i].contentDetails.duration.length).toLowerCase();
		    const minutes = duration.substring(0, duration.indexOf('m'));
		    const index = duration.indexOf('s');
			const seconds = index > 0 ? duration.substring(duration.indexOf('m')+1, index) : 0;
		    videos[i].duration = (minutes.length  ? minutes : ("0"+minutes)) + " : " + (seconds.length > 1 ? seconds : ("0"+seconds));	
	    	videos[i].viewCount = result.items[i].statistics.viewCount.replace(/\B(?=(\d{3})+\b)/g, ",");
	      }
		  page.render($(".thumbnails"),videos,thumbnail => {
			  $("a",thumbnail).click(function(){
				 const id = $(this).attr("id");
				 display(id,true);
				 history.pushState({id:id},null,"videos/watch?v="+id);
				 $(".video-container iframe").attr("src","//www.youtube.com/embed/"+id+"?enablejsapi=1");
				 $('html, body').animate({scrollTop : 0},800);
				 return false;
			  });
			  if(!token) {
				 $(".thumbnails a.show-more").hide();
			  }else {
				 $(".thumbnails a.show-more").one("click",() => {
					 getMoreVideos(channelId,token);				 
				 });
			  }
		  });
	   },true);
	},true);
};

const getMoreVideos = (channelId,token) => {
	$(".thumbnails a.show-more").hide();
	const index = parseInt($(".thumbnails > div:last .thumbnail span:eq(0)").html());
	app.get("https://www.googleapis.com/youtube/v3/search?key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&channelId="+channelId+"&pageToken="+token+"&type=video&part=snippet&order=viewCount&maxResults=20",result => {
		const videos = new Array();
		var length = result.items.length, id = "";
	    for(var i=0;i<length;i++) {
			const item = result.items[i];
			id += i < length-1 ? item.id.videoId +"," : item.id.videoId;
			videos.push({index : index +(i+1), id : item.id.videoId, title : item.snippet.title,channel : item.snippet.channelTitle});
		}
	    if(length==0) {
	    	$(".thumbnails a.show-more").hide();
	    	return false;
	    }
	    var newToken = result.nextPageToken;
	    app.get("https://www.googleapis.com/youtube/v3/videos?key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&id="+id+"&part=contentDetails,statistics",result => {
	      length = result.items.length;	
	      for(i=0;i<length;i++) {
	    	const duration = result.items[i].contentDetails.duration.substring(2, result.items[i].contentDetails.duration.length).toLowerCase();
		    const minutes = duration.substring(0, duration.indexOf('m'));
		    const index = duration.indexOf('s');
			const seconds = index > 0 ? duration.substring(duration.indexOf('m')+1, index) : 0;
		    videos[i].duration = (minutes.length  ? minutes : ("0"+minutes)) + " : " + (seconds.length > 1 ? seconds : ("0"+seconds));	
	    	videos[i].viewCount = result.items[i].statistics.viewCount.replace(/\B(?=(\d{3})+\b)/g, ",");
	      }
	      if(length) {
		      var container = $("<div/>");
			  page.render($(".thumbnails"),videos,false,container,thumbnail => {
				  $("a",thumbnail).click(function(){
					 const id = $(this).attr("id");
					 display(id,true);
					 history.pushState({id:id},null,"videos/watch?v="+id);
					 $(".video-container iframe").attr("src","//www.youtube.com/embed/"+id+"?enablejsapi=1");
					 $('html, body').animate({scrollTop : 0},800);
					 return false;
				  });
				  $("> div",container).insertAfter($(".thumbnails > div:last"));
				  if(newToken) {
					 $(".thumbnails a.show-more").show().one("click",() => {
						 getMoreVideos(channelId,newToken);				 
					 });
				   }
			  });
	      }else {
	    	  $(".thumbnails a.show-more").hide();
	      }
	   },true);
	},true);
};

const getComments = (video,options) => {
	app.get("https://www.googleapis.com/youtube/v3/commentThreads?key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&videoId="+video.videoId+"&part=snippet&maxResults=5",result => {
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
	    			  app.get("https://www.googleapis.com/youtube/v3/commentThreads?key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&videoId="+video.videoId+"&pageToken="+token+"&part=snippet&maxResults=20",result => {
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
	    			  },true);
	    		  });
	    	  }
  	  });
	  },true);
};

const getLatestVideos = channel => {
	app.get("https://www.googleapis.com/youtube/v3/search?key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&channelId="+channel.id+"&type=video&part=snippet&order=date&maxResults=6",result => {
		const videos = new Array();
		var length = result.items.length, id = "";
	    for(var i=0;i<length;i++) {
			const item = result.items[i];
			id += i < length-1 ? item.id.videoId +"," : item.id.videoId;
			videos.push({index : i+1,id : item.id.videoId, title : item.snippet.title,channel : item.snippet.channelTitle});
		}
	    app.get("https://www.googleapis.com/youtube/v3/videos?key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&id="+id+"&part=contentDetails,statistics",result => {
	      length = result.items.length;	
	      for(i=0;i<length;i++) {
	    	const duration = result.items[i].contentDetails.duration.substring(2, result.items[i].contentDetails.duration.length).toLowerCase();
		    const minutes = duration.substring(0, duration.indexOf('m'));
		    const index = duration.indexOf('s');
			const seconds = index > 0 ? duration.substring(duration.indexOf('m')+1, index) : 0;
		    videos[i].duration = (minutes.length  ? minutes : ("0"+minutes)) + " : " + (seconds.length > 1 ? seconds : ("0"+seconds));	
	    	videos[i].viewCount = result.items[i].statistics.viewCount.replace(/\B(?=(\d{3})+\b)/g, ",");
	      }
		  channel.videos = videos;
		  page.render($(".channel"),channel,thumbnail => {
			  if(channel.image.indexOf("default_banner")!=-1) $(".channel img").remove();
			  $("a",thumbnail).click(function(){
				 const id = $(this).attr("id");
				 display(id,true);
				 history.pushState({id:id},null,"videos/watch?v="+id);
				 $(".video-container iframe").attr("src","//www.youtube.com/embed/"+id+"?enablejsapi=1");
				 $('html, body').animate({scrollTop : 0},800);
				 return false;
			 });
		  });
	   },false);
	},false);	
};

document.addEventListener("DOMContentLoaded", () => {
   window.addEventListener('popstate', e => {
	   const state = e.state;
	   if(state && state.id) {
	       display(state.id,true);
	 	   $(".video-container iframe").attr("src","//www.youtube.com/embed/"+state.id+"?enablejsapi=1");
	 	   $('html, body').animate({scrollTop : 0},800);
	   } 
   });
   display("${id}");
});
 
 </script> 