<%@ page import="com.ligontech.FixedValue" %>



<div class="control-group fieldcontain ${hasErrors(bean: fixedValueInstance, field: 'value', 'error')} required">
    <label for="value" class="control-label"><g:message code="fixedValue.value.label" default="Value"/><span
            class="required-indicator">*</span></label>

    <div class="controls">
        <g:textField name="value" required="" value="${fixedValueInstance?.value}" class="medium"/>
        <span class="help-inline">${hasErrors(bean: fixedValueInstance, field: 'value', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: fixedValueInstance, field: 'fieldType', 'error')} required">
    <label for="fieldType" class="control-label">
        <g:message code="fixedValue.fieldType.label" default="Field Type"/><span
            class="required-indicator">*</span></label>
    <div class="controls">
        <g:select name="fieldType" from="${com.ligontech.FieldType?.values()}"
                  keys="${com.ligontech.FieldType.values()*.name()}" required=""
                  value="${fixedValueInstance?.fieldType?.name()}" noSelection="['':'--Select--']" class="medium"/>
        <span class="help-inline">${hasErrors(bean: fixedValueInstance, field: 'fieldType', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: fixedValueInstance, field: 'description', 'error')} ">
    <label for="description" class="control-label">
        <g:message code="fixedValue.description.label" default="Description"/></label>

    <div class="controls">
        <g:textArea rows="3" name="description" class="large">${fixedValueInstance?.description}</g:textArea>
        <span class="help-inline">${hasErrors(bean: fixedValueInstance, field: 'description', 'error')}</span>
    </div>
</div>
<g:render template="/shared/customerList" model="[bean:fixedValueInstance?.customer]" bean="${fixedValueInstance?.customer}"/>

