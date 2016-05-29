
<%@ page import="com.ligontech.Agent" %>
<!doctype html>
<html>
<head>
      <meta name="layout" content="main">
      <g:set var="entityName" value="${message(code: 'agent.label', default: 'Agent')}" />
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

                              <g:sortableColumn property="name" title="${message(code: 'agent.name.label', default: 'Name')}" params="${params.query?['query':params.query]:[:]}" />

                              <g:sortableColumn property="phoneNo" title="${message(code: 'agent.phoneNo.label', default: 'Phone No')}" params="${params.query?['query':params.query]:[:]}" />



                              <th class="header"><g:message code="agent.currentAddress.label" default="Current Address" params="${params.query?['query':params.query]:[:]}"/></th>


                              <g:sortableColumn property="email" title="${message(code: 'agent.email.label', default: 'Email')}" params="${params.query?['query':params.query]:[:]}" />

                              <g:sortableColumn property="website" title="${message(code: 'agent.website.label', default: 'Website')}"  params="${params.query?['query':params.query]:[:]}"/>

                              <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${agentInstanceList}" var="agentInstance">
                              <tr>

                                    <td>${fieldValue(bean: agentInstance, field: "name")}</td>

                                    <td>${fieldValue(bean: agentInstance, field: "phoneNo")}</td>


                                    <td>${fieldValue(bean: agentInstance, field: "currentAddress")}</td>

                                    <td>${fieldValue(bean: agentInstance, field: "email")}</td>

                                    <td>${fieldValue(bean: agentInstance, field: "website")}</td>

                                    <td class="link">
                                          <g:link action="show" id="${agentInstance.id}" class="btn btn-small">Show &raquo;</g:link>
                                    </td>
                              </tr>
                        </g:each>
                        </tbody>
                  </table>
            </div>
            <div class="pagination">
                  <g:if test="${params.query}">
                        <g:paginate total="${agentInstanceTotal}" params="[query:params.query]"/>
                  </g:if>
                  <g:else>
                        <g:paginate total="${agentInstanceTotal}"/>
                  </g:else>
            </div>
      </div>

</div>
</body>
</html>
