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
	 const videos = new Array();
	 videos.push({id : "BGt1htuyhiU", title : "Youssou Ndour - Be careful",channel : "YoussouNdourVEVO"});
	 videos.push({id : "j2Tj_ejWQf0", title : "Pape Diouf - Du Degn",channel : "Prince Arts"});
	 videos.push({id : "CTbTXxLCn8Q", title : "Viviane Chidid - Wuyuma",channel : "Viviane Chidid Officiel"});
	 videos.push({id : "0ChaoRFyytA", title : "Titi - Guen Gui Deuk",channel : "Prince Arts"});
	 videos.push({id : "g6QrXwGUqAM", title : "Wally Seck - Stay",channel : "Waly Seck Officiel"});
	 videos.push({id : "ymgO2OZQZfw", title : "Sidiki Diabaté - Fais moi confiance",channel : "Sidiki Diabaté Officiel"});
	 videos.push({id : "TBWsEjFFD6k", title : "Thione Seck - Diaga",channel : "gelongalvideo"});
	 videos.push({id : "7tRAhAlCcFA", title : "Pape & Cheikh - Yermande",channel : "Pape & Cheikh"});
	 videos.push({id : "HeFpnYKGXMk", title : "Coumba Gawlo - Topma",channel : "gelongalvideo"});
	 videos.push({id : "TxyhI0CDG-I", title : "Alioune Mbaye Nder - Maladie d'Amour",channel : "Prince Arts"});
	 videos.push({id : "R08rX2-sTuE", title : "Faada Freddy - We Sing In Time",channel : "Faada Freddy"});
	 videos.push({id : "esU9NnHP2aE", title : "Canabasse - Na Gnou Dem",channel : "Canabasse"});
	 videos.push({id : "doIYcuBkKtM", title : "Fata - Decouverte",channel : "Fata Elpresidente"});
	 videos.push({id : "_iLU1DVUH9k", title : "Awadi & Duggy Tee - Merci Mon Dieu",channel : "Didier Awadi"});
	 videos.push({id : "evin2iPw6-0", title : "Gaston - La Foi",channel : "Bamar Ndoye"});
	 page.render($(".videos"),videos,thumbnail => {
		 thumbnail.addClass("animated flip");
	 });
 });
 
 </script> 