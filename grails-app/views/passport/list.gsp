
<%@ page import="com.ligontech.Passport" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'passport.label', default: 'Passport')}" />
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
						
							<g:sortableColumn property="dateCreated" title="${message(code: 'passport.dateCreated.label', default: 'Date Created')}" />
						
							<g:sortableColumn property="expiryDate" title="${message(code: 'passport.expiryDate.label', default: 'Expiry Date')}" />
						
							<g:sortableColumn property="isDeleted" title="${message(code: 'passport.isDeleted.label', default: 'Is Deleted')}" />
						
							<g:sortableColumn property="issuedAddress" title="${message(code: 'passport.issuedAddress.label', default: 'Issued Address')}" />
						
							<g:sortableColumn property="issuedBy" title="${message(code: 'passport.issuedBy.label', default: 'Issued By')}" />
						
							<g:sortableColumn property="issuedDate" title="${message(code: 'passport.issuedDate.label', default: 'Issued Date')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${passportInstanceList}" var="passportInstance">
						<tr>
						
							<td><g:formatDate date="${passportInstance.dateCreated}" /></td>
						
							<td><g:formatDate date="${passportInstance.expiryDate}" /></td>
						
							<td>${fieldValue(bean: passportInstance, field: "isDeleted")}</td>
						
							<td>${fieldValue(bean: passportInstance, field: "issuedAddress")}</td>
						
							<td>${fieldValue(bean: passportInstance, field: "issuedBy")}</td>
						
							<td><g:formatDate date="${passportInstance.issuedDate}" /></td>
						
							<td class="link">
								<g:link action="show" id="${passportInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${passportInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
