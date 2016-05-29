
<%@ page import="com.ligontech.Country" %>
<!doctype html>
<html>
<head>
      <meta name="layout" content="main">
      <g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}" />
      <title><g:message code="default.show.label" args="[entityName]" /></title>
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
                  <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            </div>

            <g:if test="${flash.message}">
                  <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
            </g:if>

            <dl>
                  <g:if test="${countryInstance?.id}">
                        <dt><g:message code="country.id.label" default="Id" /></dt>

                        <dd><g:fieldValue bean="${countryInstance}" field="id"/></dd>

                  </g:if>
                  <g:if test="${countryInstance?.value}">
                        <dt><g:message code="country.value.label" default="Value" /></dt>

                        <dd><g:fieldValue bean="${countryInstance}" field="value"/></dd>

                  </g:if>

                  <g:if test="${countryInstance?.dateCreated}">
                        <dt><g:message code="country.dateCreated.label" default="Date Created" /></dt>

                        <dd><g:formatDate date="${countryInstance?.dateCreated}" /></dd>

                  </g:if>

                  <g:if test="${countryInstance?.description}">
                        <dt><g:message code="country.description.label" default="Description" /></dt>

                        <dd><g:fieldValue bean="${countryInstance}" field="description"/></dd>

                  </g:if>

                  <g:if test="${countryInstance?.isDeleted}">
                        <dt><g:message code="country.isDeleted.label" default="Is Deleted" /></dt>

                        <dd><g:fieldValue bean="${countryInstance}" field="isDeleted"/></dd>

                  </g:if>

                  <g:if test="${countryInstance?.lastUpdated}">
                        <dt><g:message code="country.lastUpdated.label" default="Last Updated" /></dt>

                        <dd><g:formatDate date="${countryInstance?.lastUpdated}" /></dd>

                  </g:if>

            </dl>

            <g:form>
                  <g:hiddenField name="id" value="${countryInstance?.id}" />
                  <div class="form-actions">
                  <ltSec:hasPermission permission="user:update" roles="SUPERMAN">
                        <g:link class="btn" action="edit" id="${countryInstance?.id}">
                              <i class="icon-pencil"></i>
                              <g:message code="default.button.edit.label" default="Edit" />
                        </g:link>
                        </ltSec:hasPermission>
                  <ltSec:hasPermission permission="user:delete" roles="SUPERMAN">
                        <button class="btn btn-danger" type="submit" name="_action_delete">
                              <i class="icon-trash icon-white"></i>
                              <g:message code="default.button.delete.label" default="Delete" />
                        </button>
                        </ltSec:hasPermission>
                  </div>
            </g:form>

      </div>

</div>
</body>
</html>
