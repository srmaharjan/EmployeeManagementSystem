<%@ page import="com.ligontech.JobCategory" %>

<div class="control-group fieldcontain ${hasErrors(bean: jobCategoryInstance, field: 'value', 'error')} required">
      <label for="value" class="control-label"><g:message code="jobCategory.value.label" default="Value" /><span class="required-indicator">*</span></label>
      <div class="controls">
            <g:textField name="value" required="" value="${jobCategoryInstance?.value}"/>
            <span class="help-inline">${hasErrors(bean: jobCategoryInstance, field: 'value', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: jobCategoryInstance, field: 'description', 'error')} ">
      <label for="description" class="control-label"><g:message code="jobCategory.description.label" default="Description" /></label>
      <div class="controls">
            <g:textArea rows="3" name="description">${jobCategoryInstance?.description}</g:textArea>
            <span class="help-inline">${hasErrors(bean: jobCategoryInstance, field: 'description', 'error')}</span>
      </div>
</div>
<g:render template="/shared/customerList" model="[bean:jobCategoryInstance?.customer]" bean="${jobCategoryInstance?.customer}"/>

