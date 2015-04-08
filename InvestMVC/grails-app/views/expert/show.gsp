
<%@ page import="investmvc.security.Expert" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'expert.label', default: 'Expert')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-expert" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="expert.chartType.label" default="Chart Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: expertInstance, field: "chartType")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="expert.mathematicalMethods.label" default="Mathematical Methods" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: expertInstance, field: "mathematicalMethods")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="expert.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: expertInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="expert.numberOfCandles.label" default="Number Of Candles" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: expertInstance, field: "numberOfCandles")}</td>
				
			</tr>
		
		</tbody>
	</table>

	<g:link class="btn btn-large btn-info" action="ativarExpert" resource="${expertInstance}"><g:message code="expert.activate" default="Activate Expert" /></g:link>

</section>

</body>

</html>
