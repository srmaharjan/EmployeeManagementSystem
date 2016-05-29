
<%@ page import="com.ligontech.Jobseeker" %>
<!doctype html>
<html>
<head>
      <meta name="layout" content="main">
      <g:set var="entityName" value="${message(code: 'jobseeker.label', default: 'Jobseeker')}" />
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
            <g:render template="search"/>
            <div class="style1">
                  <table class="table table-striped">
                        <thead>
                        <tr>

                              <lt:sortColumn property="firstName" title="${message(code: 'jobseeker.firstName.label', default: 'First Name')}" params="${queryParams}" />

                              <lt:sortColumn property="lastName" title="${message(code: 'jobseeker.lastName.label', default: 'Last Name')}" params="${queryParams}"/>

                              <lt:sortColumn property="dateOfBirth" title="${message(code: 'jobseeker.dateOfBirth.label', default: 'Date Of Birth')}" params="${queryParams}"/>

                              <lt:sortColumn property="nationality" title="${message(code: 'jobseeker.nationality.label', default: 'Nationality')}" params="${queryParams}"/>

                              <lt:sortColumn property="contactNumber" title="${message(code: 'jobseeker.contactNumber.label', default: 'Contact Number')}" params="${queryParams}"/>

                              <th class="header"><g:message code="jobseeker.currentAddress.label" default="Current Address" /></th>

                              <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${jobseekerInstanceList}" var="jobseekerInstance">
                              <tr>

                                    <td>${fieldValue(bean: jobseekerInstance, field: "firstName")}</td>

                                    <td>${fieldValue(bean: jobseekerInstance, field: "lastName")}</td>

                                    <td><g:formatDate date="${jobseekerInstance.dateOfBirth}" /></td>

                                    <td>${fieldValue(bean: jobseekerInstance, field: "nationality")}</td>

                                    <td>${fieldValue(bean: jobseekerInstance, field: "contactNumber")}</td>

                                    <td>${fieldValue(bean: jobseekerInstance, field: "currentAddress")}</td>

                                    <td class="link">
                                          <g:link action="show" id="${jobseekerInstance.id}" class="btn btn-small">Show &raquo;</g:link>
                                    </td>
                              </tr>
                        </g:each>
                        </tbody>
                  </table>
            </div>
            <div class="pagination">
                  <g:if test="${queryParams}">
                        <g:paginate total="${jobseekerInstanceTotal}" params="${queryParams}"/>
                  </g:if>
                  <g:else>
                        <g:paginate total="${jobseekerInstanceTotal}"/>
                  </g:else>
            </div>
      </div>

</div>
</body>
</html>
