<%@ page import="com.ligontech.ApplicationProcess" %>
<!doctype html>
<html>
<head>
      <meta name="layout" content="main">
      <g:set var="entityName" value="${message(code: 'applicationProcess.label', default: 'ApplicationProcess')}" />
      <title><g:message code="default.create.label" args="[entityName]" /></title>
      <r:require module="jquery-validation-ui" />
      <r:require module="comboBox"/>
      <r:require module="autocomplete" />
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

            <g:hasErrors bean="${applicationProcessInstance}">
                  <bootstrap:alert class="alert-error">
                        <ul>
                              <g:eachError bean="${applicationProcessInstance}" var="error">
                                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                              </g:eachError>
                        </ul>
                  </bootstrap:alert>
            </g:hasErrors>

            <form class="form-horizontal style1" id="formJobProcessCreate" >
                  <fieldset class="form">
                        <g:render template="form"/>
                  </fieldset>
                  <fieldset class="buttons">
                        <div class="form-actions">
                              <button type="button" class="btn btn-primary button" id="btnJobProcessCreate">
                                    <i class="icon-ok icon-white"></i>
                                    <g:message code="default.button.create.label" default="Create" />
                              </button>
                        </div>
                  </fieldset>
            </form>
            <script type="text/javascript">

                  $('.form-horizontal').on('click','#btnJobProcessCreate',function(){
                        alert('test');
                        $.blockUI();
                        $.ajax({
                              type:'POST',
                              url:'<g:createLink controller="applicationProcess" action="save"/>',
                              data:$('#formJobProcessCreate').serialize()
                        }).done(function(data){
                                    if(data=='${com.ligontech.ServerCode.SUCCESS}'){
                                          partialResetForm();
                                    }
                                    else{
                                          alert('Error occured!! Please try again.');
                                    }
                              }).fail(function(){
                                    alert('Error occured!! Please try again.');
                              }).always(function(){
                                    $.unblockUI();
                              });
                        return false;
                  });
                  function partialResetForm(){
                        $('.resetForm').find("input[type=text],input[type=hidden], textarea").val("");
                        $('.resetForm').find('input[type=radio],input[type=checkbox]').removeAttr('checked')
                              .removeAttr('selected');
                        $('#jobseeker_details').hide();
                        $('#jobseeker_details').html('');
                        updateJobseeker();
                  }
            </script>
      </div>
      <div id="jobseekerContainer">
      </div>
</div>
<jqvalui:renderValidationScript for="com.ligontech.ApplicationProcess" />
</body>
</html>
