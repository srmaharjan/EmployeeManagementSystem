<%--
  Created by IntelliJ IDEA.
  User: srmaharjan
  Date: 3/9/14
  Time: 2:16 PM
--%>

<%@ page import="com.ligontech.Process" %>
<!doctype html>
<html>
<head>
      <meta name="layout" content="main">
      <g:set var="entityName" value="${message(code: 'process.label', default: 'Process')}" />
      <title><g:message code="default.create.label" args="[entityName]" /></title>
      <r:require module="comboBox"/>
</head>
<body>
<div class="row-fluid">
      <div class="span3">
            <div class="well">
                  <ul class="nav nav-list">
                        <li class="nav-header">${entityName}</li>
                        <li>
                              <g:link class="list" action="list">
                                    <i class="icon-list"></i>
                                    <g:message code="default.list.label" args="[entityName]" />
                              </g:link>
                        </li>
                        <li class="active">
                              <g:link class="create" action="create">
                                    <i class="icon-plus icon-white"></i>
                                    <g:message code="default.create.label" args="[entityName]" />
                              </g:link>
                        </li>
                  </ul>
            </div>
      </div>

      <div class="span9">

            <div class="page-header">
                  <h1>Search Application Process</h1>
            </div>

            <g:if test="${flash.message}">
                  <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
            </g:if>
            <g:form class="form-horizontal style1" id="formJobProcessCreate" action="search">
                  <fieldset class="form">
                        <g:render template="searchForm"/>
                  </fieldset>
                  <fieldset class="buttons">
                        <div class="form-actions">
                              <button type="button" class="btn btn-primary button">
                                    <i class="icon-ok icon-white"></i>
                                    <g:message code="default.button.search.label" default="Search" />
                              </button>
                        </div>
                  </fieldset>
            </g:form>
      </div>


</div>
</body>
</html>
