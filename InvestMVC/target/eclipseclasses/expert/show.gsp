
<%@ page import="investmvc.Expert" %>
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
				<td valign="top" class="name"><g:message code="expert.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: expertInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="expert.quote.label" default="Quote" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: expertInstance, field: "quote")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
