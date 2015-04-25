<nav id="Navbar" class="navbar navbar-fixed-top navbar-inverse" role="navigation">
	<div class="container">
	
	    <div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
        		<span class="sr-only">Toggle navigation</span>
        		<span class="icon-bar"></span>
	           	<span class="icon-bar"></span>
	           	<span class="icon-bar"></span>
			</button>
	
			<a class="navbar-brand" href="${createLink(uri: '/')}">
				<img class="logo" src="${resource(plugin: 'kickstart', dir:'images', file:'brand_logo.png')}" alt="${meta(name:'app.name')}" width="24px" height="24px"/> 
				${meta(name:'app.name')}
			</a>

		</div>

		<div class="collapse navbar-collapse navbar-ex1-collapse" role="navigation">

		<a class="navbar-brand" href="${createLink(uri: '/faq')}">FAQ
		</a>

		<a class="navbar-brand" href="${createLink(uri: '/conceitos')}">Conceitos
		</a>


    	<ul class="nav navbar-nav navbar-right">

    		<sec:ifNotLoggedIn>
				<a class="navbar-brand" href="${createLink(uri: '/login')}">
					<button type="button" class="btn btn-sm btn-success"><g:message code="security.signin.label" default ="Login" /></button></a>

				<a class="navbar-brand" href="${createLink(uri: '/register')}">
					<button type="button" class="btn btn-sm btn-primary"><g:message code="security.register.label" default="Register" /></button>
				</a>

			</sec:ifNotLoggedIn>
			<sec:ifLoggedIn>
				<a class="navbar-brand" href="${createLink(uri: '/logout')}">
					<button type="button" class="btn btn-sm btn-danger"><g:message code="security.signoff.label" default="Logout"/></button>
				</a>
			</sec:ifLoggedIn>

			<g:render template="/_menu/language"/>														
	    </ul>			

		</div>
	</div>
</nav>
