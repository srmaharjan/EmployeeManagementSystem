
<%@ page import="com.ligontech.Training" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'training.label', default: 'Training')}" />
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
				
					<g:if test="${trainingInstance?.topic}">
						<dt><g:message code="training.topic.label" default="Topic" /></dt>
						
							<dd><g:fieldValue bean="${trainingInstance}" field="topic"/></dd>
						
					</g:if>
				
					<g:if test="${trainingInstance?.trainingObjective}">
						<dt><g:message code="training.trainingObjective.label" default="Training Objective" /></dt>
						
							<dd><g:fieldValue bean="${trainingInstance}" field="trainingObjective"/></dd>
						
					</g:if>
				
					<g:if test="${trainingInstance?.duration}">
						<dt><g:message code="training.duration.label" default="Duration" /></dt>
						
							<dd><g:fieldValue bean="${trainingInstance}" field="duration"/></dd>
						
					</g:if>
				
					<g:if test="${trainingInstance?.dateCreated}">
						<dt><g:message code="training.dateCreated.label" default="Date Created" /></dt>
						
							<dd><g:formatDate date="${trainingInstance?.dateCreated}" /></dd>
						
					</g:if>
				
					<g:if test="${trainingInstance?.isDeleted}">
						<dt><g:message code="training.isDeleted.label" default="Is Deleted" /></dt>
						
							<dd><g:fieldValue bean="${trainingInstance}" field="isDeleted"/></dd>
						
					</g:if>
				
					<g:if test="${trainingInstance?.jobseeker}">
						<dt><g:message code="training.jobseeker.label" default="Jobseeker" /></dt>
						
							<dd><g:link controller="jobseeker" action="show" id="${trainingInstance?.jobseeker?.id}">${trainingInstance?.jobseeker?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${trainingInstance?.lastUpdated}">
						<dt><g:message code="training.lastUpdated.label" default="Last Updated" /></dt>
						
							<dd><g:formatDate date="${trainingInstance?.lastUpdated}" /></dd>
						
					</g:if>
				
					<g:if test="${trainingInstance?.trainingCenter}">
						<dt><g:message code="training.trainingCenter.label" default="Training Center" /></dt>
						
							<dd><g:fieldValue bean="${trainingInstance}" field="trainingCenter"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${trainingInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${trainingInstance?.id}">
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
