<%@ page import="investmvc.Expert" %>



			<div class="${hasErrors(bean: expertInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="expert.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" value="${expertInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: expertInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: expertInstance, field: 'quote', 'error')} required">
				<label for="quote" class="control-label"><g:message code="expert.quote.label" default="Quote" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" name="quote" type="number" value="${expertInstance.quote}" required=""/>
					<span class="help-inline">${hasErrors(bean: expertInstance, field: 'quote', 'error')}</span>
				</div>
			</div>

