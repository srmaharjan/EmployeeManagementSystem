
<%@ page import="com.ligontech.admin.ModuleDashBoard" %>
<!doctype html>
<html>
<head>
      <meta name="layout" content="main">
      <g:set var="entityName" value="${message(code: 'moduleDashBoard.label', default: 'ModuleDashBoard')}" />
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
            <div class="style1">
                  <table class="table table-striped">
                        <thead>
                        <tr>

                              <g:sortableColumn property="moduleAction" title="${message(code: 'moduleDashBoard.moduleAction.label', default: 'Module Action')}" />

                              <g:sortableColumn property="moduleController" title="${message(code: 'moduleDashBoard.moduleController.label', default: 'Module Controller')}" />

                              <g:sortableColumn property="displayName" title="${message(code: 'moduleDashBoard.displayName.label', default: 'Display Name')}" />

                              <g:sortableColumn property="imagePath" title="${message(code: 'moduleDashBoard.imagePath.label', default: 'Image Path')}" />

                              <th class="header"><g:message code="moduleDashBoard.parent.label" default="Parent" /></th>

                              <th class="header"><g:message code="moduleDashBoard.subParent.label" default="Sub Parent" /></th>

                              <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${moduleDashBoardInstanceList}" var="moduleDashBoardInstance">
                              <tr>

                                    <td>${fieldValue(bean: moduleDashBoardInstance, field: "moduleAction")}</td>

                                    <td>${fieldValue(bean: moduleDashBoardInstance, field: "moduleController")}</td>

                                    <td>${fieldValue(bean: moduleDashBoardInstance, field: "displayName")}</td>

                                    <td>${fieldValue(bean: moduleDashBoardInstance, field: "image")}</td>

                                    <td>${fieldValue(bean: moduleDashBoardInstance, field: "parent")}</td>

                                    <td>${fieldValue(bean: moduleDashBoardInstance, field: "subParent")}</td>

                                    <td class="link">
                                          <g:link action="show" id="${moduleDashBoardInstance.id}" class="btn btn-small">Show &raquo;</g:link>
                                    </td>
                              </tr>
                        </g:each>
                        </tbody>
                  </table>
            </div>
            <div class="pagination">
                  <g:paginate total="${moduleDashBoardInstanceTotal}" />
            </div>
      </div>

</div>
</body>
</html>
