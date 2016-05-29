
<%@ page import="com.ligontech.Jobseeker" %>
<!doctype html>
<html>
<head>
      <meta name="layout" content="main">
      <g:set var="entityName" value="${message(code: 'jobseeker.label', default: 'Jobseeker')}" />
      <title><g:message code="default.show.label" args="[entityName]" /></title>
      <r:require module="fileupload"/>
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

<g:if test="${jobseekerInstance?.firstName}">
      <dt><g:message code="jobseeker.firstName.label" default="First Name" /></dt>

      <dd><g:fieldValue bean="${jobseekerInstance}" field="firstName"/></dd>

</g:if>

<g:if test="${jobseekerInstance?.lastName}">
      <dt><g:message code="jobseeker.lastName.label" default="Last Name" /></dt>

      <dd><g:fieldValue bean="${jobseekerInstance}" field="lastName"/></dd>

</g:if>

<g:if test="${jobseekerInstance?.dateOfBirth}">
      <dt><g:message code="jobseeker.dateOfBirth.label" default="Date Of Birth" /></dt>

      <dd><g:formatDate date="${jobseekerInstance?.dateOfBirth}" /></dd>

</g:if>

<g:if test="${jobseekerInstance?.nationality}">
      <dt><g:message code="jobseeker.nationality.label" default="Nationality" /></dt>

      <dd><g:fieldValue bean="${jobseekerInstance}" field="nationality"/></dd>

</g:if>

<g:if test="${jobseekerInstance?.contactNumber}">
      <dt><g:message code="jobseeker.contactNumber.label" default="Contact Number" /></dt>

      <dd><g:fieldValue bean="${jobseekerInstance}" field="contactNumber"/></dd>

</g:if>

<g:if test="${jobseekerInstance?.currentAddress}">
      <dt><g:message code="jobseeker.currentAddress.label" default="Current Address" /></dt>

      <dd><g:link controller="address" action="show" id="${jobseekerInstance?.currentAddress?.id}">${jobseekerInstance?.currentAddress?.encodeAsHTML()}</g:link></dd>

</g:if>

<g:if test="${jobseekerInstance?.complexion}">
      <dt><g:message code="jobseeker.complexion.label" default="Complexion" /></dt>

      <dd><g:fieldValue bean="${jobseekerInstance}" field="complexion"/></dd>

</g:if>

<g:if test="${jobseekerInstance?.dateCreated}">
      <dt><g:message code="jobseeker.dateCreated.label" default="Date Created" /></dt>

      <dd><g:formatDate date="${jobseekerInstance?.dateCreated}" /></dd>

</g:if>

<g:if test="${jobseekerInstance?.documents}">
      <dt><g:message code="jobseeker.documents.label" default="Documents" /></dt>

      <g:each in="${jobseekerInstance.documents}" var="d">
            <dd><g:link controller="documents" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></dd>
      </g:each>

</g:if>

<g:if test="${jobseekerInstance?.educations}">
      <dt><g:message code="jobseeker.educations.label" default="Educations" /></dt>

      <g:each in="${jobseekerInstance.educations}" var="e">
            <dd><g:link controller="acedemicEducation" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></dd>
      </g:each>

</g:if>

<g:if test="${jobseekerInstance?.gender}">
      <dt><g:message code="jobseeker.gender.label" default="Gender" /></dt>

      <dd><g:fieldValue bean="${jobseekerInstance}" field="gender"/></dd>

</g:if>

<g:if test="${jobseekerInstance?.height}">
      <dt><g:message code="jobseeker.height.label" default="Height" /></dt>

      <dd><g:fieldValue bean="${jobseekerInstance}" field="height"/></dd>

</g:if>


<g:if test="${jobseekerInstance?.isDeleted}">
      <dt><g:message code="jobseeker.isDeleted.label" default="Is Deleted" /></dt>

      <dd><g:fieldValue bean="${jobseekerInstance}" field="isDeleted"/></dd>

</g:if>

<g:if test="${jobseekerInstance?.jobCategory}">
      <dt><g:message code="jobseeker.jobCategory.label" default="Job Category" /></dt>

      <g:each in="${jobseekerInstance.jobCategory}" var="j">
            <dd><g:link controller="jobCategory" action="show" id="${j.id}">${j?.encodeAsHTML()}</g:link></dd>
      </g:each>

</g:if>

<g:if test="${jobseekerInstance?.languages}">
      <dt><g:message code="jobseeker.languages.label" default="Language" /></dt>

      <g:each in="${jobseekerInstance.languages}" var="l">
            <dd><g:link controller="knownLanguage" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></dd>
      </g:each>

</g:if>

<g:if test="${jobseekerInstance?.lastUpdated}">
      <dt><g:message code="jobseeker.lastUpdated.label" default="Last Updated" /></dt>

      <dd><g:formatDate date="${jobseekerInstance?.lastUpdated}" /></dd>

</g:if>

<g:if test="${jobseekerInstance?.localAgent}">
      <dt><g:message code="jobseeker.localAgent.label" default="Local Agent" /></dt>

      <dd><g:link controller="agent" action="show" id="${jobseekerInstance?.localAgent?.id}">${jobseekerInstance?.localAgent?.encodeAsHTML()}</g:link></dd>

</g:if>

<g:if test="${jobseekerInstance?.martialStatus}">
      <dt><g:message code="jobseeker.martialStatus.label" default="Martial Status" /></dt>

      <dd><g:link controller="fixedValue" action="show" id="${jobseekerInstance?.martialStatus?.id}">${jobseekerInstance?.martialStatus?.encodeAsHTML()}</g:link></dd>

</g:if>

<g:if test="${jobseekerInstance?.middleName}">
      <dt><g:message code="jobseeker.middleName.label" default="Middle Name" /></dt>

      <dd><g:fieldValue bean="${jobseekerInstance}" field="middleName"/></dd>

</g:if>

<g:if test="${jobseekerInstance?.mobileNumber}">
      <dt><g:message code="jobseeker.mobileNumber.label" default="Mobile Number" /></dt>

      <dd><g:fieldValue bean="${jobseekerInstance}" field="mobileNumber"/></dd>

</g:if>

<g:if test="${jobseekerInstance?.nominee}">
      <dt><g:message code="jobseeker.nominee.label" default="Nominee" /></dt>

      <dd><g:fieldValue bean="${jobseekerInstance}" field="nominee"/></dd>

</g:if>

<g:if test="${jobseekerInstance?.nomineeAddress}">
      <dt><g:message code="jobseeker.nomineeAddress.label" default="Nominee Address" /></dt>

      <dd><g:fieldValue bean="${jobseekerInstance}" field="nomineeAddress"/></dd>

</g:if>

<g:if test="${jobseekerInstance?.nomineeContactNumber}">
      <dt><g:message code="jobseeker.nomineeContactNumber.label" default="Nominee Contact Number" /></dt>

      <dd><g:fieldValue bean="${jobseekerInstance}" field="nomineeContactNumber"/></dd>

</g:if>

<g:if test="${jobseekerInstance?.otherDescription}">
      <dt><g:message code="jobseeker.otherDescription.label" default="Other Description" /></dt>

      <dd><g:fieldValue bean="${jobseekerInstance}" field="otherDescription"/></dd>

</g:if>

<g:if test="${jobseekerInstance?.passport}">
      <dt><g:message code="jobseeker.passport.label" default="Passport" /></dt>

      <dd><g:link controller="passport" action="show" id="${jobseekerInstance?.passport?.id}">${jobseekerInstance?.passport?.encodeAsHTML()}</g:link></dd>

</g:if>

<g:if test="${jobseekerInstance?.permanentAddress}">
      <dt><g:message code="jobseeker.permanentAddress.label" default="Permanent Address" /></dt>

      <dd><g:link controller="address" action="show" id="${jobseekerInstance?.permanentAddress?.id}">${jobseekerInstance?.permanentAddress?.encodeAsHTML()}</g:link></dd>

</g:if>

<g:if test="${jobseekerInstance?.photo}">
      <dt><g:message code="jobseeker.photo.label" default="Photo" /></dt>

      <dd><g:fieldValue bean="${jobseekerInstance}" field="photo"/></dd>

</g:if>

<g:if test="${jobseekerInstance?.relation}">
      <dt><g:message code="jobseeker.relation.label" default="Relation" /></dt>

      <dd><g:fieldValue bean="${jobseekerInstance}" field="relation"/></dd>

</g:if>

<g:if test="${jobseekerInstance?.religion}">
      <dt><g:message code="jobseeker.religion.label" default="Religion" /></dt>

      <dd><g:fieldValue bean="${jobseekerInstance}" field="religion"/></dd>

</g:if>

<g:if test="${jobseekerInstance?.trainings}">
      <dt><g:message code="jobseeker.trainings.label" default="Trainings" /></dt>

      <g:each in="${jobseekerInstance.trainings}" var="t">
            <dd><g:link controller="training" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></dd>
      </g:each>

</g:if>

<g:if test="${jobseekerInstance?.weight}">
      <dt><g:message code="jobseeker.weight.label" default="Weight" /></dt>

      <dd><g:fieldValue bean="${jobseekerInstance}" field="weight"/></dd>

</g:if>

<g:if test="${jobseekerInstance?.workExperience}">
      <dt><g:message code="jobseeker.workExperience.label" default="Work Experience" /></dt>

      <dd><g:fieldValue bean="${jobseekerInstance}" field="workExperience"/></dd>

</g:if>

</dl>

<g:form>
      <g:hiddenField name="id" value="${jobseekerInstance?.id}" />
      <div class="form-actions">
            <g:link class="btn" action="edit" id="${jobseekerInstance?.id}">
                  <i class="icon-pencil"></i>
                  <g:message code="default.button.edit.label" default="Edit" />
            </g:link>
            <button class="btn btn-danger" type="submit" name="_action_delete">
                  <i class="icon-trash icon-white"></i>
                  <g:message code="default.button.delete.label" default="Delete" />
            </button>
      </div>
</g:form>

</div>
<form id="fileupload" action="//jquery-file-upload.appspot.com/" method="POST" enctype="multipart/form-data">
      <!-- Redirect browsers with JavaScript disabled to the origin page -->
      <noscript><input type="hidden" name="redirect" value="http://blueimp.github.io/jQuery-File-Upload/"></noscript>
      <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
      <div class="fileupload-buttonbar">
            <div class="fileupload-buttons">
                  <!-- The fileinput-button span is used to style the file input field as button -->
                  <input type="hidden" name="jobseekerId" value="${jobseekerInstance?.id}"/>
                  <span class="fileinput-button">
                        <span>Add files...</span>
                        <input type="file" name="files[]" multiple>
                  </span>
                  <button type="submit" class="start">Start upload</button>
                  <button type="reset" class="cancel">Cancel upload</button>
                  <button type="button" class="delete">Delete</button>
                  <input type="checkbox" class="toggle">
                  <!-- The global file processing state -->
                  <span class="fileupload-process"></span>
            </div>
            <!-- The global progress state -->
            <div class="fileupload-progress fade" style="display:none">
                  <!-- The global progress bar -->
                  <div class="progress" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                  <!-- The extended global progress state -->
                  <div class="progress-extended">&nbsp;</div>
            </div>
      </div>
      <!-- The table listing the files available for upload/download -->
      <table role="presentation"><tbody class="files"></tbody></table>
</form>
<script id="template-upload" type="text/x-tmpl">
      {% for (var i=0, file; file=o.files[i]; i++) { %}
      <tr class="template-upload fade">
            <td class="title">
                  <label>File Name: <input type="text" name="fileName" required/><input type="hidden" name="jobseekerId" value="${jobseekerInstance?.id}"/></label>
            </td>
            <td>
                  <span class="preview"></span>
            </td>
            <td>
                  <p class="name">{%=file.name%}</p>
                  <strong class="error"></strong>
            </td>
            <td>
                  <p class="size">Processing...</p>
                  <div class="progress"></div>
            </td>
            <td>
                  {% if (!i && !o.options.autoUpload) { %}
                  <button class="start">Start</button>
                  {% } %}
                  {% if (!i) { %}
                  <button class="cancel">Cancel</button>
                  {% } %}
            </td>
      </tr>
      {% } %}
</script>
<script id="template-download" type="text/x-tmpl">
      {% for (var i=0, file; file=o.files[i]; i++) { %}
      <tr class="template-download fade">
            <td>
                  <span class="preview">
                        {% if (file.thumbnailUrl) { %}
                        <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
                        {% } %}
                  </span>
            </td>
            <td>
                  <p class="name">
                        <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
                  </p>
                  {% if (file.error) { %}
                  <div><span class="error">Error</span> {%=file.error%}</div>
                  {% } %}
            </td>
            <td>
                  <span class="size">{%=o.formatFileSize(file.size)%}</span>
            </td>
            <td>
                  <button class="delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}" {% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>Delete</button>
                  <input type="checkbox" name="delete" value="1" class="toggle">
            </td>
      </tr>
      {% } %}
</script>
<script type="text/javascript">

      $(function () {
            'use strict';
            // Initialize the jQuery File Upload widget:
            $('#fileupload').fileupload({
                  disableImageResize: false,
                  acceptFileTypes: /(\.|\/)(gif|jpe?g|png|pdf|doc|docx|odf)$/i,
                  maxNumberOfFiles:5,
                  maxFileSize:5000000,
                  previewCanvas:false,
                  previewThumbnail:false,
                  // singleFileUploads:false,
                  // Uncomment the following to send cross-domain cookies:
                  //xhrFields: {withCredentials: true},
                  url: "${createLink(controller: 'document',action: 'upload')}"
            }).bind('fileuploadadd', function (e, data) {
                        if((data.files.length + $(".template-upload").size())>$(this).fileupload('option', 'maxNumberOfFiles')){
                              alert("only allow " + $(this).fileupload('option', 'maxNumberOfFiles') + " file(s) for simultaneous upload");
                              return false;
                        }
                  });

            $('#fileupload').bind('fileuploadsubmit', function (e, data) {
                  var inputs = data.context.find(':input');
                  if (inputs.filter(function() { return $(this).val() == "" && $(this).prop('required')==true; }).first().focus().length) {
                        alert('Required field empty')
                        return false;
                  }

                  data.formData = inputs.serializeArray();
            });
//            // Enable iframe cross-domain access via redirect option:
//            $('#fileupload').fileupload(
//                  'option',
//                  'redirect',
//                  window.location.href.replace(
//                        /\/[^\/]*$/,
//                        '/cors/result.html?%s'
//                  )
//            );


            // Load existing files:
            $('#fileupload').addClass('fileupload-processing');
            $.ajax({
                  // Uncomment the following to send cross-domain cookies:
                  //xhrFields: {withCredentials: true},
                  url: "${createLink(controller: 'document',action: 'show')}",
                  dataType: 'json',
                  context: $('#fileupload')[0]
            }).always(function () {
                        $(this).removeClass('fileupload-processing');
                  }).done(function (result) {
                        $(this).fileupload('option', 'done')
                              .call(this, $.Event('done'), {result: result});
                  });


      });

</script>
</div>
</body>
</html>
