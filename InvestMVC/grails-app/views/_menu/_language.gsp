<g:set var="lang" value="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE' ?: org.springframework.web.servlet.support.RequestContextUtils.getLocale(request).toString().substring(0,2)}"/>
<g:set var="currentURL" value="${request.forwardURI}"/>

<%--<ul class="nav secondary-nav language-dropdown pull-right">--%>
	<li class="dropdown dropdown-btn js-language-dropdown">
		<a class="dropdown-toggle" role="button" data-toggle="dropdown" data-target="#" href="javascript:;">
			<img class="" src="${resource(plugin: 'kickstart', dir: 'images/flags',file: lang.toString()+'.png')}" />
		</a>
		<ul class="dropdown-menu dropdown-menu-dark" role="menu">

			<!-- assuming that the default locale is English -->
			<li><a class="js-language-link" title="English" data-lang-code="en" href="${currentURL+'?lang=en'}">
				<img class="" src="${resource(plugin: 'kickstart', dir: 'images/flags',file: 'en.png')}"/>
				<g:message code="language.en" default="en"/> ${currentlURL }
			</a>
			<a class="js-language-link" title="Português" data-lang-code="pt" href="${currentURL+'?lang=pt'}">
				<img class="" src="${resource(plugin: 'kickstart', dir: 'images/flags',file: 'pt.png')}"/>
				<g:message code="language.pt" default="pt"/> ${currentlURL }
			</a></li>

			<li class="divider"></li>

		</ul>
	</li>
<%--</ul>--%>