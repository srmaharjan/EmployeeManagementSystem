
<%@ page import="com.ligontech.FixedValue" %>
<!doctype html>
<html>
<head>
      <meta name="layout" content="main">
      <g:set var="entityName" value="${message(code: 'fixedValue.label', default: 'FixedValue')}" />
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
            <div class="search">
                  <g:form name="search" action="search">
                        Search:
                        <input type="text" name="query" value="${params.query}"/>
                        <input type="submit" value="Search"/>
                  </g:form>
            </div>
            <div class="style1">
                  <table class="table table-striped">
                        <thead>
                        <tr>

                              <g:sortableColumn property="value" title="${message(code: 'fixedValue.value.label', default: 'Value')}" params="${params.query?['query':params.query]:[:]}" />

                              <g:sortableColumn property="fieldType" title="${message(code: 'fixedValue.fieldType.label', default: 'Field Type')}" params="${params.query?['query':params.query]:[:]}"/>

                              <g:sortableColumn property="description" title="${message(code: 'fixedValue.description.label', default: 'Description')}" params="${params.query?['query':params.query]:[:]}"/>

                              <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${fixedValueInstanceList}" var="fixedValueInstance">
                              <tr>

                                    <td>${fieldValue(bean: fixedValueInstance, field: "value")}</td>

                                    <td>${fieldValue(bean: fixedValueInstance, field: "fieldType")}</td>

                                    <td>${fieldValue(bean: fixedValueInstance, field: "description")}</td>

                                    <td class="link">
                                          <g:link action="show" id="${fixedValueInstance.id}" class="btn btn-small">Show &raquo;</g:link>
                                    </td>
                              </tr>
                        </g:each>
                        </tbody>
                  </table>
            </div>
            <div class="pagination">
                  <g:if test="${params.query}">
                        <g:paginate total="${fixedValueInstanceTotal}" params="[query:params.query]"/>
                  </g:if>
                  <g:else>
                        <g:paginate total="${fixedValueInstanceTotal}"/>
                  </g:else>
            </div>
      </div>

</div>
</body>
</html>
