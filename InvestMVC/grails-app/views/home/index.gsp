<html>

<head>
	<meta name="layout" content="kickstart"/>
		<sec:ifNotLoggedIn>
			<g:set var="layout_nomainmenu"		value="${true}" scope="request"/>
			<g:set var="layout_nosecondarymenu"	value="${true}" scope="request"/>
		</sec:ifNotLoggedIn>
</head>
	
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


</html>
