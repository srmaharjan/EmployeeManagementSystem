
<%@ page import="com.ligontech.JobCategory" %>
<!doctype html>
<html>
<head>
      <meta name="layout" content="main">
      <g:set var="entityName" value="${message(code: 'jobCategory.label', default: 'JobCategory')}" />
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

                              <g:sortableColumn property="value" title="${message(code: 'jobCategory.value.label', default: 'Value')}" params="${params.query?['query':params.query]:[:]}" />

                              <g:sortableColumn property="dateCreated" title="${message(code: 'jobCategory.dateCreated.label', default: 'Date Created')}" params="${params.query?['query':params.query]:[:]}" />

                              <g:sortableColumn property="description" title="${message(code: 'jobCategory.description.label', default: 'Description')}" params="${params.query?['query':params.query]:[:]}" />

                              <g:sortableColumn property="isDeleted" title="${message(code: 'jobCategory.isDeleted.label', default: 'Is Deleted')}" params="${params.query?['query':params.query]:[:]}"/>

                              <g:sortableColumn property="lastUpdated" title="${message(code: 'jobCategory.lastUpdated.label', default: 'Last Updated')}" params="${params.query?['query':params.query]:[:]}" />

                              <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${jobCategoryInstanceList}" var="jobCategoryInstance">
                              <tr>

                                    <td>${fieldValue(bean: jobCategoryInstance, field: "value")}</td>

                                    <td><g:formatDate date="${jobCategoryInstance.dateCreated}" /></td>

                                    <td>${fieldValue(bean: jobCategoryInstance, field: "description")}</td>

                                    <td>${fieldValue(bean: jobCategoryInstance, field: "isDeleted")}</td>

                                    <td><g:formatDate date="${jobCategoryInstance.lastUpdated}" /></td>

                                    <td class="link">
                                          <g:link action="show" id="${jobCategoryInstance.id}" class="btn btn-small">Show &raquo;</g:link>
                                    </td>
                              </tr>
                        </g:each>
                        </tbody>
                  </table>
            </div>
            <div class="pagination">
                  <g:if test="${params.query}">
                        <g:paginate total="${jobCategoryInstanceTotal}" params="[query:params.query]"/>
                  </g:if>
                  <g:else>
                        <g:paginate total="${jobCategoryInstanceTotal}"/>
                  </g:else>
            </div>
      </div>
</div>
</body>
</html>
