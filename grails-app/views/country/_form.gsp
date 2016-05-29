<%@ page import="com.ligontech.Country" %>

<div class="control-group fieldcontain ${hasErrors(bean: countryInstance, field: 'value', 'error')} required">
      <label for="value" class="control-label"><g:message code="country.value.label" default="Value" /><span class="required-indicator">*</span></label>
      <div class="controls">
            <g:textField name="value" required="" value="${countryInstance?.value}"/>
            <span class="help-inline">${hasErrors(bean: countryInstance, field: 'value', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: countryInstance, field: 'description', 'error')} ">
      <label for="description" class="control-label"><g:message code="country.description.label" default="Description" /></label>
      <div class="controls">
            <g:textArea rows="3" name="description">${countryInstance?.description}</g:textArea>
            <span class="help-inline">${hasErrors(bean: countryInstance, field: 'description', 'error')}</span>
      </div>
</div>
<g:render template="/shared/customerList" model="[bean:countryInstance?.customer]" bean="${countryInstance?.customer}"/>

