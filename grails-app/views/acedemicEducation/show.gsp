
<%@ page import="com.ligontech.AcedemicEducation" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'acedemicEducation.label', default: 'AcedemicEducation')}" />
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
				
					<g:if test="${acedemicEducationInstance?.degree}">
						<dt><g:message code="acedemicEducation.degree.label" default="Degree" /></dt>
						
							<dd><g:fieldValue bean="${acedemicEducationInstance}" field="degree"/></dd>
						
					</g:if>
				
					<g:if test="${acedemicEducationInstance?.nameOfDegree}">
						<dt><g:message code="acedemicEducation.nameOfDegree.label" default="Name Of Degree" /></dt>
						
							<dd><g:fieldValue bean="${acedemicEducationInstance}" field="nameOfDegree"/></dd>
						
					</g:if>
				
					<g:if test="${acedemicEducationInstance?.college_school}">
						<dt><g:message code="acedemicEducation.college_school.label" default="Collegeschool" /></dt>
						
							<dd><g:fieldValue bean="${acedemicEducationInstance}" field="college_school"/></dd>
						
					</g:if>
				
					<g:if test="${acedemicEducationInstance?.board}">
						<dt><g:message code="acedemicEducation.board.label" default="Board" /></dt>
						
							<dd><g:fieldValue bean="${acedemicEducationInstance}" field="board"/></dd>
						
					</g:if>
				
					<g:if test="${acedemicEducationInstance?.dateCreated}">
						<dt><g:message code="acedemicEducation.dateCreated.label" default="Date Created" /></dt>
						
							<dd><g:formatDate date="${acedemicEducationInstance?.dateCreated}" /></dd>
						
					</g:if>
				
					<g:if test="${acedemicEducationInstance?.graduationYear}">
						<dt><g:message code="acedemicEducation.graduationYear.label" default="Graduation Year" /></dt>
						
							<dd><g:fieldValue bean="${acedemicEducationInstance}" field="graduationYear"/></dd>
						
					</g:if>
				
					<g:if test="${acedemicEducationInstance?.isDeleted}">
						<dt><g:message code="acedemicEducation.isDeleted.label" default="Is Deleted" /></dt>
						
							<dd><g:fieldValue bean="${acedemicEducationInstance}" field="isDeleted"/></dd>
						
					</g:if>
				
					<g:if test="${acedemicEducationInstance?.jobseeker}">
						<dt><g:message code="acedemicEducation.jobseeker.label" default="Jobseeker" /></dt>
						
							<dd><g:link controller="jobseeker" action="show" id="${acedemicEducationInstance?.jobseeker?.id}">${acedemicEducationInstance?.jobseeker?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${acedemicEducationInstance?.lastUpdated}">
						<dt><g:message code="acedemicEducation.lastUpdated.label" default="Last Updated" /></dt>
						
							<dd><g:formatDate date="${acedemicEducationInstance?.lastUpdated}" /></dd>
						
					</g:if>
				
					<g:if test="${acedemicEducationInstance?.percent}">
						<dt><g:message code="acedemicEducation.percent.label" default="Percent" /></dt>
						
							<dd><g:fieldValue bean="${acedemicEducationInstance}" field="percent"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${acedemicEducationInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${acedemicEducationInstance?.id}">
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
