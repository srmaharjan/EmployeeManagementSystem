<%@ page import="com.ligontech.usermanagement.User" %>
<!doctype html>
<html>
<head>
      <meta name="layout" content="main">
      <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
      <title><g:message code="default.edit.label" args="[entityName]" /></title>
      <r:require module="jquery-validation-ui" />
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
                  <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            </div>

            <g:if test="${flash.message}">
                  <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
            </g:if>

            <g:hasErrors bean="${userInstance}">
                  <bootstrap:alert class="alert-error">
                        <ul>
                              <g:eachError bean="${userInstance}" var="error">
                                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                              </g:eachError>
                        </ul>
                  </bootstrap:alert>
            </g:hasErrors>
            <g:form method="post"  action="update" class="form-horizontal style1" name="${userInstance?.id}">
                  <g:hiddenField name="id" value="${userInstance?.id}" />
                  <g:hiddenField name="version" value="${userInstance?.version}" />
                  <fieldset class="form">
                        <g:render template="form"/>
                  </fieldset>
                  <fieldset class="buttons">
                        <button type="submit" class="btn btn-primary button">
                              <i class="icon-ok icon-white"></i>
                              <g:message code="default.button.update.label" default="Update" />
                        </button>
                  </fieldset>
            </g:form>
      </div>

</div>
<jqvalui:renderValidationScript for="com.ligontech.usermanagement.User" />
</body>
</html>
