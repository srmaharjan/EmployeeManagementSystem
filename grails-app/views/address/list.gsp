
<%@ page import="com.ligontech.NepAddress" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
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
						
							<g:sortableColumn property="district" title="${message(code: 'address.district.label', default: 'District')}" />
						
							<g:sortableColumn property="zone" title="${message(code: 'address.zone.label', default: 'Zone')}" />
						
							<th class="header"><g:message code="address.country.label" default="Country" /></th>
						
							<g:sortableColumn property="blockNumber" title="${message(code: 'address.blockNumber.label', default: 'Block Number')}" />
						
							<g:sortableColumn property="dateCreated" title="${message(code: 'address.dateCreated.label', default: 'Date Created')}" />
						
							<g:sortableColumn property="isDeleted" title="${message(code: 'address.isDeleted.label', default: 'Is Deleted')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${addressInstanceList}" var="addressInstance">
						<tr>
						
							<td>${fieldValue(bean: addressInstance, field: "district")}</td>
						
							<td>${fieldValue(bean: addressInstance, field: "zone")}</td>
						
							<td>${fieldValue(bean: addressInstance, field: "country")}</td>
						
							<td>${fieldValue(bean: addressInstance, field: "blockNumber")}</td>
						
							<td><g:formatDate date="${addressInstance.dateCreated}" /></td>
						
							<td>${fieldValue(bean: addressInstance, field: "isDeleted")}</td>
						
							<td class="link">
								<g:link action="show" id="${addressInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${addressInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
