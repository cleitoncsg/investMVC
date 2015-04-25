
<%@ page import="investmvc.Historico" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'historico.label', default: 'Historico')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:set var="layout_nosecondarymenu"	value="${true}" scope="request"/>
</head>

<body>

<section id="list-historico" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="abertura" title="${message(code: 'historico.abertura.label', default: 'Abertura')}" />
			
				<g:sortableColumn property="fechamento" title="${message(code: 'historico.fechamento.label', default: 'Fechamento')}" />
			
				<g:sortableColumn property="numeroUsuario" title="${message(code: 'historico.numeroUsuario.label', default: 'Numero Usuario')}" />
			
				<g:sortableColumn property="operacao" title="${message(code: 'historico.operacao.label', default: 'Operacao')}" />
			
				<g:sortableColumn property="resultado" title="${message(code: 'historico.resultado.label', default: 'Resultado')}" />
			
				<g:sortableColumn property="tempoAbertura" title="${message(code: 'historico.tempoAbertura.label', default: 'Tempo Abertura')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${historicoInstanceList}" status="i" var="historicoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${historicoInstance.id}">${fieldValue(bean: historicoInstance, field: "abertura")}</g:link></td>
			
				<td>${fieldValue(bean: historicoInstance, field: "fechamento")}</td>
			
				<td>${fieldValue(bean: historicoInstance, field: "numeroUsuario")}</td>
			
				<td>${fieldValue(bean: historicoInstance, field: "operacao")}</td>
			
				<td>${fieldValue(bean: historicoInstance, field: "resultado")}</td>
			
				<td>${fieldValue(bean: historicoInstance, field: "tempoAbertura")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${historicoInstanceCount}" />
	</div>
</section>

</body>

</html>
