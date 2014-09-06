
<%@ page import="investmvc.Expert" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'expert.label', default: 'Expert')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-expert" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'expert.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="quote" title="${message(code: 'expert.quote.label', default: 'Quote')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${expertInstanceList}" status="i" var="expertInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${expertInstance.id}">${fieldValue(bean: expertInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: expertInstance, field: "quote")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${expertInstanceCount}" />
	</div>
</section>

</body>

</html>
