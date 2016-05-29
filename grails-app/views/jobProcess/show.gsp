
<%@ page import="com.ligontech.JobProcess" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'jobProcess.label', default: 'JobProcess')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li>
							<g:link class="list" action="list">
								<i class="icon-list"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="span9">

				<div class="page-header">
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
				
					<g:if test="${jobProcessInstance?.job}">
						<dt><g:message code="jobProcess.job.label" default="Job" /></dt>
						
							<dd><g:link controller="jobs" action="show" id="${jobProcessInstance?.job?.id}">${jobProcessInstance?.job?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${jobProcessInstance?.process}">
						<dt><g:message code="jobProcess.process.label" default="Process" /></dt>
						
							<dd><g:link controller="process" action="show" id="${jobProcessInstance?.process?.id}">${jobProcessInstance?.process?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${jobProcessInstance?.jobseeker}">
						<dt><g:message code="jobProcess.jobseeker.label" default="Jobseeker" /></dt>
						
							<dd><g:link controller="jobseeker" action="show" id="${jobProcessInstance?.jobseeker?.id}">${jobProcessInstance?.jobseeker?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${jobProcessInstance?.customer}">
						<dt><g:message code="jobProcess.customer.label" default="Customer" /></dt>
						
							<dd><g:link controller="customer" action="show" id="${jobProcessInstance?.customer?.id}">${jobProcessInstance?.customer?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${jobProcessInstance?.dateCreated}">
						<dt><g:message code="jobProcess.dateCreated.label" default="Date Created" /></dt>
						
							<dd><g:formatDate date="${jobProcessInstance?.dateCreated}" /></dd>
						
					</g:if>
				
					<g:if test="${jobProcessInstance?.lastUpdated}">
						<dt><g:message code="jobProcess.lastUpdated.label" default="Last Updated" /></dt>
						
							<dd><g:formatDate date="${jobProcessInstance?.lastUpdated}" /></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${jobProcessInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${jobProcessInstance?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>

			</div>

		</div>
	</body>
</html>
