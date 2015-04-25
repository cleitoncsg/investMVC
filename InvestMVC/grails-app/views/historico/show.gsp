
<%@ page import="investmvc.Historico" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'historico.label', default: 'Historico')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
	<g:set var="layout_nosecondarymenu"	value="${true}" scope="request"/>
</head>

<body>

<section id="show-historico" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="historico.abertura.label" default="Abertura" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: historicoInstance, field: "abertura")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="historico.fechamento.label" default="Fechamento" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: historicoInstance, field: "fechamento")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="historico.numeroUsuario.label" default="Numero Usuario" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: historicoInstance, field: "numeroUsuario")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="historico.operacao.label" default="Operacao" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: historicoInstance, field: "operacao")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="historico.resultado.label" default="Resultado" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: historicoInstance, field: "resultado")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="historico.tempoAbertura.label" default="Tempo Abertura" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: historicoInstance, field: "tempoAbertura")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="historico.tempoFechamento.label" default="Tempo Fechamento" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: historicoInstance, field: "tempoFechamento")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
