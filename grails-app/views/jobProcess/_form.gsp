<%@ page import="com.ligontech.JobProcess" %>



			<div class="control-group fieldcontain ${hasErrors(bean: jobProcessInstance, field: 'job', 'error')} required">
				<label for="job" class="control-label"><g:message code="jobProcess.job.label" default="Job" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="job" name="job.id" from="${com.ligontech.Jobs.list()}" optionKey="id" required="" value="${jobProcessInstance?.job?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: jobProcessInstance, field: 'job', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: jobProcessInstance, field: 'process', 'error')} required">
				<label for="process" class="control-label"><g:message code="jobProcess.process.label" default="Process" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="process" name="process.id" from="${com.ligontech.Process.list()}" optionKey="id" required="" value="${jobProcessInstance?.process?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: jobProcessInstance, field: 'process', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: jobProcessInstance, field: 'jobseeker', 'error')} required">
				<label for="jobseeker" class="control-label"><g:message code="jobProcess.jobseeker.label" default="Jobseeker" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="jobseeker" name="jobseeker.id" from="${com.ligontech.Jobseeker.list()}" optionKey="id" required="" value="${jobProcessInstance?.jobseeker?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: jobProcessInstance, field: 'jobseeker', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: jobProcessInstance, field: 'customer', 'error')} ">
				<label for="customer" class="control-label"><g:message code="jobProcess.customer.label" default="Customer" /></label>
				<div class="controls">
					<g:select id="customer" name="customer.id" from="${com.ligontech.usermanagement.Customer.list()}" optionKey="id" value="${jobProcessInstance?.customer?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: jobProcessInstance, field: 'customer', 'error')}</span>
				</div>
			</div>

