<%@ page import="com.ligontech.Passport" %>



			<div class="control-group fieldcontain ${hasErrors(bean: passportInstance, field: 'expiryDate', 'error')} ">
				<label for="expiryDate" class="control-label"><g:message code="passport.expiryDate.label" default="Expiry Date" /></label>
				<div class="controls">
					<g:datePicker name="expiryDate" precision="day"  value="${passportInstance?.expiryDate}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: passportInstance, field: 'expiryDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: passportInstance, field: 'isDeleted', 'error')} ">
				<label for="isDeleted" class="control-label"><g:message code="passport.isDeleted.label" default="Is Deleted" /></label>
				<div class="controls">
					<g:textField name="isDeleted" value="${passportInstance?.isDeleted}"/>
					<span class="help-inline">${hasErrors(bean: passportInstance, field: 'isDeleted', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: passportInstance, field: 'issuedAddress', 'error')} ">
				<label for="issuedAddress" class="control-label"><g:message code="passport.issuedAddress.label" default="Issued Address" /></label>
				<div class="controls">
					<g:textField name="issuedAddress" value="${passportInstance?.issuedAddress}"/>
					<span class="help-inline">${hasErrors(bean: passportInstance, field: 'issuedAddress', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: passportInstance, field: 'issuedBy', 'error')} ">
				<label for="issuedBy" class="control-label"><g:message code="passport.issuedBy.label" default="Issued By" /></label>
				<div class="controls">
					<g:textField name="issuedBy" value="${passportInstance?.issuedBy}"/>
					<span class="help-inline">${hasErrors(bean: passportInstance, field: 'issuedBy', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: passportInstance, field: 'issuedDate', 'error')} ">
				<label for="issuedDate" class="control-label"><g:message code="passport.issuedDate.label" default="Issued Date" /></label>
				<div class="controls">
					<g:datePicker name="issuedDate" precision="day"  value="${passportInstance?.issuedDate}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: passportInstance, field: 'issuedDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: passportInstance, field: 'jobseeker', 'error')} ">
				<label for="jobseeker" class="control-label"><g:message code="passport.jobseeker.label" default="Jobseeker" /></label>
				<div class="controls">
					<g:select id="jobseeker" name="jobseeker.id" from="${com.ligontech.Jobseeker.list()}" optionKey="id" value="${passportInstance?.jobseeker?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: passportInstance, field: 'jobseeker', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: passportInstance, field: 'number', 'error')} ">
				<label for="number" class="control-label"><g:message code="passport.number.label" default="Number" /></label>
				<div class="controls">
					<g:textField name="number" value="${passportInstance?.number}"/>
					<span class="help-inline">${hasErrors(bean: passportInstance, field: 'number', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: passportInstance, field: 'remarks', 'error')} ">
				<label for="remarks" class="control-label"><g:message code="passport.remarks.label" default="Remarks" /></label>
				<div class="controls">
					<g:textField name="remarks" value="${passportInstance?.remarks}"/>
					<span class="help-inline">${hasErrors(bean: passportInstance, field: 'remarks', 'error')}</span>
				</div>
			</div>

