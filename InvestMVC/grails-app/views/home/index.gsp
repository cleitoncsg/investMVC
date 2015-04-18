<!DOCTYPE html>

<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

		<sec:ifNotLoggedIn>
			<g:set var="layout_nomainmenu"		value="${true}" scope="request"/>
			<g:set var="layout_nosecondarymenu"	value="${true}" scope="request"/>
		</sec:ifNotLoggedIn>
  
  

  <link rel="stylesheet" href="${resource(dir: 'css', file: 'carousel.css')}" type="text/css">
  <r:require modules="jquery"/>
  <r:require modules="bootstrap"/>
  <r:require modules="bootstrap_utils"/>


  <r:layoutResources />
</head>


<body>
  <g:render template="/_menu/navbar"/>
<!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>


      <div class="carousel-inner">
        <div class="item active">
          <img data-src="holder.js/900x500/auto/#777:#7a7a7a/text:First slide" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Join this Business</h1>
              <p>Become an investor in Currency Trading , in just a minute you can make an account and have access to all of our functionality</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img data-src="holder.js/900x500/auto/#666:#6a6a6a/text:Second slide" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Learn to invest in Forex.</h1>
              <p>If you do not understand about this business , our site provides a page fregquentes questions and provides introductory information for the Forex.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img data-src="holder.js/900x500/auto/#555:#5a5a5a/text:Third slide" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>A new way of investing.</h1>
              <p>With InvestMVC your money earns safely , one need not wasted your time with anything else. We facilitate your life.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign In</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
    </div><!-- /.carousel -->

    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="bootstrap.min.js"></script>
    <script src="holder.js"></script>
<!--
	<section id="intro" class="first">
		<h1>Welcome to Kickstart with Bootstrap 3.0.3 for Grails 2.3</h1>
		<p>
			Congratulations, you have successfully started your first
			Grails application with the Kickstart extension! At the moment this
			is the default page, feel free to modify it to either redirect to a
			controller or display whatever content you may choose.
		</p>
	</section>


	<section id="info">
		<div class="row">
	    	<div class="col-md-4">
	    		  <video width="800" height="600" autoplay>
	    			<source src="${resource(dir: 'images', file: 'movie.mp4')}" type="video/mp4">
	    			</video> 
	    		
		    	<div class="center">
					<img src="${resource(dir: 'images', file: 'login.png')}" alt="Grails"/>
					<h3><a href="login/index">Login</a></h3>
				</div>
				
				<p>Acessua sua conta do Invest MVC e controle seus Expert do Forex
				</p>
			</div>
	    	<div class="col-md-4">
		    	<div class="center">
					<img src="${resource(dir: 'images', file: 'register.png')}" alt="Grails"/>
					<h3><a href="user/create">Register</a></h3>
				</div>
				<p>Caso não possua uma conta, crie uma agora em menos de 5 minutos</p>
			
			</div>
	</section>-->
  <r:layoutResources />
  </body>
</html>
