
<%@ page import="com.ligontech.Jobseeker" %>
<!doctype html>
<html>
<head>
      <meta name="layout" content="main">
      <g:set var="entityName" value="${message(code: 'jobseeker.label', default: 'Jobseeker')}" />
      <title><g:message code="default.show.label" args="[entityName]" /></title>
      <r:require module="upload"/>
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
<div id="fileuploader">Upload</div>
<button class="button" id="startUpload">
      Start Upload
</button>
<div id="documentContainer">
      <g:link controller="document" action="downloadAll" params="[jobseekerId:jobseekerInstance?.id]">Download All</g:link>
      <table>
            <thead>
            <tr>
                  <th><input type="checkbox" name="all_document" id="all_document"/>  </th>
                  <th>File</th>
                  <th>size</th>
                  <th><a href="javascript:void(0);" onclick="deleteSelectedDocument();">Delete</a> </th>
            </tr>
            </thead>
            <tbody>
            <g:if test="${jobseekerInstance?.documents}">
                  <g:each in="${jobseekerInstance.documents}" var="d">
                        <g:render template="document" model="[document:d,jobseeker:jobseekerInstance?.id]"/>
                  </g:each>

            </g:if>
            </tbody>
      </table>
</div>
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

<script>
      $('#documentContainer').on('change','#all_document',function(){
            if($(this).is(':checked')){
                  $('.child_document').prop('checked',true);
            }else{
                  $('.child_document').prop('checked',false);
            }
      });
      function deleteSelectedDocument(){
            var idArray=[];
            $('.child_document').filter(':checked').each(function(index){
                  idArray[index]=$(this).data('id');
            });
            var data={id:idArray,jobseekerid:${jobseekerInstance?.id}};
            jQuery.ajax({
                  type:'POST',
                  data:data,
                  url:'${createLink(controller: 'document',action: 'bulkDelete')}',
                  success:function(data,textStatus){
                        $.unblockUI();

//                        if(data==200){
//                              $('#document_'+id).remove();
//                              alert('File deleted');
//                        }else if(data==404){
//                              alert('No file found');
//                        }else{
//                              alert('Fail to delete document, Please try again');;
//                        }
                  },
                  error:function(XMLHttpRequest,textStatus,errorThrown){
                        $.unblockUI();
                        alert('Fail to delete document, Please try again');;
                  },always:function(){
                        $.unblockUI();
                  }
            });
      }
      function deleteDocument(id,name,jobseekerId){
            $.blockUI();
            jQuery.ajax({
                  type:'POST',
                  data:{'id': id,
                        'name':name,
                        'jobseekerId': jobseekerId
                  },
                  url:'${createLink(controller: 'document',action: 'delete')}',
                  success:function(data,textStatus){
                        $.unblockUI();
                        if(data==200){
                              $('#document_'+id).remove();
                              alert('File deleted');
                        }else if(data==404){
                              alert('No file found');
                        }else{
                              alert('Fail to delete document, Please try again');;
                        }
                  },
                  error:function(XMLHttpRequest,textStatus,errorThrown){
                        $.unblockUI();
                        alert('Fail to delete document, Please try again');;
                  },always:function(){
                        $.unblockUI();
                  }
            });
      }
      $(document).ready(function()
      {
            var uploadObj=$("#fileuploader").uploadFile({
                  url:"${createLink(controller: 'document',action:'upload')}",
                  multiple:true,
                  allowedTypes:"png,gif,jpg,jpeg",
                  autoSubmit:false,
                  maxFileSize:1024*1024*5,
                  fileName:"files",
                  abortStr:"Abort",
                  cancelStr:"Cancel",
                  formData:{jobseekerId:"${jobseekerInstance?.id}"},
                  showStatusAfterSuccess:false,
                  onSubmit:function(files,title)
                  {
                        if($(title).find('input').val()==''){
                              alert('Title required');
                              return false;
                        }
                  },
                  onSuccess:function(files,data,xhr)
                  {
                        var ct = xhr.getResponseHeader("content-type") || "";
                        if (ct.indexOf('html') > -1) {
                              $('#documentContainer').find('table').find('tbody').append(data);
                        }
                        if (ct.indexOf('json') > -1) {
                              alert(data.error);
                        }
                        //files: list of files
                        //data: response from server
                        //xhr : jquer xhr object
                  }
                  //returnType: "json"
            });
            $("#startUpload").click(function()
            {
                  uploadObj.startUpload();
            });
      });
</script>
</div>
</body>
</html>
