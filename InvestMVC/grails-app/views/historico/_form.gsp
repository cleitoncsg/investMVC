<%@ page import="investmvc.Historico" %>

<g:set var="layout_nosecondarymenu"	value="${true}" scope="request"/>

			<div class="${hasErrors(bean: historicoInstance, field: 'abertura', 'error')} required">
				<label for="abertura" class="control-label"><g:message code="historico.abertura.label" default="Abertura" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" name="abertura" value="${fieldValue(bean: historicoInstance, field: 'abertura')}" required=""/>
					<span class="help-inline">${hasErrors(bean: historicoInstance, field: 'abertura', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: historicoInstance, field: 'fechamento', 'error')} required">
				<label for="fechamento" class="control-label"><g:message code="historico.fechamento.label" default="Fechamento" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" name="fechamento" value="${fieldValue(bean: historicoInstance, field: 'fechamento')}" required=""/>
					<span class="help-inline">${hasErrors(bean: historicoInstance, field: 'fechamento', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: historicoInstance, field: 'numeroUsuario', 'error')} ">
				<label for="numeroUsuario" class="control-label"><g:message code="historico.numeroUsuario.label" default="Numero Usuario" /></label>
				<div>
					<g:textField class="form-control" name="numeroUsuario" value="${historicoInstance?.numeroUsuario}"/>
					<span class="help-inline">${hasErrors(bean: historicoInstance, field: 'numeroUsuario', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: historicoInstance, field: 'operacao', 'error')} ">
				<label for="operacao" class="control-label"><g:message code="historico.operacao.label" default="Operacao" /></label>
				<div>
					<g:textField class="form-control" name="operacao" value="${historicoInstance?.operacao}"/>
					<span class="help-inline">${hasErrors(bean: historicoInstance, field: 'operacao', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: historicoInstance, field: 'resultado', 'error')} required">
				<label for="resultado" class="control-label"><g:message code="historico.resultado.label" default="Resultado" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" name="resultado" value="${fieldValue(bean: historicoInstance, field: 'resultado')}" required=""/>
					<span class="help-inline">${hasErrors(bean: historicoInstance, field: 'resultado', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: historicoInstance, field: 'tempoAbertura', 'error')} ">
				<label for="tempoAbertura" class="control-label"><g:message code="historico.tempoAbertura.label" default="Tempo Abertura" /></label>
				<div>
					<g:textField class="form-control" name="tempoAbertura" value="${historicoInstance?.tempoAbertura}"/>
					<span class="help-inline">${hasErrors(bean: historicoInstance, field: 'tempoAbertura', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: historicoInstance, field: 'tempoFechamento', 'error')} ">
				<label for="tempoFechamento" class="control-label"><g:message code="historico.tempoFechamento.label" default="Tempo Fechamento" /></label>
				<div>
					<g:textField class="form-control" name="tempoFechamento" value="${historicoInstance?.tempoFechamento}"/>
					<span class="help-inline">${hasErrors(bean: historicoInstance, field: 'tempoFechamento', 'error')}</span>
				</div>
			</div>

