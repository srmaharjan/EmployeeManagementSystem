
<%@ page import="com.ligontech.Demand" %>
<!doctype html>
<html>
<head>
      <meta name="layout" content="main">
      <g:set var="entityName" value="${message(code: 'demand.label', default: 'Demand')}" />
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

                  <g:if test="${demandInstance?.demandNumber}">
                        <dt><g:message code="demand.demandNumber.label" default="Demand Number" /></dt>

                        <dd><g:fieldValue bean="${demandInstance}" field="demandNumber"/></dd>

                  </g:if>

                  <g:if test="${demandInstance?.deadline}">
                        <dt><g:message code="demand.deadline.label" default="Deadline" /></dt>

                        <dd><g:formatDate date="${demandInstance?.deadline}" /></dd>

                  </g:if>

                  <g:if test="${demandInstance?.demandType}">
                        <dt><g:message code="demand.demandType.label" default="Demand Type" /></dt>

                        <dd><g:link controller="fixedValue" action="show" id="${demandInstance?.demandType?.id}">${demandInstance?.demandType?.encodeAsHTML()}</g:link></dd>

                  </g:if>

                  <g:if test="${demandInstance?.company}">
                        <dt><g:message code="demand.company.label" default="Company" /></dt>

                        <dd><g:link controller="company" action="show" id="${demandInstance?.company?.id}">${demandInstance?.company?.encodeAsHTML()}</g:link></dd>

                  </g:if>

                  <g:if test="${demandInstance?.agent}">
                        <dt><g:message code="demand.agent.label" default="Agent" /></dt>

                        <dd><g:link controller="agent" action="show" id="${demandInstance?.agent?.id}">${demandInstance?.agent?.encodeAsHTML()}</g:link></dd>

                  </g:if>

                  <g:if test="${demandInstance?.batchNo}">
                        <dt><g:message code="demand.batchNo.label" default="Batch No" /></dt>

                        <dd><g:fieldValue bean="${demandInstance}" field="batchNo"/></dd>

                  </g:if>

                  <g:if test="${demandInstance?.jobs}">
                        <dt><g:message code="demand.jobList.label" default="Jobs" /></dt>

                        <g:each in="${demandInstance.jobs}" var="j">
                              <dd><g:link controller="jobs" action="show" id="${j.id}">${j?.encodeAsHTML()}</g:link></dd>
                        </g:each>

                  </g:if>

                  <g:if test="${demandInstance?.otherDescription}">
                        <dt><g:message code="demand.otherDescription.label" default="Other Description" /></dt>

                        <dd><g:fieldValue bean="${demandInstance}" field="otherDescription"/></dd>

                  </g:if>

            </dl>

            <g:form>
                  <g:hiddenField name="id" value="${demandInstance?.id}" />
                  <div class="form-actions">
                        <g:link class="btn" action="edit" id="${demandInstance?.id}">
                              <i class="icon-pencil"></i>
                              <g:message code="default.button.edit.label" default="Edit" />
                        </g:link>
                        <button class="button" type="submit" name="_action_delete">
                              <i class="icon-trash icon-white"></i>
                              <g:message code="default.button.delete.label" default="Delete" />
                        </button>
                  </div>
            </g:form>
            <g:link class="btn" action="create" controller="jobs" params="[demand:demandInstance?.id]">
                  Add new Job
            </g:link>


      </div>

</div>
</body>
</html>
