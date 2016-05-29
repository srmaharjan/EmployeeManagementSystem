
<%@ page import="com.ligontech.AcedemicEducation" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'acedemicEducation.label', default: 'AcedemicEducation')}" />
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
						
							<g:sortableColumn property="degree" title="${message(code: 'acedemicEducation.degree.label', default: 'Degree')}" />
						
							<g:sortableColumn property="nameOfDegree" title="${message(code: 'acedemicEducation.nameOfDegree.label', default: 'Name Of Degree')}" />
						
							<g:sortableColumn property="college_school" title="${message(code: 'acedemicEducation.college_school.label', default: 'Collegeschool')}" />
						
							<g:sortableColumn property="board" title="${message(code: 'acedemicEducation.board.label', default: 'Board')}" />
						
							<g:sortableColumn property="dateCreated" title="${message(code: 'acedemicEducation.dateCreated.label', default: 'Date Created')}" />
						
							<g:sortableColumn property="graduationYear" title="${message(code: 'acedemicEducation.graduationYear.label', default: 'Graduation Year')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${acedemicEducationInstanceList}" var="acedemicEducationInstance">
						<tr>
						
							<td>${fieldValue(bean: acedemicEducationInstance, field: "degree")}</td>
						
							<td>${fieldValue(bean: acedemicEducationInstance, field: "nameOfDegree")}</td>
						
							<td>${fieldValue(bean: acedemicEducationInstance, field: "college_school")}</td>
						
							<td>${fieldValue(bean: acedemicEducationInstance, field: "board")}</td>
						
							<td><g:formatDate date="${acedemicEducationInstance.dateCreated}" /></td>
						
							<td>${fieldValue(bean: acedemicEducationInstance, field: "graduationYear")}</td>
						
							<td class="link">
								<g:link action="show" id="${acedemicEducationInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${acedemicEducationInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
