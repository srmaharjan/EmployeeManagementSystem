<%@ page import="com.ligontech.KnownLanguage" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'knownLanguage.label', default: 'KnownLanguage')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
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
                        <g:message code="default.list.label" args="[entityName]"/>
                    </g:link>
                </li>
                <li>
                    <g:link class="create" action="create">
                        <i class="icon-plus"></i>
                        <g:message code="default.create.label" args="[entityName]"/>
                    </g:link>
                </li>
            </ul>
        </div>
    </div>

    <div class="span9">

        <div class="page-header">
            <h1><g:message code="default.show.label" args="[entityName]"/></h1>
        </div>

        <g:if test="${flash.message}">
            <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
        </g:if>

        <dl>

            <g:if test="${knownLanguageInstance?.language}">
                <dt><g:message code="knownLanguage.language.label" default="Language"/></dt>

                <dd><g:link controller="fixedValue" action="show"
                            id="${knownLanguageInstance?.language?.id}">${knownLanguageInstance?.language?.encodeAsHTML()}</g:link></dd>

            </g:if>

            <g:if test="${knownLanguageInstance?.dateCreated}">
                <dt><g:message code="knownLanguage.dateCreated.label" default="Date Created"/></dt>

                <dd><g:formatDate date="${knownLanguageInstance?.dateCreated}"/></dd>

            </g:if>

            <g:if test="${knownLanguageInstance?.isDeleted}">
                <dt><g:message code="knownLanguage.isDeleted.label" default="Is Deleted"/></dt>

                <dd><g:fieldValue bean="${knownLanguageInstance}" field="isDeleted"/></dd>

            </g:if>

            <g:if test="${knownLanguageInstance?.jobseeker}">
                <dt><g:message code="knownLanguage.jobseeker.label" default="Jobseeker"/></dt>

                <dd><g:link controller="jobseeker" action="show"
                            id="${knownLanguageInstance?.jobseeker?.id}">${knownLanguageInstance?.jobseeker?.encodeAsHTML()}</g:link></dd>

            </g:if>

            <g:if test="${knownLanguageInstance?.lastUpdated}">
                <dt><g:message code="knownLanguage.lastUpdated.label" default="Last Updated"/></dt>

                <dd><g:formatDate date="${knownLanguageInstance?.lastUpdated}"/></dd>

            </g:if>

            <g:if test="${knownLanguageInstance?.reading}">
                <dt><g:message code="knownLanguage.reading.label" default="Reading"/></dt>

                <dd><g:link controller="fixedValue" action="show"
                            id="${knownLanguageInstance?.reading?.id}">${knownLanguageInstance?.reading?.encodeAsHTML()}</g:link></dd>

            </g:if>

            <g:if test="${knownLanguageInstance?.speaking}">
                <dt><g:message code="knownLanguage.speaking.label" default="Speaking"/></dt>

                <dd><g:link controller="fixedValue" action="show"
                            id="${knownLanguageInstance?.speaking?.id}">${knownLanguageInstance?.speaking?.encodeAsHTML()}</g:link></dd>

            </g:if>

            <g:if test="${knownLanguageInstance?.writing}">
                <dt><g:message code="knownLanguage.writing.label" default="Writing"/></dt>

                <dd><g:link controller="fixedValue" action="show"
                            id="${knownLanguageInstance?.writing?.id}">${knownLanguageInstance?.writing?.encodeAsHTML()}</g:link></dd>

            </g:if>

        </dl>

        <g:form>
            <g:hiddenField name="id" value="${knownLanguageInstance?.id}"/>
            <div class="form-actions">
                <g:link class="btn" action="edit" id="${knownLanguageInstance?.id}">
                    <i class="icon-pencil"></i>
                    <g:message code="default.button.edit.label" default="Edit"/>
                </g:link>
                <button class="btn btn-danger" type="submit" name="_action_delete">
                    <i class="icon-trash icon-white"></i>
                    <g:message code="default.button.delete.label" default="Delete"/>
                </button>
            </div>
        </g:form>

    </div>

</div>
</body>
</html>
