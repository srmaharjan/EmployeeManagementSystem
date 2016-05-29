<%@ page import="com.ligontech.FieldType; com.ligontech.Address" %>
<g:if test="${address?.id}">
      <g:hiddenField name="${item}.id" value="${address?.id}"/>
</g:if>
<div class="control-group fieldcontain ${hasErrors(bean: address, field: 'blockNumber', 'error')} ">
      <label for="${item}.street" class="control-label"><g:message code="address.street.label" default="Street" /></label>
      <div class="controls">
            <g:textField name="${item}.street" value="${address?.street}"/>
            <span class="help-inline">${hasErrors(bean: address, field: 'street', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: address, field: 'city', 'error')} ">
      <label for="${item}.city" class="control-label"><g:message code="address.city.label" default="City" /></label>
      <div class="controls">
            <g:textField name="${item}.city" value="${address?.city}"/>
            <span class="help-inline">${hasErrors(bean: address, field: 'city', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: address, field: 'country', 'error')} required">
      <label for="${item}.country" class="control-label"><g:message code="address.country.label" default="Country" />
            <span class="required-indicator">*</span>
      </label>
      <div class="controls">
            <g:select id="country" name="${item}.country.id" from="${com.ligontech.Country.listAll.list()}" optionKey="id"  value="${address?.country?.id}" class="many-to-one typeahead" data-provide="typeahead"/>
            <span class="help-inline">${hasErrors(bean: address, field: 'country', 'error')}</span>
      </div>
</div>