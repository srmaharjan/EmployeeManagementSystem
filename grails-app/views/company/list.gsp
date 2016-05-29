
<%@ page import="com.ligontech.Company" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}" />
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
                        <g:render template="/shared/search"/>
                        <div class="style1">
				<table class="table table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="name" title="${message(code: 'company.name.label', default: 'Name')}"  params="${params.query?['query':params.query]:[:]}" />
						
							<th class="header"><g:message code="company.address.label" default="Address" /></th>
						
							<g:sortableColumn property="dateCreated" title="${message(code: 'company.dateCreated.label', default: 'Date Created')}"  params="${params.query?['query':params.query]:[:]}" />
						
							<g:sortableColumn property="isDeleted" title="${message(code: 'company.isDeleted.label', default: 'Is Deleted')}"  params="${params.query?['query':params.query]:[:]}" />
						
							<g:sortableColumn property="lastUpdated" title="${message(code: 'company.lastUpdated.label', default: 'Last Updated')}"  params="${params.query?['query':params.query]:[:]}"/>
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${companyInstanceList}" var="companyInstance">
						<tr>
						
							<td>${fieldValue(bean: companyInstance, field: "name")}</td>
						
							<td>${fieldValue(bean: companyInstance, field: "address")}</td>
						
							<td><g:formatDate date="${companyInstance.dateCreated}" /></td>
						
							<td>${fieldValue(bean: companyInstance, field: "isDeleted")}</td>
						
							<td><g:formatDate date="${companyInstance.lastUpdated}" /></td>
						
							<td class="link">
								<g:link action="show" id="${companyInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
                  </div>
                        <div class="pagination">
                              <g:if test="${params.query}">
                                    <g:paginate total="${companyInstanceTotal}" params="[query:params.query]"/>
                              </g:if>
                              <g:else>
                                    <g:paginate total="${companyInstanceTotal}"/>
                              </g:else>
                        </div>
				<div class="pagination">
					<bootstrap:paginate total="${companyInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
