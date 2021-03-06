<%@ page import="com.ligontech.Jobs" %>
<!doctype html>
<html>
<head>
      <meta name="layout" content="main">
      <g:set var="entityName" value="${message(code: 'jobs.label', default: 'Jobs')}" />
      <title><g:message code="default.create.label" args="[entityName]" /></title>
      <r:require module="jquery-validation-ui" />
      <r:require module="multiselect" />
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
                  <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            </div>

            <g:if test="${flash.message}">
                  <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
            </g:if>

            <g:hasErrors bean="${jobsInstance}">
                  <bootstrap:alert class="alert-error">
                        <ul>
                              <g:eachError bean="${jobsInstance}" var="error">
                                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                              </g:eachError>
                        </ul>
                  </bootstrap:alert>
            </g:hasErrors>

            <g:form action="save" class="form-horizontal style1" >
                  <fieldset class="form">
                        <g:render template="form"/>
                  </fieldset>
                  <fieldset class="buttons">
                        <div class="form-actions">
                              <button type="submit" class="btn btn-primary button">
                                    <i class="icon-ok icon-white"></i>
                                    <g:message code="default.button.create.label" default="Create" />
                              </button>
                        </div>
                  </fieldset>
            </g:form>
      </div>

</div>
<jqvalui:renderValidationScript for="com.ligontech.Jobs" />
</body>
</html>
