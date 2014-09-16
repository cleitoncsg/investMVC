<html>

<head>
	<title><g:message code="default.welcome.title" args="[meta(name:'app.name')]"/> </title>
	<meta name="layout" content="kickstart" />
</head>

<body>

	<section id="intro" class="first">
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
		    	<div class="center">
					<img src="${resource(dir: 'images', file: 'login.png')}" alt="Grails"/>
					<h3>Login</h3>
				</div>
				<p>Acessua sua conta do Invest MVC e controle seus Expert do Forex
				</p>
			</div>
	    	<div class="col-md-4">
		    	<div class="center">
					<img src="${resource(dir: 'images', file: 'register.png')}" alt="Grails"/>
					<h3>Register</h3>
				</div>
				<p>Caso não possua uma conta, crie uma agora em menos de 5 minutos</p>
			</div>
	</section>
</body>

</html>
