<div class="videos">
 <template type="text/x-dust-template">
 <h1>Home</h1>
  {#.}
       <a href="videos/watch?v={id}">
  		<div>
  		   <img src="https://i.ytimg.com/vi/{id}/mqdefault.jpg"/>
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
 
 <script>
 
 document.addEventListener("DOMContentLoaded", () => {
	 const videos = new Array();
	 videos.push({id : "BGt1htuyhiU", title : "Youssou Ndour - Be careful",channel : "YoussouNdourVEVO"});
	 videos.push({id : "o6OnE-DTBJw", title : "Viviane - Kumu Neexul",channel : "gelongalvideo"});
	 videos.push({id : "a-B4Q5_I_mI", title : "Cheikh Lo - Degg Gui",channel : "Cheikh Lo"});
	 videos.push({id : "j2Tj_ejWQf0", title : "Pape Diouf - Du Degn",channel : "Prince Arts"});
	 videos.push({id : "2Ky8hnq2F-Y", title : "Keur Gui - Diogoufi",channel : "Teledakar.com"});
	 videos.push({id : "unYEZlYsoSY", title : "Fou Malade - Senegal",channel : "Fou Malade"});
	 videos.push({id : "0ChaoRFyytA", title : "Titi - Guen Gui Deuk",channel : "Prince Arts"});
	 videos.push({id : "O1ClYEM43d4", title : "Queen Biz - Eksina",channel : "queenbizofficial"});
	 videos.push({id : "suatQi7iAyc", title : "Philip Monteiro - Name na la",channel : "Philip Monteiro"});
	 videos.push({id : "g6QrXwGUqAM", title : "Wally Seck - Stay",channel : "Waly Seck Officiel"});
	 videos.push({id : "ymgO2OZQZfw", title : "Sidiki Diabaté - Fais moi confiance",channel : "Sidiki Diabaté Officiel"});
	 videos.push({id : "TBWsEjFFD6k", title : "Thione Seck - Diaga",channel : "gelongalvideo"});
	 videos.push({id : "7tRAhAlCcFA", title : "Pape & Cheikh - Yermande",channel : "Pape & Cheikh"});
	 videos.push({id : "HeFpnYKGXMk", title : "Coumba Gawlo - Topma",channel : "gelongalvideo"});
	 videos.push({id : "7lENHksMvXM", title : "Safary - Fat Ndiaye Coumba Anta",channel : "Queen Safary"});
	 videos.push({id : "Km0Ums-d8N0", title : "Nafina - Lane Ngay Khar",channel : "Nafina Officiel"});
	 videos.push({id : "TxyhI0CDG-I", title : "Alioune Mbaye Nder - Maladie d'Amour",channel : "Prince Arts"});
	 videos.push({id : "FwBeLCLMa1s", title : "Adiouza Diallo - Cey Love",channel : "Adiouza Diallo"});
	 videos.push({id : "R08rX2-sTuE", title : "Faada Freddy - We Sing In Time",channel : "Faada Freddy"});
	 videos.push({id : "esU9NnHP2aE", title : "Canabasse - Na Gnou Dem",channel : "Canabasse"});
	 videos.push({id : "doIYcuBkKtM", title : "Fata - Decouverte",channel : "Fata Elpresidente"});
	 videos.push({id : "_iLU1DVUH9k", title : "Awadi & Duggy Tee - Merci Mon Dieu",channel : "Didier Awadi"});
	 videos.push({id : "evin2iPw6-0", title : "Gaston - La Foi",channel : "Bamar Ndoye"});
	 videos.push({id : "4U8MZVv1Q88", title : "Fatou Guewel - Santati",channel : "Senepeople.com"});
	 videos.push({id : "VnTyGAmDJXo", title : "Carlou D - Sagn Sagn",channel : "Carlou-D Loucard"});
	 var id = "";
	 for(var i=0;i<videos.length;i++) id += i < videos.length-1 ? videos[i].id +"," : videos[i].id;
	 app.get("https://www.googleapis.com/youtube/v3/videos?key=AIzaSyBaYaWQcSP8P1Dau3kxDitRo7W9VA4EOPg&id="+id+"&part=contentDetails,statistics", results => {
	    for(i=0;i<results.items.length;i++) {
	    	const duration = results.items[i].contentDetails.duration.substring(2, results.items[i].contentDetails.duration.length);
	    	const minutes = duration.substring(0, duration.indexOf('M'));
			const seconds = duration.substring(duration.indexOf('M')+1, duration.indexOf('S'));
	    	videos[i].duration = (minutes.length  ? minutes : ("0"+minutes)) + " : " + (seconds.length > 1 ? seconds : ("0"+seconds));
	    	videos[i].viewCount = results.items[i].statistics.viewCount.replace(/\B(?=(\d{3})+\b)/g, ",");
	    }
	    const div = $(".videos").fadeTo(2000,1);
	    page.render(div,videos,thumbnail => thumbnail.addClass("animated flip"));
	 });
 });
 
 </script> 