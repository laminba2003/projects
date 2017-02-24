<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>SenTube</title>
    <base href="${path}"/>
    <!-- Template css -->
    <link href="templates/modern/css/template.css" rel="stylesheet"> 
    <!-- Favicon -->
    <link rel="shortcut icon" href="templates/modern/images/favicon_32.png"  sizes="32x32">  
  </head>
<body>
 
  <!-- scroll to top  -->   
  <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
  
  <!-- start navbar -->
  <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar" style="display:none">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <button type="button" class="aside-toggle collapsed" data-target="#navbar" aria-expanded="false" aria-controls="navbar" onclick="${watch ? 'toggleAside()' : 'showMainFull()'}">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="${path}" title="SenTube Home">Sen<span>Tube</span></a>
        <!-- <a class="navbar-brand" href="index.html"><img src="images/logo.png" alt="logo"></a> -->
      </div>
       <form id="search" action="videos/search" method="GET">
        <input name="search_query" type="text" placeholder="Search...">
        <input type="submit" value="">
       </form>
      <div id="navbar" class="navbar-collapse collapse navbar_area">          
        <ul class="nav navbar-nav navbar-right custom_nav">
          <li><a title="upload" class="upload">&nbsp;</a></li>
          <li><a title="sign in" class="signin">Sign in</a></li>                 
        </ul>
       <div class="loginForm">
  		 <div class="ribbon"></div>
  		  <div class="login">
  		  <h1>Welcome</h1>
  		  <p>Enter your credentials</p>
  		  <form action="${path}">
    		<div class="input">
      		 <div class="blockinput">
        		<i class="icon-envelope-alt"></i><input type="email" placeholder="Email">
      		 </div>
     		 <div class="blockinput">
        		<i class="icon-unlock"></i><input type="password" placeholder="Password">
      		 </div>
    		</div>
    		<button>Sign In</button>
  		 </form>
  		</div>
  		</div>
      </div><!--/.nav-collapse -->
    </div>
  </nav>
  <!-- End navbar -->
 
 <aside style="${watch ? 'display:none' : 'opacity:1'}">
   <div>
     <span title="Home">
      <img src="templates/modern/images/home-20.png" height="20"  width="20" data-ytimg="1" aria-hidden="true" alt="">
     Home
     </span>
     <span title="Trending">
       <img src="templates/modern/images/fire-20.png" height="20"  width="20" data-ytimg="1" aria-hidden="true" alt="">
     Trending
     </span>
     <span title="History">
        <img src="templates/modern/images/history-20.png" height="20"  width="20" data-ytimg="1" aria-hidden="true" alt="">
     History
     </span>
   </div>
   <hr/>
   <h3>
      Best of SenTube
    </h3>
    <div>
     <span class="active" title="Music">
     <img src="//i.ytimg.com/i/-9-kyTW8ZkZNDHQJ6FgpwQ/1.jpg" height="20"  width="20" data-ytimg="1" aria-hidden="true" alt="">
     Music
     </span>
     <span title="Sports">
     <img src="//i.ytimg.com/i/Egdi0XIXXZ-qJOFPf4JSKw/1.jpg" height="20"  width="20" data-ytimg="1" aria-hidden="true" alt="">
     Sports
     </span>
     <span title="Gaming">
     <img src="//i.ytimg.com/i/OpNcN46UbXVtpKMrmU4Abg/1.jpg" height="20"  width="20" data-ytimg="1" aria-hidden="true" alt="">
     Gaming
     </span>
     <span title="Movies">
     <img src="//i.ytimg.com/i/lgRkhTL3_hImCAmdLfDE4g/1.jpg" height="20" width="20" data-ytimg="1" aria-hidden="true" alt="">
     Movies
     </span>
     <span title="News">
     <img src="//i.ytimg.com/i/YfdidRxbB8Qhf0Nx7ioOYw/1.jpg" height="20"  width="20" data-ytimg="1" aria-hidden="true" alt="">
     News
     </span>
     <span title="Live">
     <img src="//i.ytimg.com/i/4R8DWoMoI7CAwX8_LjQHig/1.jpg" data-ytimg="1"  aria-hidden="true" width="20" alt="" height="20">
     Live
     </span>
     <span title="360� Video">
     <img src="//i.ytimg.com/i/zuqhhs6NWbgTzMuM09WKDQ/1.jpg" data-ytimg="1"  aria-hidden="true" width="20" alt="" height="20">
     360� Video
     </span>
   </div>
   <hr/>
   <div>
    <span title="Browse channels">
     <img src="templates/modern/images/add-20.png" height="20"  width="20" data-ytimg="1" aria-hidden="true" alt="">
     Browse channels
     </span>
   </div>
   <hr/>
   <p>
   Sign in now to see your channels and recommendations!
   </p>
   <a title="sign in" class="signin">Sign in</a>
 </aside>
 <main style="${watch ? 'width:100%' : 'opacity:1'}">
   <tiles:insertAttribute name="content"/>
 </main>   
  <!-- start footer -->
  <footer id="footer">
    <div class="container">
      <div class="row">        
        <div class="col-lg-12 col-md-12 col-sm-12">
          <div class="footer_bottom">
            <div class="copyright">
              <p>&copy; 2017 all rights reserved</p>
            </div>
            <div class="developer">
              <p>Designed by <a target="_blank" href="http://wpfreeware.com/" rel="nofollow">Wpfreeware</a>
              and <a target="_blank" href="http://env-3687617.mircloud.host/thinktech/" rel="nofollow">ThinkTech</a></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <!-- End footer -->

  <!-- jQuery Library -->
  
  <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
 
  <!-- metamorphosis js file include -->
 
 <script src="js/metamorphosis.js"></script> 
 
  <!-- template js file include -->
  <script src="templates/modern/js/template.js"></script>  
   
  </body>
</html>