<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="welcome to ThinkTech website">
  <meta name="author" content="ThinkTech">
  <base href="${path}"/>
  <title>ThinkTech</title>
  <link href="templates/oxygen/css/bootstrap.min.css" rel="stylesheet">
  <link href="templates/oxygen/css/animate.min.css" rel="stylesheet"> 
  <link href="templates/oxygen/css/font-awesome.min.css" rel="stylesheet">
  <link href="templates/oxygen/css/lightbox.css" rel="stylesheet">
  <link href="templates/oxygen/css/main.css" rel="stylesheet">
  <link id="css-preset" href="templates/oxygen/css/presets/preset1.css" rel="stylesheet">
  <link href="templates/oxygen/css/responsive.css" rel="stylesheet">

  <!--[if lt IE 9]>
    <script src="templates/oxygen/js/html5shiv.js"></script>
    <script src="templates/oxygen/js/respond.min.js"></script>
  <![endif]-->
  
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700' rel='stylesheet' type='text/css'>
  <link rel="shortcut icon" href="templates/oxygen/images/icons_cloud-32.png"  sizes="32x32"> 
</head><!--/head-->

<body>

  <!-- scroll to top  -->   
  <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
  
  <!--.preloader-->
  <div class="preloader"> <i class="fa fa-circle-o-notch fa-spin"></i></div>
  <!--/.preloader-->

  <header id="home">
    <div id="home-slider" class="carousel slide carousel-fade" data-ride="carousel">
      <div class="carousel-inner">
        <div class="item active" style="background-image: url(templates/oxygen/images/slider/startup-photos.jpg)">
          <div class="caption">
            <h1 class="animated fadeInLeftBig">Welcome to <span>ThinkTech</span></h1>
            <p class="animated fadeInRightBig">We deliver projects on time and on budget and we have an excellent customer service and support.</p>
            <a data-scroll class="btn btn-start animated fadeInUpBig" href="#services">Start now</a>
          </div>
        </div>
        <div class="item" style="background-image: url(templates/oxygen/images/slider/pexels-photo-251225.jpeg)">
          <div class="caption">
            <h1 class="animated fadeInLeftBig">IT Development <span>and</span> Cloud Hosting</h1>
            <p class="animated fadeInRightBig">Develop and deploy your applications on our Cloud and let us manage everything for you.</p>
            <a data-scroll class="btn btn-start animated fadeInUpBig" href="#services">Start now</a>
          </div>
        </div>
        <div class="item" style="background-image: url(templates/oxygen/images/slider/black-and-white-code-programming-tech-79290.jpeg)">
          <div class="caption">
            <h1 class="animated fadeInLeftBig">Consulting <span>and</span> Training</h1>
            <p class="animated fadeInRightBig">Expert advice to help you plan the next steps for your business and we train our customers through hands-on experience.</p>
            <a data-scroll class="btn btn-start animated fadeInUpBig" href="#services">Start now</a>
          </div>
        </div>
      </div>
      <a class="left-control" href="#home-slider" data-slide="prev"><i class="fa fa-angle-left"></i></a>
      <a class="right-control" href="#home-slider" data-slide="next"><i class="fa fa-angle-right"></i></a>

      <a id="tohash" href="#services"><i class="fa fa-angle-down"></i></a>

    </div><!--/#home-slider-->
    <div class="main-nav">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>                  
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-right">                 
            <li class="scroll"><a href="#services">Services</a></li> 
            <li class="scroll"><a href="#about-us">About Us</a></li>                     
            <li class="scroll"><a href="#portfolio">Portfolio</a></li>
            <li class="scroll"><a href="#technology">Technology</a></li>
            <li class="scroll"><a href="#partners">Partners</a></li>
            <li class="scroll"><a href="#contact">Contact</a></li>       
          </ul>
        </div>
      </div>
    </div><!--/#main-nav-->
  </header><!--/#home-->
  <section id="services">
    <div class="container">
      <div class="heading wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="300ms">
        <div class="row">
          <div class="text-center col-sm-8 col-sm-offset-2">
            <h2>Our Services</h2>
          </div>
        </div> 
      </div>
      <div class="text-center our-services">
        <div class="row">
          <div class="col-sm-4 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
            <div class="service-icon">
              <i class="fa fa-flask"></i>
            </div>
            <div class="service-info">
              <h3>Brand Identity</h3>
              <p>We distinguish ourselves from other IT companies by delivering projects on time and on budget and we have an excellent customer service and support.</p>
            </div>
          </div>
          <div class="col-sm-4 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="450ms">
            <div class="service-icon">
              <i class="fa fa-umbrella"></i>
            </div>
            <div class="service-info">
              <h3>Creative Ideas</h3>
              <p>We are always in search of the perfect ideas to fullfill the vision of our customers.</p>
            </div>
          </div>
          <div class="col-sm-4 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="550ms">
            <div class="service-icon">
              <i class="fa fa-cloud"></i>
            </div>
            <div class="service-info">
              <h3>Awesome Support</h3>
              <p>We are dedicated to provide world-class support, technical answers to ensure the success of your projects.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section><!--/#services-->
  <section id="about-us" class="parallax">
    <div class="container">
      <div class="row">
        <div class="col-sm-6">
          <div class="about-info wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="300ms">
            <h2>About us</h2>
            <p>We are an IT company based on Senegal specialized in Software Development with a proven experience in building innovative and robust solutions
            with cutting-edge technologies.
            </p>
          </div>
        </div>
        <div class="col-sm-6">
          <div class="our-skills wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
            <div class="single-skill wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
              <p class="lead">User Experiences</p>
              <div class="progress">
                <div class="progress-bar progress-bar-primary six-sec-ease-in-out" role="progressbar"  aria-valuetransitiongoal="100">100%</div>
              </div>
            </div>
            <div class="single-skill wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="400ms">
              <p class="lead">Web Design</p>
              <div class="progress">
                <div class="progress-bar progress-bar-primary six-sec-ease-in-out" role="progressbar"  aria-valuetransitiongoal="100">100%</div>
              </div>
            </div>
            <div class="single-skill wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="500ms">
              <p class="lead">Programming</p>
              <div class="progress">
                <div class="progress-bar progress-bar-primary six-sec-ease-in-out" role="progressbar"  aria-valuetransitiongoal="100">100%</div>
              </div>
            </div>
            <div class="single-skill wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
              <p class="lead">Fun</p>
              <div class="progress">
                <div class="progress-bar progress-bar-primary six-sec-ease-in-out" role="progressbar"  aria-valuetransitiongoal="100">100%</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section><!--/#about-us-->

  <section id="portfolio">
    <div class="container">
      <div class="row">
        <div class="heading text-center col-sm-8 col-sm-offset-2 wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="300ms">
          <h2>Our Portfolio</h2>
        </div>
      </div> 
    </div>
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3">
          <div class="folio-item wow fadeInLeftBig" data-wow-duration="1000ms" data-wow-delay="400ms">
            <div class="folio-image">
              <img class="img-responsive" src="templates/oxygen/images/portfolio/sentube.jpg" alt="">
            </div>
            <div class="overlay">
              <div class="overlay-content">
                <div class="overlay-text">
                  <div class="folio-info">
                    <h3><a href="http://env-3687617.mircloud.host/sentube/" target="_blank">SenTube</a></h3>
                    <p>platform for watching videos</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="folio-item wow fadeInRightBig" data-wow-duration="1000ms" data-wow-delay="500ms">
            <div class="folio-image">
              <img class="img-responsive" src="templates/oxygen/images/portfolio/crm.jpg" alt="">
            </div>
            <div class="overlay">
              <div class="overlay-content">
                <div class="overlay-text">
                  <div class="folio-info">
                    <h3><a href="http://env-3687617.mircloud.host/sencrm/" target="_blank">SenCRM</a></h3>
                    <p>under construction</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="folio-item wow fadeInRightBig" data-wow-duration="1000ms" data-wow-delay="500ms">
            <div class="folio-image">
              <img class="img-responsive" src="templates/oxygen/images/portfolio/senplace.jpg" alt="">
            </div>
            <div class="overlay">
              <div class="overlay-content">
                <div class="overlay-text">
                  <div class="folio-info">
                    <h3>SenPlace</h3>
                    <p>under construction</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="folio-item wow fadeInRightBig" data-wow-duration="1000ms" data-wow-delay="500ms">
            <div class="folio-image">
              <img class="img-responsive" src="templates/oxygen/images/portfolio/senannuaire.jpg" alt="">
            </div>
            <div class="overlay">
              <div class="overlay-content">
                <div class="overlay-text">
                  <div class="folio-info">
                    <h3>SenAnnuaire</h3>
                    <p>under construction</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="folio-item wow fadeInRightBig" data-wow-duration="1000ms" data-wow-delay="500ms">
            <div class="folio-image">
              <img class="img-responsive" src="templates/oxygen/images/portfolio/senhealth.jpg" alt="">
            </div>
            <div class="overlay">
              <div class="overlay-content">
                <div class="overlay-text">
                  <div class="folio-info">
                    <h3>SenHealth</h3>
                    <p>under construction</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="folio-item wow fadeInRightBig" data-wow-duration="1000ms" data-wow-delay="500ms">
            <div class="folio-image">
              <img class="img-responsive" src="templates/oxygen/images/portfolio/sendev.jpg" alt="">
            </div>
            <div class="overlay">
              <div class="overlay-content">
                <div class="overlay-text">
                  <div class="folio-info">
                    <h3>SenDev</h3>
                    <p>under construction</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="folio-item wow fadeInLeftBig" data-wow-duration="1000ms" data-wow-delay="600ms">
            <div class="folio-image">
              <img class="img-responsive" src="templates/oxygen/images/portfolio/senaspo.png" alt="">
            </div>
            <div class="overlay">
              <div class="overlay-content">
                <div class="overlay-text">
                  <div class="folio-info">
                    <h3>Aspo</h3>
                    <p>under construction</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="folio-item wow fadeInLeftBig" data-wow-duration="1000ms" data-wow-delay="600ms">
            <div class="folio-image">
              <img class="img-responsive" src="templates/oxygen/images/portfolio/btpafrique.jpg" alt="">
            </div>
            <div class="overlay">
              <div class="overlay-content">
                <div class="overlay-text">
                  <div class="folio-info">
                    <h3><a href="http://env-3687617.mircloud.host/btp/" target="_blank">BTP Afrique</a></h3>
                    <p>under construction</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        
      </div>
    </div>
    <div id="portfolio-single-wrap">
      <div id="portfolio-single">
      </div>
    </div><!-- /#portfolio-single-wrap -->
  </section><!--/#portfolio-->

	<section id="technology"  class="wow fadeInRightBig" data-wow-duration="1000ms" data-wow-delay="500ms">
				<h2>Technology</h2>
				<p>
					Combinations of software solutions: 
					<ul>
					<li><b>Odin Virtuozzo, Odin Virtuozzo for Windows </b> - currently the only market ready solution for container virtualization, trusted by enterprise level customers across the world.</li>
					<li><b>Odin Cloud Storage </b> - unique resilient file storage solution for virtual systems, which provisions instant migration, local level I/O speed and low initial investment requirements.</li>
					<li><b>Jelastic</b> - cloud orchestration and platform enabler (PaaS), including cloud resource billing and consumption tracking.</li>
					<li><b>R1Soft</b> - best solution for data snapshots and disaster recovery.  This solution works on the core level and snapshots are taken instantly without additional resource consumption.</li>
				</ul>
				</p>
				<h2 class="wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="300ms">Infrastructure and equipment</h2>
				<p>
					<ul>
						<li><b>Regions</b> - MIRhosting Cloud is currently deployed in our main location in the Netherlands, while USA and Russia are coming online soon.</li>
						<li><b>Minimum two datacenters commitment per region</b> - Each location has at least two datacenter instances with redundant connectivity channels between them.  These datacenters are logically connected to operate as a single cloud infrastructure instance, however, if one of the datacenters goes offline, the other datacenter does not get impacted and customers cloud operations carry on uninterrupted!</li>
						<li><b>Own network infrastructure</b> - Our networking infrastructure is built on our own equipment, internet connectivity, AS and network peering connections.  This gives our customers highest level of choice of connection and enables independent peering policy provisioning. </li>
						<li><b>DdoS protection</b> - Our cloud is protected with several levels of network security, including DDoS filtering.  Most all of the DDoS attacks are filtered automatically and this protection is offered as a service also on subscription basis.</li>
						<li><b>Own equipment</b> - Innovation IT Solutions Corp (branded as MIRhosting) owns all of the hardware without any third party liabilities.</li>
					</ul>
				</p>
				<h2 class="wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="300ms">Key programming functions and support</h2>
				<div class="specs">
					<div class="col">
						<div>
							<h3>Environments</h3>
						</div>
						<div>
							<ul>
								<li>Tomcat 6 & 7</li>
								<li>TomEE</li>
								<li>Jetty</li>
								<li>Glassfish with connection pools</li>
								<li>Apache</li>
								<li>NGINX</li>
								<li>Elastic VPS</li>
							</ul>
						</div>
						<div>
							<h3>JVM languages support</h3>
						</div>
						<div>
							<ul>
								<li>Clojure</li>
								<li>JRuby</li>
								<li>ColdFusion</li>
								<li>Groovy</li>
								<li>Scala</li>
							</ul>
						</div>
						<div>
							<h3>Databases</h3>
						</div>
						<div>
							<ul>
								<li>MySQL</li>
								<li>MariaDB</li>
								<li>PostgreSQL</li>
								<li>MongoDB</li>
								<li>CouchDB</li>
							</ul>
						</div>
					</div>
					<div class="col">
						<div>
							<h3>JAVA versions</h3>
						</div>
						<div>
							<ul>
								<li>JDK 6</li>
								<li>JDK 7</li>
								<li>JDK 8</li>
							</ul>
						</div>
						<div>
							<h3>PHP versions </h3>
						</div>
						<div>
							<ul>
								<li>PHP 5.3</li>
								<li>PHP 5.4</li>
								<li>PHP 5.5</li>
							</ul>
						</div>
						<div>
							<h3>Ruby versions</h3>
						</div>
						<div>
							<ul>
								<li>Ruby 1.9.2</li>
								<li>Ruby 1.9.3</li>
								<li>Ruby 2.0.0</li>
								<li>Ruby 2.1.1</li>
							</ul>
						</div>
						<div>
							<h3>Python versions</h3>
						</div>
						<div>
							<ul>
								<li>Python 2.7</li>
								<li>Python 3.3</li>
								<li>Python 3.4</li>
							</ul>
						</div>
						<div>
							<h3>Node.js versions</h3>
						</div>
						<div>
							<ul>
								<li>Node.js 0.10</li>
							</ul>
						</div>
					</div>
					<div class="col">
						<div>
							<h3>Key functions </h3>
						</div>
						<div>
							<ul>
								<li>Docker support</li>
								<li>Automatic vertical scaling</li>
								<li>Horizontal scaling</li>
								<li>HTTP and TCP balancing</li>
								<li>One-click high availability platform support</li>
								<li>Session replication</li>
								<li>Multi domain support for a single setup instance</li>
								<li>HTTPS SSL support (including own certificates)</li>
								<li>External IP addresses</li>
								<li>SSH, FTPs access</li>
								<li>Memcached</li>
								<li>API access</li>
								<li>Cloud resource consumption reporting</li>
								<li>Environment replication</li>
								<li>Support for Openshift cartridges</li>
								<li>One-click application installation library</li>
							</ul>
						</div>
					</div>
				</div>
			</section>
			<!-- end .howitworks-->

 <section id="partners">
   <div class="container">
      <div class="row">
        <div class="heading text-center col-sm-8 col-sm-offset-2 wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="300ms">
          <h2>Our Partners</h2>
           <a href="https://jelastic.com/" target="_blank"><img src="templates/oxygen/images/jelastic.png"/></a>
          <a href="https://mirhosting.com/" target="_blank"><img src="templates/oxygen/images/mirhosting.png"/></a>
        </div>
      </div> 
    </div> 
 </section>

  <section id="contact">
    <div id="contact-us" class="parallax">
      <div class="container">
        <div class="row">
          <div class="heading text-center col-sm-8 col-sm-offset-2 wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="300ms">
            <h2>Contact Us</h2>
            <p>In search of a solution? We are always open for a quick chat! Give us a call or email us any time and we will respond shortly.</p>
          </div>
        </div>
        <div class="contact-form wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms">
          <div class="row">
            <div class="col-sm-6">
              <form id="main-contact-form" name="contact-form" method="post" action="#">
                <div class="row  wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="300ms">
                  <div class="col-sm-6">
                    <div class="form-group">
                      <input type="text" name="name" class="form-control" placeholder="Name" required="required">
                    </div>
                  </div>
                  <div class="col-sm-6">
                    <div class="form-group">
                      <input type="email" name="email" class="form-control" placeholder="Email Address" required="required">
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <input type="text" name="subject" class="form-control" placeholder="Subject" required="required">
                </div>
                <div class="form-group">
                  <textarea name="message" id="message" class="form-control" rows="4" placeholder="Enter your message" required="required"></textarea>
                </div>                        
                <div class="form-group">
                  <button type="submit" class="btn-submit">Send Now</button>
                </div>
              </form>   
            </div>
            <div class="col-sm-6">
              <div class="contact-info wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="300ms">
                <ul class="address">
                  <li><i class="fa fa-map-marker"></i> <span> Address:</span> Parcelles Assainies U20-54 </li>
                  <li><i class="fa fa-phone"></i> <span> Phone:</span> +221 33-855-10-91  </li>
                  <li><i class="fa fa-mobile"></i> <span> Mobile:</span> +221 78-135-51-73  </li>
                  <li><i class="fa fa-envelope"></i> <span> Email:</span><a href="mailto:info@thinktech.sn">info@thinktech.sn</a></li>
                </ul>
              </div>                            
            </div>
          </div>
        </div>
      </div>
    </div>        
  </section><!--/#contact-->
  <footer id="footer">
    <div class="footer-top wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="300ms">
      <div class="container text-center">
        <div class="social-icons">
          <ul>
            <li><a class="envelope" href="#"><i class="fa fa-envelope"></i></a></li>
            <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li> 
            <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li>
            <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
            <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
            <li><a class="tumblr" href="#"><i class="fa fa-tumblr-square"></i></a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="footer-bottom">
      <div class="container">
        <div class="row">
          <div class="col-sm-6">
            <p>&copy; 2017 all rights reserved.</p>
          </div>
          <div class="col-sm-6">
            <p class="pull-right">Crafted by <a href="http://designscrazed.org/" target="_blank">Allie</a></p>
          </div>
        </div>
      </div>
    </div>
  </footer>

  <script type="text/javascript" src="templates/oxygen/js/jquery.js"></script>
  <script type="text/javascript" src="templates/oxygen/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
  <script type="text/javascript" src="templates/oxygen/js/jquery.inview.min.js"></script>
  <script type="text/javascript" src="templates/oxygen/js/wow.min.js"></script>
  <script type="text/javascript" src="templates/oxygen/js/mousescroll.js"></script>
  <script type="text/javascript" src="templates/oxygen/js/smoothscroll.js"></script>
  <script type="text/javascript" src="templates/oxygen/js/jquery.countTo.js"></script>
  <script type="text/javascript" src="templates/oxygen/js/lightbox.min.js"></script>
  <script type="text/javascript" src="templates/oxygen/js/main.js"></script>

</body>
</html>