
<%@ page import="com.ligontech.ApplicationProcess" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'applicationProcess.label', default: 'ApplicationProcess')}" />
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
				
					<g:if test="${applicationProcessInstance?.demand}">
						<dt><g:message code="applicationProcess.demand.label" default="Demand" /></dt>
						
							<dd><g:link controller="demand" action="show" id="${applicationProcessInstance?.demand?.id}">${applicationProcessInstance?.demand?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${applicationProcessInstance?.jobs}">
						<dt><g:message code="applicationProcess.jobs.label" default="Jobs" /></dt>
						
							<dd><g:link controller="jobs" action="show" id="${applicationProcessInstance?.jobs?.id}">${applicationProcessInstance?.jobs?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${applicationProcessInstance?.jobseeker}">
						<dt><g:message code="applicationProcess.jobseeker.label" default="Jobseeker" /></dt>
						
							<dd><g:link controller="jobseeker" action="show" id="${applicationProcessInstance?.jobseeker?.id}">${applicationProcessInstance?.jobseeker?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${applicationProcessInstance?.process}">
						<dt><g:message code="applicationProcess.process.label" default="Process" /></dt>
						
							<g:each in="${applicationProcessInstance.process}" var="p">
							<dd><g:link controller="process" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${applicationProcessInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${applicationProcessInstance?.id}">
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
