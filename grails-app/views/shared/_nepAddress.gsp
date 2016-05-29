<%@ page import="com.ligontech.FieldType; com.ligontech.NepAddress" %>
<g:if test="${isEdit}">
    <g:hiddenField name="${item}.id" value="${address?.id}"/>
</g:if>
<div class="control-group fieldcontain ${hasErrors(bean: address, field: 'blockNumber', 'error')} ">
    <label for="${item}.blockNumber" class="control-label"><g:message code="address.blockNumber.label" default="Block Number" /></label>
    <div class="controls">
        <g:textField name="${item}.blockNumber" value="${address?.blockNumber}"/>
        <span class="help-inline">${hasErrors(bean: address, field: 'blockNumber', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: address, field: 'street', 'error')} ">
    <label for="${item}.street" class="control-label"><g:message code="address.street.label" default="Street" /></label>
    <div class="controls">
        <g:textField name="${item}.street" value="${address?.street}"/>
        <span class="help-inline">${hasErrors(bean: address, field: 'street', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: address, field: 'wardNumber', 'error')} ">
    <label for="${item}.wardNumber" class="control-label"><g:message code="address.wardNumber.label" default="Ward Number" /></label>
    <div class="controls">
        <g:textField name="${item}.wardNumber" class="span2" value="${address?.wardNumber}"/>
        <span class="help-inline">${hasErrors(bean: address, field: 'wardNumber', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: address, field: 'muncipalityOrVdc', 'error')} ">
    <label for="${item}.muncipalityOrVdc" class="control-label"><g:message code="address.muncipalityOrVdc.label" default="Muncipality/Vdc" /></label>
    <div class="controls controls-row">
        %{--<div class="controls">--}%
        <g:textField name="${item}.muncipalityOrVdc"  value="${address?.muncipalityOrVdc}"/>
        <span class="help-inline">${hasErrors(bean: address, field: 'muncipalityOrVdc', 'error')}</span>
        %{--</div>--}%
        %{--<div class="controls">--}%
        %{--<g:textField name="${item}.wardNumber" class="span1" value="${address?.wardNumber}"/>--}%
        %{--<span class="help-inline">${hasErrors(bean: address, field: 'wardNumber', 'error')}</span>--}%
        %{--</div>--}%
    </div>
</div>


<div class="control-group fieldcontain ${hasErrors(bean: address, field: 'district', 'error')} required">
    <label for="${item}.district" class="control-label"><g:message code="address.district.label" default="District" /><span class="required-indicator">*</span></label>
    <div class="controls">
        <g:select id="district" name="${item}.district.id" from="${district}" optionKey="id"  value="${address?.district?.id}" class="many-to-one select-menu" data-provide="typeahead"/>
        %{--<g:textField name="${item}.district" required="" value="${address?.district}"/>--}%
        <span class="help-inline">${hasErrors(bean: address, field: 'district', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: address, field: 'zone', 'error')} required">
    <label for="${item}.zone" class="control-label"><g:message code="address.zone.label" default="Zone" /><span class="required-indicator">*</span></label>
    <div class="controls">
        %{--<g:textField name="${item}.zone" required="" value="${address?.zone}"/>--}%
        <g:select id="zone" name="${item}.zone.id" from="${zone}" optionKey="id"  value="${address?.zone?.id}" class="many-to-one select-menu" data-provide="typeahead"/>
        <span class="help-inline">${hasErrors(bean: address, field: 'zone', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: address, field: 'country', 'error')} required">
    <label for="${item}.country" class="control-label"><g:message code="address.country.label" default="Country" />
        <span class="required-indicator">*</span>
    </label>
    <div class="controls">
        <g:select id="country" name="${item}.country.id" from="${country}" optionKey="id"  value="${address?.country?.id}" class="many-to-one select-menu" data-provide="typeahead"/>
        <span class="help-inline">${hasErrors(bean: address, field: 'country', 'error')}</span>
    </div>
</div>