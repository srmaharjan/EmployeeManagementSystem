<%@ page import="com.ligontech.NepAddress" %>



			<div class="control-group fieldcontain ${hasErrors(bean: addressInstance, field: 'district', 'error')} required">
				<label for="district" class="control-label"><g:message code="address.district.label" default="District" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="district" required="" value="${addressInstance?.district}"/>
					<span class="help-inline">${hasErrors(bean: addressInstance, field: 'district', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: addressInstance, field: 'zone', 'error')} required">
				<label for="zone" class="control-label"><g:message code="address.zone.label" default="Zone" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="zone" required="" value="${addressInstance?.zone}"/>
					<span class="help-inline">${hasErrors(bean: addressInstance, field: 'zone', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: addressInstance, field: 'country', 'error')} required">
				<label for="country" class="control-label"><g:message code="address.country.label" default="Country" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="country" name="country.code" from="${com.ligontech.Country.listAll.list()}" optionKey="code" required="" value="${addressInstance?.country?.code}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: addressInstance, field: 'country', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: addressInstance, field: 'blockNumber', 'error')} ">
				<label for="blockNumber" class="control-label"><g:message code="address.blockNumber.label" default="Block Number" /></label>
				<div class="controls">
					<g:textField name="blockNumber" value="${addressInstance?.blockNumber}"/>
					<span class="help-inline">${hasErrors(bean: addressInstance, field: 'blockNumber', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: addressInstance, field: 'isDeleted', 'error')} ">
				<label for="isDeleted" class="control-label"><g:message code="address.isDeleted.label" default="Is Deleted" /></label>
				<div class="controls">
					<g:textField name="isDeleted" value="${addressInstance?.isDeleted}"/>
					<span class="help-inline">${hasErrors(bean: addressInstance, field: 'isDeleted', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: addressInstance, field: 'muncipalityOrVdc', 'error')} ">
				<label for="muncipalityOrVdc" class="control-label"><g:message code="address.muncipalityOrVdc.label" default="Muncipality Or Vdc" /></label>
				<div class="controls">
					<g:textField name="muncipalityOrVdc" value="${addressInstance?.muncipalityOrVdc}"/>
					<span class="help-inline">${hasErrors(bean: addressInstance, field: 'muncipalityOrVdc', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: addressInstance, field: 'street', 'error')} ">
				<label for="street" class="control-label"><g:message code="address.street.label" default="Street" /></label>
				<div class="controls">
					<g:textField name="street" value="${addressInstance?.street}"/>
					<span class="help-inline">${hasErrors(bean: addressInstance, field: 'street', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: addressInstance, field: 'wardNumber', 'error')} ">
				<label for="wardNumber" class="control-label"><g:message code="address.wardNumber.label" default="Ward Number" /></label>
				<div class="controls">
					<g:textField name="wardNumber" value="${addressInstance?.wardNumber}"/>
					<span class="help-inline">${hasErrors(bean: addressInstance, field: 'wardNumber', 'error')}</span>
				</div>
			</div>

