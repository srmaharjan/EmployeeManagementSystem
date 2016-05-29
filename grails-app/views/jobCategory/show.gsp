
<%@ page import="com.ligontech.JobCategory" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'jobCategory.label', default: 'JobCategory')}" />
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
				
					<g:if test="${jobCategoryInstance?.value}">
						<dt><g:message code="jobCategory.value.label" default="Value" /></dt>
						
							<dd><g:fieldValue bean="${jobCategoryInstance}" field="value"/></dd>
						
					</g:if>
				
					<g:if test="${jobCategoryInstance?.dateCreated}">
						<dt><g:message code="jobCategory.dateCreated.label" default="Date Created" /></dt>
						
							<dd><g:formatDate date="${jobCategoryInstance?.dateCreated}" /></dd>
						
					</g:if>
				
					<g:if test="${jobCategoryInstance?.description}">
						<dt><g:message code="jobCategory.description.label" default="Description" /></dt>
						
							<dd><g:fieldValue bean="${jobCategoryInstance}" field="description"/></dd>
						
					</g:if>
				
					<g:if test="${jobCategoryInstance?.isDeleted}">
						<dt><g:message code="jobCategory.isDeleted.label" default="Is Deleted" /></dt>
						
							<dd><g:fieldValue bean="${jobCategoryInstance}" field="isDeleted"/></dd>
						
					</g:if>
				
					<g:if test="${jobCategoryInstance?.lastUpdated}">
						<dt><g:message code="jobCategory.lastUpdated.label" default="Last Updated" /></dt>
						
							<dd><g:formatDate date="${jobCategoryInstance?.lastUpdated}" /></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${jobCategoryInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${jobCategoryInstance?.id}">
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
