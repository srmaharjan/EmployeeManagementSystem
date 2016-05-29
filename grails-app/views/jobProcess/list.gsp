
<%@ page import="com.ligontech.JobProcess" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'jobProcess.label', default: 'JobProcess')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li class="active">
							<g:link class="list" action="list">
								<i class="icon-list icon-white"></i>
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
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
						
							<th class="header"><g:message code="jobProcess.job.label" default="Job" /></th>
						
							<th class="header"><g:message code="jobProcess.process.label" default="Process" /></th>
						
							<th class="header"><g:message code="jobProcess.jobseeker.label" default="Jobseeker" /></th>
						
							<th class="header"><g:message code="jobProcess.customer.label" default="Customer" /></th>
						
							<g:sortableColumn property="dateCreated" title="${message(code: 'jobProcess.dateCreated.label', default: 'Date Created')}" />
						
							<g:sortableColumn property="lastUpdated" title="${message(code: 'jobProcess.lastUpdated.label', default: 'Last Updated')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${jobProcessInstanceList}" var="jobProcessInstance">
						<tr>
						
							<td>${fieldValue(bean: jobProcessInstance, field: "job")}</td>
						
							<td>${fieldValue(bean: jobProcessInstance, field: "process")}</td>
						
							<td>${fieldValue(bean: jobProcessInstance, field: "jobseeker")}</td>
						
							<td>${fieldValue(bean: jobProcessInstance, field: "customer")}</td>
						
							<td><g:formatDate date="${jobProcessInstance.dateCreated}" /></td>
						
							<td><g:formatDate date="${jobProcessInstance.lastUpdated}" /></td>
						
							<td class="link">
								<g:link action="show" id="${jobProcessInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${jobProcessInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
