
<%@ page import="com.ligontech.Process" %>
<!doctype html>
<html>
<head>
      <meta name="layout" content="main">
      <g:set var="entityName" value="${message(code: 'process.label', default: 'Process')}" />
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
            <div>
                  <g:form action="setUpStep">
                        <g:select name="country" from="${country}" optionKey="id" optionValue="value" noSelection="['':'None']"/>
                        <button type="submit">Setup Steps</button>
                  </g:form>
            </div>
            <div class="style1">
                  <table class="table table-striped">
                        <thead>
                        <tr>



                              <th class="header"><g:message code="process.country.label" default="Country" /></th>

                              <g:sortableColumn property="dateCreated" title="${message(code: 'process.dateCreated.label', default: 'Date Created')}" />

                              <g:sortableColumn property="description" title="${message(code: 'process.description.label', default: 'Description')}" />

                              <g:sortableColumn property="includeInProcess" title="${message(code: 'process.includeInProcess.label', default: 'Include In Process')}" />

                              <g:sortableColumn property="colorCode" title="${message(code: 'process.colorCode.label', default: 'Color')}" />

                              <g:sortableColumn property="canApplyOtherJob" title="${message(code: 'process.canApplyOtherJob.label', default: 'CAO Job')}" />
                              <g:sortableColumn property="isFirstStep" title="${message(code: 'process.isFirstStep.label', default: 'Is First Step')}" />
                              <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${processInstanceList}" var="processInstance">
                              <tr>
                                    <td>${fieldValue(bean: processInstance, field: "country")}</td>

                                    <td><g:formatDate date="${processInstance.dateCreated}" /></td>

                                    <td>${fieldValue(bean: processInstance, field: "description")}</td>

                                    <td><g:formatBoolean boolean="${processInstance.includeInProcess}" /></td>

                                    <td><div style="width:20px;height:20px;background-color:${processInstance.colorCode?:''} "></div></td>

                                    <td>${fieldValue(bean: processInstance, field: "canApplyOtherJob")}</td>
                                    <td>${fieldValue(bean: processInstance, field: "isFirstStep")}</td>
                                    <td class="link">
                                          <g:link action="show" id="${processInstance.code}" class="btn btn-small">Show &raquo;</g:link>
                                    </td>
                              </tr>
                        </g:each>
                        </tbody>
                  </table>
            </div>
            <div class="pagination">
                  <bootstrap:paginate total="${processInstanceTotal}" />
            </div>
      </div>

</div>
</body>
</html>
