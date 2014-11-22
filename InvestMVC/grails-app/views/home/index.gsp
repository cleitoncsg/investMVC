<html>

<head>
	<title><g:message code="default.welcome.title" args="[meta(name:'app.name')]"/> </title>
	<meta name="layout" content="kickstart" />
</head>

<body>
	<section id="info">
		<div class="row">
	    	<div class="col-md-4">
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
	</section>
</body>

</html>
