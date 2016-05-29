
<%@ page import="com.ligontech.Demand" %>
<!doctype html>
<html>
<head>
      <meta name="layout" content="main">
      <g:set var="entityName" value="${message(code: 'demand.label', default: 'Demand')}" />
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
            <g:render template="/shared/demandSearch"/>
            <div class="style1">

                  <table class="table table-striped">
                        <thead>
                        <tr>
                              <lt:sortColumn property="demandNumber" title="${message(code: 'demand.demandNumber.label', default: 'Demand Number')}" params="${queryParams}" />

                              <lt:sortColumn property="deadline" title="${message(code: 'demand.deadline.label', default: 'Deadline')}" params="${queryParams}"/>

                              <th class="header"><g:message code="demand.demandType.label" default="Demand Type" /></th>

                              <th class="header"><g:message code="demand.company.label" default="Company" /></th>

                              <th class="header"><g:message code="demand.agent.label" default="Agent" /></th>

                              <lt:sortColumn property="batchNo" title="${message(code: 'demand.batchNo.label', default: 'Batch No')}" params="${queryParams}"/>

                              <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${demandInstanceList}" var="demandInstance">
                              <tr>

                                    <td>${fieldValue(bean: demandInstance, field: "demandNumber")}</td>

                                    <td><g:formatDate date="${demandInstance.deadline}" /></td>

                                    <td>${fieldValue(bean: demandInstance, field: "demandType")}</td>

                                    <td>${fieldValue(bean: demandInstance, field: "company")}</td>

                                    <td>${fieldValue(bean: demandInstance, field: "agent")}</td>

                                    <td>${fieldValue(bean: demandInstance, field: "batchNo")}</td>

                                    <td class="link">
                                          <g:link action="show" id="${demandInstance.id}" class="btn btn-small">Show &raquo;</g:link>
                                    </td>
                              </tr>
                        </g:each>
                        </tbody>
                  </table>
            </div>
            <div class="pagination">
                  <g:if test="${queryParams}">
                        <g:paginate total="${demandInstanceTotal}" params="${queryParams}"/>
                  </g:if>
                  <g:else>
                        <g:paginate total="${demandInstanceTotal}"/>
                  </g:else>
            </div>
      </div>

</div>
</body>
</html>
