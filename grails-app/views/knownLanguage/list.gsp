
<%@ page import="com.ligontech.KnownLanguage" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'knownLanguage.label', default: 'KnownLanguage')}" />
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
						
							<th class="header"><g:message code="knownLanguage.language.label" default="Language" /></th>
						
							<g:sortableColumn property="dateCreated" title="${message(code: 'knownLanguage.dateCreated.label', default: 'Date Created')}" />
						
							<g:sortableColumn property="isDeleted" title="${message(code: 'knownLanguage.isDeleted.label', default: 'Is Deleted')}" />
						
							<th class="header"><g:message code="knownLanguage.jobseeker.label" default="Jobseeker" /></th>
						
							<g:sortableColumn property="lastUpdated" title="${message(code: 'knownLanguage.lastUpdated.label', default: 'Last Updated')}" />
						
							<th class="header"><g:message code="knownLanguage.reading.label" default="Reading" /></th>
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${knownLanguageInstanceList}" var="knownLanguageInstance">
						<tr>
						
							<td>${fieldValue(bean: knownLanguageInstance, field: "language")}</td>
						
							<td><g:formatDate date="${knownLanguageInstance.dateCreated}" /></td>
						
							<td>${fieldValue(bean: knownLanguageInstance, field: "isDeleted")}</td>
						
							<td>${fieldValue(bean: knownLanguageInstance, field: "jobseeker")}</td>
						
							<td><g:formatDate date="${knownLanguageInstance.lastUpdated}" /></td>
						
							<td>${fieldValue(bean: knownLanguageInstance, field: "reading")}</td>
						
							<td class="link">
								<g:link action="show" id="${knownLanguageInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${knownLanguageInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
