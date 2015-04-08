
<%@ page import="investmvc.security.Expert" %>
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
			
				<g:sortableColumn property="mathematicalMethods" title="${message(code: 'expert.mathematicalMethods.label', default: 'Mathematical Methods')}" />
			
				<g:sortableColumn property="chartType" title="${message(code: 'expert.chartType.label', default: 'Chart Type')}" />
			
				<g:sortableColumn property="numberOfCandles" title="${message(code: 'expert.numberOfCandles.label', default: 'Number Of Candles')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${expertInstanceList}" status="i" var="expertInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${expertInstance.id}">${fieldValue(bean: expertInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: expertInstance, field: "mathematicalMethods")}</td>
			
				<td>${fieldValue(bean: expertInstance, field: "chartType")}</td>
			
				<td>${fieldValue(bean: expertInstance, field: "numberOfCandles")}</td>
			
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
