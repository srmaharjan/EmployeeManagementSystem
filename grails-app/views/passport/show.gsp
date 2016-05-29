
<%@ page import="com.ligontech.Passport" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'passport.label', default: 'Passport')}" />
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
				
					<g:if test="${passportInstance?.dateCreated}">
						<dt><g:message code="passport.dateCreated.label" default="Date Created" /></dt>
						
							<dd><g:formatDate date="${passportInstance?.dateCreated}" /></dd>
						
					</g:if>
				
					<g:if test="${passportInstance?.expiryDate}">
						<dt><g:message code="passport.expiryDate.label" default="Expiry Date" /></dt>
						
							<dd><g:formatDate date="${passportInstance?.expiryDate}" /></dd>
						
					</g:if>
				
					<g:if test="${passportInstance?.isDeleted}">
						<dt><g:message code="passport.isDeleted.label" default="Is Deleted" /></dt>
						
							<dd><g:fieldValue bean="${passportInstance}" field="isDeleted"/></dd>
						
					</g:if>
				
					<g:if test="${passportInstance?.issuedAddress}">
						<dt><g:message code="passport.issuedAddress.label" default="Issued Address" /></dt>
						
							<dd><g:fieldValue bean="${passportInstance}" field="issuedAddress"/></dd>
						
					</g:if>
				
					<g:if test="${passportInstance?.issuedBy}">
						<dt><g:message code="passport.issuedBy.label" default="Issued By" /></dt>
						
							<dd><g:fieldValue bean="${passportInstance}" field="issuedBy"/></dd>
						
					</g:if>
				
					<g:if test="${passportInstance?.issuedDate}">
						<dt><g:message code="passport.issuedDate.label" default="Issued Date" /></dt>
						
							<dd><g:formatDate date="${passportInstance?.issuedDate}" /></dd>
						
					</g:if>
				
					<g:if test="${passportInstance?.jobseeker}">
						<dt><g:message code="passport.jobseeker.label" default="Jobseeker" /></dt>
						
							<dd><g:link controller="jobseeker" action="show" id="${passportInstance?.jobseeker?.id}">${passportInstance?.jobseeker?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${passportInstance?.lastUpdated}">
						<dt><g:message code="passport.lastUpdated.label" default="Last Updated" /></dt>
						
							<dd><g:formatDate date="${passportInstance?.lastUpdated}" /></dd>
						
					</g:if>
				
					<g:if test="${passportInstance?.number}">
						<dt><g:message code="passport.number.label" default="Number" /></dt>
						
							<dd><g:fieldValue bean="${passportInstance}" field="number"/></dd>
						
					</g:if>
				
					<g:if test="${passportInstance?.remarks}">
						<dt><g:message code="passport.remarks.label" default="Remarks" /></dt>
						
							<dd><g:fieldValue bean="${passportInstance}" field="remarks"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${passportInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${passportInstance?.id}">
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
