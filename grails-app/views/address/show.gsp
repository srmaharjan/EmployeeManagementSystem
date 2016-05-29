
<%@ page import="com.ligontech.NepAddress" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
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
				
					<g:if test="${addressInstance?.district}">
						<dt><g:message code="address.district.label" default="District" /></dt>
						
							<dd><g:fieldValue bean="${addressInstance}" field="district"/></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.zone}">
						<dt><g:message code="address.zone.label" default="Zone" /></dt>
						
							<dd><g:fieldValue bean="${addressInstance}" field="zone"/></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.country}">
						<dt><g:message code="address.country.label" default="Country" /></dt>
						
							<dd><g:link controller="country" action="show" id="${addressInstance?.country?.id}">${addressInstance?.country?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.blockNumber}">
						<dt><g:message code="address.blockNumber.label" default="Block Number" /></dt>
						
							<dd><g:fieldValue bean="${addressInstance}" field="blockNumber"/></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.dateCreated}">
						<dt><g:message code="address.dateCreated.label" default="Date Created" /></dt>
						
							<dd><g:formatDate date="${addressInstance?.dateCreated}" /></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.isDeleted}">
						<dt><g:message code="address.isDeleted.label" default="Is Deleted" /></dt>
						
							<dd><g:fieldValue bean="${addressInstance}" field="isDeleted"/></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.lastUpdated}">
						<dt><g:message code="address.lastUpdated.label" default="Last Updated" /></dt>
						
							<dd><g:formatDate date="${addressInstance?.lastUpdated}" /></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.muncipalityOrVdc}">
						<dt><g:message code="address.muncipalityOrVdc.label" default="Muncipality Or Vdc" /></dt>
						
							<dd><g:fieldValue bean="${addressInstance}" field="muncipalityOrVdc"/></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.street}">
						<dt><g:message code="address.street.label" default="Street" /></dt>
						
							<dd><g:fieldValue bean="${addressInstance}" field="street"/></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.wardNumber}">
						<dt><g:message code="address.wardNumber.label" default="Ward Number" /></dt>
						
							<dd><g:fieldValue bean="${addressInstance}" field="wardNumber"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${addressInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${addressInstance?.id}">
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
