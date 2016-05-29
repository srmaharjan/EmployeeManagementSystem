<%@ page import="com.ligontech.Company" %>

<div class="control-group fieldcontain ${hasErrors(bean: companyInstance, field: 'name', 'error')} required">
      <label for="name" class="control-label"><g:message code="company.name.label" default="Name" /><span class="required-indicator">*</span></label>
      <div class="controls">
            <g:textField name="name" required="" value="${companyInstance?.name}"/>
            <span class="help-inline">${hasErrors(bean: companyInstance, field: 'name', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: companyInstance, field: 'phone', 'error')} required">
      <label for="phone" class="control-label"><g:message code="agent.phone.label" default="Phone No" />
            <span class="required-indicator">*</span></label>
      <div class="controls">
            <g:textField name="phone" required="" value="${companyInstance?.phone}"/>
            <span class="help-inline">${hasErrors(bean: companyInstance, field: 'phone', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: companyInstance, field: 'email', 'error')} ">
      <label for="email" class="control-label"><g:message code="agent.email.label" default="Email" /></label>
      <div class="controls">
            <g:field type="email" name="email" value="${companyInstance?.email}"/>
            <span class="help-inline">${hasErrors(bean: companyInstance, field: 'email', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: companyInstance, field: 'website', 'error')} ">
      <label for="website" class="control-label"><g:message code="agent.website.label" default="Website" /></label>
      <div class="controls">
            <g:field type="url" name="website" value="${companyInstance?.website}"/>
            <span class="help-inline">${hasErrors(bean: companyInstance, field: 'website', 'error')}</span>
      </div>
</div>

<g:render template="/shared/address" model="[item:'address',address:companyInstance?.address]" bean="${companyInstance?.address}"/>