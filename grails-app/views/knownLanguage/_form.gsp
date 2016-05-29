<%@ page import="com.ligontech.KnownLanguage" %>



<div class="control-group fieldcontain ${hasErrors(bean: knownLanguageInstance, field: 'language', 'error')} ">
    <label for="language" class="control-label"><g:message code="knownLanguage.language.label"
                                                           default="Language"/></label>

    <div class="controls">
        <g:select id="language" name="language.id" from="${com.ligontech.FixedValue.list()}" optionKey="id"
                  value="${knownLanguageInstance?.language?.id}" class="many-to-one" noSelection="['null': '']"/>
        <span class="help-inline">${hasErrors(bean: knownLanguageInstance, field: 'language', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: knownLanguageInstance, field: 'isDeleted', 'error')} ">
    <label for="isDeleted" class="control-label"><g:message code="knownLanguage.isDeleted.label"
                                                            default="Is Deleted"/></label>

    <div class="controls">
        <g:textField name="isDeleted" value="${knownLanguageInstance?.isDeleted}"/>
        <span class="help-inline">${hasErrors(bean: knownLanguageInstance, field: 'isDeleted', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: knownLanguageInstance, field: 'jobseeker', 'error')} ">
    <label for="jobseeker" class="control-label"><g:message code="knownLanguage.jobseeker.label"
                                                            default="Jobseeker"/></label>

    <div class="controls">
        <g:select id="jobseeker" name="jobseeker.id" from="${com.ligontech.Jobseeker.list()}" optionKey="id"
                  value="${knownLanguageInstance?.jobseeker?.id}" class="many-to-one" noSelection="['null': '']"/>
        <span class="help-inline">${hasErrors(bean: knownLanguageInstance, field: 'jobseeker', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: knownLanguageInstance, field: 'reading', 'error')} ">
    <label for="reading" class="control-label"><g:message code="knownLanguage.reading.label" default="Reading"/></label>

    <div class="controls">
        <g:select id="reading" name="reading.id" from="${com.ligontech.FixedValue.list()}" optionKey="id"
                  value="${knownLanguageInstance?.reading?.id}" class="many-to-one" noSelection="['null': '']"/>
        <span class="help-inline">${hasErrors(bean: knownLanguageInstance, field: 'reading', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: knownLanguageInstance, field: 'speaking', 'error')} ">
    <label for="speaking" class="control-label"><g:message code="knownLanguage.speaking.label"
                                                           default="Speaking"/></label>

    <div class="controls">
        <g:select id="speaking" name="speaking.id" from="${com.ligontech.FixedValue.list()}" optionKey="id"
                  value="${knownLanguageInstance?.speaking?.id}" class="many-to-one" noSelection="['null': '']"/>
        <span class="help-inline">${hasErrors(bean: knownLanguageInstance, field: 'speaking', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: knownLanguageInstance, field: 'writing', 'error')} ">
    <label for="writing" class="control-label"><g:message code="knownLanguage.writing.label" default="Writing"/></label>

    <div class="controls">
        <g:select id="writing" name="writing.id" from="${com.ligontech.FixedValue.list()}" optionKey="id"
                  value="${knownLanguageInstance?.writing?.id}" class="many-to-one" noSelection="['null': '']"/>
        <span class="help-inline">${hasErrors(bean: knownLanguageInstance, field: 'writing', 'error')}</span>
    </div>
</div>

