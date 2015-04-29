\<!DOCTYPE html>

<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">  
    <link rel="shortcut icon"   href="${resource(dir:'images',file:'coin.png')}" type="image/x-icon" />
  

  <link rel="stylesheet" href="${resource(dir: 'css', file: 'carousel.css')}" type="text/css">
  <r:require modules="jquery"/>
  <r:require modules="bootstrap"/>
  <r:require modules="bootstrap_utils"/>


  <r:layoutResources />
</head>


<body>
  <g:render template="/_menu/navbar"/>

  <sec:ifLoggedIn>
    <br>
    <g:render template="/_menu/menubar"/>
    <br>
  </sec:ifLoggedIn>
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
          <img data-src="holder.js/900x500/auto/#FFF:#001535/text:First slide" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1><g:message code="carousel.1Title.label" default="Join this Business"/></h1>
              <p><g:message code="carousel.1Text.label" default="Become an investor in Currency Trading , in just a minute you can make an account and have access to all of our functionality"/></p>
              <p><a class="btn btn-lg btn-primary" href="${createLink(uri: '/register')}" role="button"><g:message code="security.register.label" default="Register"/></a></p>
            </div>
          </div>
        </div>


        <div class="item">
          <img data-src="holder.js/900x500/auto/#666:#6a6a6a/text:Second slide" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1><g:message code="carousel.2Title.label" default="A new way of investing"/></h1>
              <p><g:message code="carousel.2Text.label" default="With InvestMVC your money earns safely , one need not wasted your time with anything else . We facilitate your life"/></p>
              <p><a class="btn btn-lg btn-primary" href="${createLink(uri: '/faq')}" role="button"><g:message code="default.faq.label" default="FAQ"/></a></p>
            </div>
          </div>
        </div>

        <div class="item">
          <img data-src="holder.js/900x500/auto/#555:#5a5a5a/text:Third slide" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1><g:message code="carousel.3Title.label" default="Learn to invest in Forex"/></h1>
              <p><g:message code="carousel.3Text.label" default="If you do not understand about this business , our site provides a page fregquentes questions and provides introductory information for the Forex"/></p>
              <p><a class="btn btn-lg btn-primary" href="${createLink(uri: '/login')}" role="button"><g:message code="security.signin.label" default="Login"/></a>
              </p>
            </div>
          </div>
        </div>

      </div>
<!--
      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon-chevron-left"></span></a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="  glyphicon-chevron-right"></span></a>
    </div><!-- /.carousel -->

    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="bootstrap.min.js"></script>
    <script src="holder.js"></script>

  <r:layoutResources />
  </body>
</html>
    