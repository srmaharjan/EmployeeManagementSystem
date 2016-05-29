
<%@ page import="com.ligontech.admin.ModuleDashBoard" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'moduleDashBoard.label', default: 'ModuleDashBoard')}" />
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
				
					<g:if test="${moduleDashBoardInstance?.moduleAction}">
						<dt><g:message code="moduleDashBoard.moduleAction.label" default="Module Action" /></dt>
						
							<dd><g:fieldValue bean="${moduleDashBoardInstance}" field="moduleAction"/></dd>
						
					</g:if>
				
					<g:if test="${moduleDashBoardInstance?.moduleController}">
						<dt><g:message code="moduleDashBoard.moduleController.label" default="Module Controller" /></dt>
						
							<dd><g:fieldValue bean="${moduleDashBoardInstance}" field="moduleController"/></dd>
						
					</g:if>
				
					<g:if test="${moduleDashBoardInstance?.displayName}">
						<dt><g:message code="moduleDashBoard.displayName.label" default="Display Name" /></dt>
						
							<dd><g:fieldValue bean="${moduleDashBoardInstance}" field="displayName"/></dd>
						
					</g:if>
				
					<g:if test="${moduleDashBoardInstance?.image}">
						<dt><g:message code="moduleDashBoard.imagePath.label" default="Image Path" /></dt>
						
							<dd><g:fieldValue bean="${moduleDashBoardInstance}" field="image"/></dd>
						
					</g:if>
				
					<g:if test="${moduleDashBoardInstance?.parent}">
						<dt><g:message code="moduleDashBoard.parent.label" default="Parent" /></dt>
						
							<dd><g:link controller="moduleDashBoard" action="show" id="${moduleDashBoardInstance?.parent?.id}">${moduleDashBoardInstance?.parent?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${moduleDashBoardInstance?.subParent}">
						<dt><g:message code="moduleDashBoard.subParent.label" default="Sub Parent" /></dt>
						
							<dd><g:link controller="moduleDashBoard" action="show" id="${moduleDashBoardInstance?.subParent?.id}">${moduleDashBoardInstance?.subParent?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${moduleDashBoardInstance?.displayOrder}">
						<dt><g:message code="moduleDashBoard.displayOrder.label" default="Display Order" /></dt>
						
							<dd><g:fieldValue bean="${moduleDashBoardInstance}" field="displayOrder"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${moduleDashBoardInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${moduleDashBoardInstance?.id}">
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
