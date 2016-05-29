
<%@ page import="com.ligontech.Company" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}" />
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
				
					<g:if test="${companyInstance?.name}">
						<dt><g:message code="company.name.label" default="Name" /></dt>
						
							<dd><g:fieldValue bean="${companyInstance}" field="name"/></dd>
						
					</g:if>
				
					<g:if test="${companyInstance?.address}">
						<dt><g:message code="company.address.label" default="Address" /></dt>
						
							<dd><g:link controller="address" action="show" id="${companyInstance?.address?.id}">${companyInstance?.address?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${companyInstance?.dateCreated}">
						<dt><g:message code="company.dateCreated.label" default="Date Created" /></dt>
						
							<dd><g:formatDate date="${companyInstance?.dateCreated}" /></dd>
						
					</g:if>
				
					<g:if test="${companyInstance?.isDeleted}">
						<dt><g:message code="company.isDeleted.label" default="Is Deleted" /></dt>
						
							<dd><g:fieldValue bean="${companyInstance}" field="isDeleted"/></dd>
						
					</g:if>
				
					<g:if test="${companyInstance?.lastUpdated}">
						<dt><g:message code="company.lastUpdated.label" default="Last Updated" /></dt>
						
							<dd><g:formatDate date="${companyInstance?.lastUpdated}" /></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${companyInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${companyInstance?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-danger button" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>

			</div>

		</div>
	</body>
</html>
