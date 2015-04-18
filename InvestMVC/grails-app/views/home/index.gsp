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
              <h1>Junte-se a este negócio</h1>
              <p>Torne-se um investidor no Mercado de Moedas, em apenas um minuto você consegue fazer uma conta e ter acesso à todas as nossas funcionalidade</p>
              <p><a class="navbar-brand" href="${createLink(uri: '/register')}"><button type="button" class="btn btn-sm btn-primary">Register</button></a></p>
            </div>
          </div>
        </div>


        <div class="item">
          <img data-src="holder.js/900x500/auto/#666:#6a6a6a/text:Second slide" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Aprenda a investir no Mercado de Moedas</h1>
              <p>Caso você não entenda sobre este negócio, nosso site fornece uma página de perguntas fregquentes e fornece informações introdutórias para o Mercado de Moedas</p>
              <p><a class="navbar-brand" href="${createLink(uri: '/faq')}"><button type="button" class="btn btn-sm btn-primary">FAQ</button></a></p>
            </div>
          </div>
        </div>

        <div class="item">
          <img data-src="holder.js/900x500/auto/#555:#5a5a5a/text:Third slide" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Um novo jeito de investir</h1>
              <p>Caso você não entenda sobre este negócio, nosso site fornece uma página de perguntas fregquentes e fornece informações introdutórias para o Mercado de Moedas</p>
              <p><a class="navbar-brand" href="${createLink(uri: '/login')}"><button type="button" class="btn btn-sm btn-primary">Login</button></a>
              </p>
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

  <r:layoutResources />
  </body>
</html>
