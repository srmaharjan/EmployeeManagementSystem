
<%@ page import="com.ligontech.Jobs" %>
<!doctype html>
<html>
<head>
      <meta name="layout" content="main">
      <g:set var="entityName" value="${message(code: 'jobs.label', default: 'Jobs')}" />
      <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div class="row-fluid">
      <g:set var="queryParams" value="${params.findAll{ k,v -> k.matches(~/^query.*/) && v }?:[:]}"/>
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
            <g:render template="jobsSearch"/>
            <div class="style1">
                  <table class="table table-striped">
                        <thead>
                        <tr>

                              <lt:sortColumn property="designation" title="${message(code: 'jobs.designation.label', default: 'Designation')}" params="${queryParams}"/>

                              <th class="header"><g:message code="jobs.jobCategory.label" default="Job Category" /></th>

                              <lt:sortColumn property="numberOfPosition" title="${message(code: 'jobs.numberOfPosition.label', default: 'Number Of Position')}" params="${queryParams}"/>

                              <lt:sortColumn property="basicSalary" title="${message(code: 'jobs.basicSalary.label', default: 'Basic Salary')}" params="${queryParams}"/>

                              <lt:sortColumn property="salaryInNepali" title="${message(code: 'jobs.salaryInNepali.label', default: 'Salary In Nepali')}" params="${queryParams}"/>

                              <lt:sortColumn property="qualification" title="${message(code: 'jobs.qualification.label', default: 'Qualification')}" params="${queryParams}"/>

                              <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${jobsInstanceList}" var="jobsInstance">
                              <tr>

                                    <td>${fieldValue(bean: jobsInstance, field: "designation")}</td>

                                    <td>${fieldValue(bean: jobsInstance, field: "jobCategory")}</td>

                                    <td>${fieldValue(bean: jobsInstance, field: "numberOfPosition")}</td>

                                    <td>${fieldValue(bean: jobsInstance, field: "basicSalary")}</td>

                                    <td>${fieldValue(bean: jobsInstance, field: "salaryInNepali")}</td>

                                    <td>${fieldValue(bean: jobsInstance, field: "qualification")}</td>

                                    <td class="link">
                                          <g:link action="show" id="${jobsInstance.id}" class="btn btn-small">Show &raquo;</g:link>
                                    </td>
                              </tr>
                        </g:each>
                        </tbody>
                  </table>
            </div>
            <div class="pagination">
                  <g:if test="${queryParams}">
                        <g:paginate total="${jobsInstanceTotal}" params="${queryParams}"/>
                  </g:if>
                  <g:else>
                        <g:paginate total="${jobsInstanceTotal}"/>
                  </g:else>
            </div>
      </div>

</div>
</body>
</html>
