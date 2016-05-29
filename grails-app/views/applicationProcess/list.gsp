
<%@ page import="com.ligontech.ApplicationProcess" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'applicationProcess.label', default: 'ApplicationProcess')}" />
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
                        <g:render template="search"/>
				<table class="table table-striped">
					<thead>
						<tr>
						
							<th class="header"><g:message code="applicationProcess.demand.label" default="Demand" /></th>
						
							<th class="header"><g:message code="applicationProcess.jobs.label" default="Jobs" /></th>
						
							<th class="header"><g:message code="applicationProcess.jobseeker.label" default="Jobseeker" /></th>
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${applicationProcessInstanceList}" var="applicationProcessInstance">
						<tr>
						
							<td>${fieldValue(bean: applicationProcessInstance, field: "demand")}</td>
						
							<td>${fieldValue(bean: applicationProcessInstance, field: "jobs")}</td>
						
							<td>${fieldValue(bean: applicationProcessInstance, field: "jobseeker")}</td>
						
							<td class="link">
								<g:link action="show" id="${applicationProcessInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${applicationProcessInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
