
<%@ page import="com.ligontech.Agent" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'agent.label', default: 'Agent')}" />
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
				
					<g:if test="${agentInstance?.name}">
						<dt><g:message code="agent.name.label" default="Name" /></dt>
						
							<dd><g:fieldValue bean="${agentInstance}" field="name"/></dd>
						
					</g:if>
				
					<g:if test="${agentInstance?.phoneNo}">
						<dt><g:message code="agent.phoneNo.label" default="Phone No" /></dt>
						
							<dd><g:fieldValue bean="${agentInstance}" field="phoneNo"/></dd>
						
					</g:if>
				
					<g:if test="${agentInstance?.photo}">
						<dt><g:message code="agent.photo.label" default="Photo" /></dt>
						
							<dd><g:fieldValue bean="${agentInstance}" field="photo"/></dd>
						
					</g:if>
				
					<g:if test="${agentInstance?.currentAddress}">
						<dt><g:message code="agent.currentAddress.label" default="Current Address" /></dt>
						
							<dd>${agentInstance?.currentAddress?.encodeAsHTML()}</dd>
						
					</g:if>
                        <g:if test="${agentInstance?.permanentAddress}">
                              <dt><g:message code="agent.permanentAddress.label" default="Permanent Address" /></dt>

                              <dd>${agentInstance?.permanentAddress?.encodeAsHTML()}</dd>

                        </g:if>

				
					<g:if test="${agentInstance?.email}">
						<dt><g:message code="agent.email.label" default="Email" /></dt>
						
							<dd><g:fieldValue bean="${agentInstance}" field="email"/></dd>
						
					</g:if>
				
					<g:if test="${agentInstance?.website}">
						<dt><g:message code="agent.website.label" default="Website" /></dt>
						
							<dd><g:fieldValue bean="${agentInstance}" field="website"/></dd>
						
					</g:if>
				
					<g:if test="${agentInstance?.dateCreated}">
						<dt><g:message code="agent.dateCreated.label" default="Date Created" /></dt>
						
							<dd><g:formatDate date="${agentInstance?.dateCreated}" /></dd>
						
					</g:if>
				
					<g:if test="${agentInstance?.isDeleted}">
						<dt><g:message code="agent.isDeleted.label" default="Is Deleted" /></dt>
						
							<dd><g:fieldValue bean="${agentInstance}" field="isDeleted"/></dd>
						
					</g:if>
				
					<g:if test="${agentInstance?.lastUpdated}">
						<dt><g:message code="agent.lastUpdated.label" default="Last Updated" /></dt>
						
							<dd><g:formatDate date="${agentInstance?.lastUpdated}" /></dd>
						
					</g:if>
				
					<g:if test="${agentInstance?.otherDescription}">
						<dt><g:message code="agent.otherDescription.label" default="Other Description" /></dt>
						
							<dd><g:fieldValue bean="${agentInstance}" field="otherDescription"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${agentInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${agentInstance?.id}">
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
