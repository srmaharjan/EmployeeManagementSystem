<%@ page import="com.ligontech.Process" %>
<!doctype html>
<html>
<head>
      <meta name="layout" content="main">
      <g:set var="entityName" value="${message(code: 'process.label', default: 'Process')}" />
      <title><g:message code="default.create.label" args="[entityName]" /></title>
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
            <div class="form-horizontal style1" >
                  <fieldset class="form">
                        <ul id="sortable">
                              <g:each in="${process}" var="p">
                                    <li class="ui-state-highlight" id="${p.id}" style="background: ${p.colorCode};">
                                          <input type="hidden" value="${p.id}"/>
                                          ${p.description}
                                    </li>
                              </g:each>
                        </ul>
                  </fieldset>
                  <fieldset class="buttons">
                        <div class="form-actions">
                              <button type="button" class="btn btn-primary button" onclick="saveOrder();">
                                    <i class="icon-ok icon-white"></i>
                                    <g:message code="default.button.create.label" default="Update" />
                              </button>
                        </div>
                  </fieldset>
            </div>
      </div>
      <script type="text/javascript">
            $(function() {
                  $( "#sortable" ).sortable({
                        placeholder: "ui-state-highlight",
                        cursor: 'pointer'
                  });
                  $( "#sortable" ).disableSelection();
            });
            function saveOrder() {
                  var order = $("#sortable").sortable("toArray");
                  var action = "<g:createLink action="updateStepOrder"/>";
                  $.post(action,{order: order}, function(json, status) {
                        if(status == 'success' && json.status == 200) {
                              alert('Saved order process!');
                        } else {
                              alert('Unable to complete the request.');
                        }
                  }, "json");
            }
      </script>

</div>
</body>
</html>
