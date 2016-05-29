
<%@ page import="com.ligontech.Process" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'process.label', default: 'Process')}" />
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
				

				
					<g:if test="${processInstance?.country}">
						<dt><g:message code="process.country.label" default="Country" /></dt>
						
							<dd><g:link controller="country" action="show" id="${processInstance?.country?.id}">${processInstance?.country?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${processInstance?.dateCreated}">
						<dt><g:message code="process.dateCreated.label" default="Date Created" /></dt>
						
							<dd><g:formatDate date="${processInstance?.dateCreated}" /></dd>
						
					</g:if>
				
					<g:if test="${processInstance?.description}">
						<dt><g:message code="process.description.label" default="Description" /></dt>
						
							<dd><g:fieldValue bean="${processInstance}" field="description"/></dd>
						
					</g:if>
				
					<g:if test="${processInstance?.includeInProcess}">
						<dt><g:message code="process.includeInProcess.label" default="Include In Process" /></dt>
						
							<dd><g:formatBoolean boolean="${processInstance?.includeInProcess}" /></dd>
						
					</g:if>
				
					<g:if test="${processInstance?.isDeleted}">
						<dt><g:message code="process.isDeleted.label" default="Is Deleted" /></dt>
						
							<dd><g:fieldValue bean="${processInstance}" field="isDeleted"/></dd>
						
					</g:if>
				
					<g:if test="${processInstance?.lastUpdated}">
						<dt><g:message code="process.lastUpdated.label" default="Last Updated" /></dt>
						
							<dd><g:formatDate date="${processInstance?.lastUpdated}" /></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="code" value="${processInstance?.code}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${processInstance?.code}">
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
