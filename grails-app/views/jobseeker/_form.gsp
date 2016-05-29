<%@ page import="com.ligontech.JsonHelper; grails.converters.JSON;com.ligontech.Jobseeker" %>
<fieldset>
      <legend>Personal Info</legend>
      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'firstName', 'error')} required">
            <label for="firstName" class="control-label"><g:message code="jobseeker.firstName.label" default="First Name" /><span class="required-indicator">*</span></label>
            <div class="controls">
                  <g:textField name="firstName" required="" value="${jobseekerInstance?.firstName}"/>
                  <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'firstName', 'error')}</span>
            </div>
      </div>
      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'middleName', 'error')} ">
            <label for="middleName" class="control-label"><g:message code="jobseeker.middleName.label" default="Middle Name" /></label>
            <div class="controls">
                  <g:textField name="middleName" value="${jobseekerInstance?.middleName}"/>
                  <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'middleName', 'error')}</span>
            </div>
      </div>
      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'lastName', 'error')} required">
            <label for="lastName" class="control-label"><g:message code="jobseeker.lastName.label" default="Last Name" /><span class="required-indicator">*</span></label>
            <div class="controls">
                  <g:textField name="lastName" required="" value="${jobseekerInstance?.lastName}"/>
                  <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'lastName', 'error')}</span>
            </div>
      </div>
      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'email', 'error')} required">
            <label for="email" class="control-label"><g:message code="jobseeker.email.label" default="Email" />
                  <span class="required-indicator">*</span></label>
            <div class="controls">
                  <g:textField name="email" required="" value="${jobseekerInstance?.email}"/>
                  <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'email', 'error')}</span>
            </div>
      </div>
      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'fatherName', 'error')} required">
            <label for="fatherName" class="control-label"><g:message code="jobseeker.fatherName.label" default="Father Name" />
                  <span class="required-indicator">*</span></label>
            <div class="controls">
                  <g:textField name="fatherName" required="" value="${jobseekerInstance?.fatherName}"/>
                  <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'fatherName', 'error')}</span>
            </div>
      </div>
      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'expectedSalary', 'error')} required">
            <label for="expectedSalary" class="control-label"><g:message code="jobseeker.expectedSalary.label" default="Expected Salary" />
                  <span class="required-indicator">*</span></label>
            <div class="controls">
                  <g:textField name="expectedSalary" required="" value="${jobseekerInstance?.expectedSalary}"/>
                  <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'expectedSalary', 'error')}</span>
            </div>
      </div>
      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'dateOfBirth', 'error')} required">
            <label for="dateOfBirth" class="control-label"><g:message code="jobseeker.dateOfBirth.label" default="Date Of Birth" /><span class="required-indicator">*</span></label>
            <div class="controls">
                  <g:textField name="dateOfBirth" readonly="readonly" placeholder="Select Date..."
                               value="${jobseekerInstance?.dateOfBirth?.format('dd MMMM yyyy')}"  class="datepicker"/>
                  %{--<div>--}%
                        %{--<g:datePicker name="dateOfBirth" precision="day" value="${jobseekerInstance?.dateOfBirth}" default="none"--}%
                                      %{--noSelection="['':'']" />--}%
                  %{--</div>--}%
                  <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'dateOfBirth', 'error')}</span>
            </div>
      </div>

      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'nationality', 'error')} required">
            <label for="nationality" class="control-label"><g:message code="jobseeker.nationality.label" default="Nationality" /><span class="required-indicator">*</span></label>
            <div class="controls">
                  <g:select id="nationality" name="nationality.id" from="${nationality}" optionKey="id" value="${jobseekerInstance?.nationality?.id}" class="many-to-one select-menu" noSelection="['': '--Select--']"/>
                  <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'nationality', 'error')}</span>
            </div>
      </div>
      <script>
            $(document).ready(function(){
                  $("#dateOfBirth").datepicker({
                        changeMonth: true,
                        changeYear: true,
                        inline: true,
                        nextText: '&rarr;',
                        prevText: '&larr;',
                        showOtherMonths: true,
                        dateFormat: 'dd MM yy',
                        dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
                        showOn: "button",
                        maxDate: "-1Y",
                        buttonImage: "<g:resource dir="img" file="calendar-blue.png"/>",
                        buttonImageOnly: true
//                        onClose: function( selectedDate ) {
//                              var date = $(this).datepicker('getDate');
//                              if(date!=null && date!=undefined){
//                                    var day  = date.getDate(),
//                                          month = date.getMonth() + 1,
//                                          year =  date.getFullYear();
//                                    var dateId=$(this).prop('id').replace('date_','');
//                                    $('#'+dateId+'_year').val(year);
//                                    $('#'+dateId+'_month').val(month);
//                                    $('#'+dateId+'_day').val(day);
//                              }
//                        }
                  });
                  $('.select-menu').combobox()
            })
      </script>
      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'contactNumber', 'error')} required">
            <label for="contactNumber" class="control-label"><g:message code="jobseeker.contactNumber.label" default="Contact Number" /><span class="required-indicator">*</span></label>
            <div class="controls">
                  <g:textField name="contactNumber" required="" value="${jobseekerInstance?.contactNumber}"/>
                  <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'contactNumber', 'error')}</span>
            </div>
      </div>
      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'mobileNumber', 'error')} ">
            <label for="mobileNumber" class="control-label"><g:message code="jobseeker.mobileNumber.label" default="Mobile Number" /></label>
            <div class="controls">
                  <g:textField name="mobileNumber" value="${jobseekerInstance?.mobileNumber}"/>
                  <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'mobileNumber', 'error')}</span>
            </div>
      </div>
      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'complexion', 'error')} ">
            <label for="complexion" class="control-label"><g:message code="jobseeker.complexion.label" default="Complexion" /></label>
            <div class="controls">
                  <g:textField name="complexion" value="${jobseekerInstance?.complexion}"/>
                  <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'complexion', 'error')}</span>
            </div>
      </div>
      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'gender', 'error')} required">
            <label for="gender" class="control-label"><g:message code="jobseeker.gender.label" default="Gender" /><span class="required-indicator">*</span></label>
            <div class="controls">
                  <g:set var="allGender" value="${gender}"/>
                  <g:radioGroup name="gender.id" id="gender"
                                labels="${allGender.value}"
                                values="${allGender.id}" value="${(jobseekerInstance?.gender?.id)}">
                        <label class="radio inline"> ${it.radio} ${it.label} </label>
                  </g:radioGroup>
                  <span class="help-inline"></span>
            </div>
      </div>
      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'height', 'error')} ">
            <label for="height" class="control-label"><g:message code="jobseeker.height.label" default="Height" /></label>
            <div class="controls">
                  <g:textField name="height" class="span2" value="${fieldValue(bean: jobseekerInstance, field: 'height')}"/>&nbsp;&nbsp;Meters
                  <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'height', 'error')}</span>
            </div>
      </div>

      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'martialStatus', 'error')} ">
            <label for="martialStatus" class="control-label"><g:message code="jobseeker.martialStatus.label" default="Martial Status" /></label>
            <div class="controls">
                  <g:select id="martialStatus" name="martialStatus.id" from="${martialStatus}" optionKey="id" value="${jobseekerInstance?.martialStatus?.id}" class="many-to-one select-menu" noSelection="['': '--Select--']"/>
                  <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'martialStatus', 'error')}</span>
            </div>
      </div>


      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'religion', 'error')} ">
            <label for="religion" class="control-label"><g:message code="jobseeker.religion.label" default="Religion" /></label>
            <div class="controls">
                  <g:select id="religion" name="religion.id" from="${religion}" optionKey="id" value="${jobseekerInstance?.religion?.id}" class="many-to-one select-menu" noSelection="['': '--Select--']"/>
                  <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'religion', 'error')}</span>
            </div>
      </div>
      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'weight', 'error')} ">
            <label for="weight" class="control-label"><g:message code="jobseeker.weight.label" default="Weight" /></label>
            <div class="controls">
                  <g:textField name="weight" class="span2" value="${fieldValue(bean: jobseekerInstance, field: 'weight')}"/>&nbsp;&nbsp;kg
                  <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'weight', 'error')}</span>
            </div>
      </div>
      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'photo', 'error')} ">
            <label for="photo_file" class="control-label"><g:message code="agent.photo.label" default="Photo" /></label>
            <div class="controls">
                  <g:field type="file" name="photo_file" value="${jobseekerInstance?.photo}"/>
                  <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'photo', 'error')}</span>
            </div>
      </div>
      <g:if test="${isEdit}">
            <div class="control-group fieldcontain ">
                  <div class="controls">
                        <label class="checkbox">
                              <input type="checkbox"  name="remove_image">Remove Photo
                        </label>
                  </div>
            </div>
      </g:if>
</fieldset>
<fieldset>
      <legend>Address</legend>
      <fieldset id="currentAddress">
            <legend class="inner_legend">Current Address</legend>
            <g:render template="/shared/nepAddress" model="[item:'currentAddress',address:jobseekerInstance?.currentAddress,isEdit:isEdit]" bean="${jobseekerInstance?.currentAddress}"/>
      </fieldset>
      <fieldset id="permanentAddress">
            <legend class="inner_legend">Permanent Address</legend>
            <div class="control-group">
                  <div class="controls">
                        <label class="checkbox">
                              <input type="checkbox" name="same_as_current" id="same_as_current"> Same as Current Address
                        </label>
                  </div>
            </div>
            <g:render template="/shared/nepAddress" model="[item:'permanentAddress',address:jobseekerInstance?.permanentAddress,isEdit:isEdit]" bean="${jobseekerInstance?.permanentAddress}"/>
      </fieldset>
</fieldset>
<fieldset>
      <legend>Education</legend>
      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'educations', 'error')} ">

            <g:render template="/jobseeker/educations" model="['jobseekerInstance':jobseekerInstance]" />
            %{--<a href="javascript:void(0);" id="educations_link"  name="educations">Add Job</a>--}%
            %{--<ul class="one-to-many">--}%
            %{--<g:each in="${jobseekerInstance?.educations?}" var="e">--}%
            %{--<li><g:link controller="acedemicEducation" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>--}%
            %{--</g:each>--}%
            %{--<li class="add">--}%
            %{--<g:link controller="acedemicEducation" action="create" params="['jobseeker.id': jobseekerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'acedemicEducation.label', default: 'AcedemicEducation')])}</g:link>--}%
            %{--</li>--}%
            %{--</ul>--}%

            <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'educations', 'error')}</span>

      </div>
      <div id="educations_container"></div>
</fieldset>
<!-- TODO working-->
%{--<fieldset>--}%
%{--<legend>Education</legend>--}%
%{--<div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'educations', 'error')} ">--}%
%{--<label for="educations" class="control-label"><g:message code="jobseeker.educations.label" default="Educations" /></label>--}%
%{--<div class="controls">--}%
%{--<a href="javascript:void(0);" id="educations_link"  name="educations">Add Job</a>--}%
%{--<ul class="one-to-many">--}%
%{--<g:each in="${jobseekerInstance?.educations?}" var="e">--}%
%{--<li><g:link controller="acedemicEducation" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>--}%
%{--</g:each>--}%
%{--<li class="add">--}%
%{--<g:link controller="acedemicEducation" action="create" params="['jobseeker.id': jobseekerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'acedemicEducation.label', default: 'AcedemicEducation')])}</g:link>--}%
%{--</li>--}%
%{--</ul>--}%

%{--<span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'educations', 'error')}</span>--}%
%{--</div>--}%
%{--</div>--}%
%{--<div id="educations_container"></div>--}%
%{--</fieldset>--}%
%{--<script>--}%
%{--$(document).ready(function(){--}%
%{--$('#educations_link').addMore({--}%
%{--uniqueKey: "educations",--}%
%{--tableHeader:{'degree.id':'Degree',nameOfDegree:'Name of Degree',board:'Board',graduationYear:'Graduation Year'},--}%
%{--container:'educations_container',--}%
%{--actions:{Edit:'icon-pencil',Delete:'icon-trash'},--}%
%{--data:${educationsList?JsonHelper.toJson(educationsList, 'educations') as JSON:[]},--}%
%{--sn:null,--}%
%{--count:0--}%
%{--});--}%
%{--});--}%
%{--</script>--}%
<fieldset>
      <legend>Training</legend>
      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'trainings', 'error')} ">
            %{--<label for="trainings" class="control-label"><g:message code="jobseeker.trainings.label" default="Trainings" /></label>--}%
            %{--<div class="controls">--}%

            %{--<ul class="one-to-many">--}%
            %{--<g:each in="${jobseekerInstance?.trainings?}" var="t">--}%
            %{--<li><g:link controller="training" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>--}%
            %{--</g:each>--}%
            %{--<li class="add">--}%
            %{--<g:link controller="training" action="create" params="['jobseeker.id': jobseekerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'training.label', default: 'Training')])}</g:link>--}%
            %{--</li>--}%
            %{--</ul>--}%
            <g:render template="/jobseeker/trainings" model="['jobseekerInstance':jobseekerInstance]" />
            <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'trainings', 'error')}</span>
            %{--</div>--}%
      </div>
</fieldset>
<fieldset>
      <legend>Language</legend>
      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'language', 'error')} ">
            <g:render template="/jobseeker/languages" model="['jobseekerInstance':jobseekerInstance,languageList:languageList]" />
            %{--<label for="language" class="control-label"><g:message code="jobseeker.language.label" default="Language" /></label>--}%
            %{--<div class="controls">--}%

            %{--<ul class="one-to-many">--}%
            %{--<g:each in="${jobseekerInstance?.language?}" var="l">--}%
            %{--<li><g:link controller="knownLanguage" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>--}%
            %{--</g:each>--}%
            %{--<li class="add">--}%
            %{--<g:link controller="knownLanguage" action="create" params="['jobseeker.id': jobseekerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'knownLanguage.label', default: 'KnownLanguage')])}</g:link>--}%
            %{--</li>--}%
            %{--</ul>--}%

            <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'language', 'error')}</span>
            %{--</div>--}%
      </div>
</fieldset>

<fieldset>
      <legend>Nominee</legend>
      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'nominee', 'error')} ">
            <label for="nominee" class="control-label"><g:message code="jobseeker.nominee.label" default="Nominee" /></label>
            <div class="controls">
                  <g:textField name="nominee" value="${jobseekerInstance?.nominee}"/>
                  <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'nominee', 'error')}</span>
            </div>
      </div>

      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'nomineeAddress', 'error')} ">
            <label for="nomineeAddress" class="control-label"><g:message code="jobseeker.nomineeAddress.label" default="Nominee Address" /></label>
            <div class="controls">
                  <g:textField name="nomineeAddress" value="${jobseekerInstance?.nomineeAddress}"/>
                  <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'nomineeAddress', 'error')}</span>
            </div>
      </div>

      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'nomineeContactNumber', 'error')} ">
            <label for="nomineeContactNumber" class="control-label"><g:message code="jobseeker.nomineeContactNumber.label" default="Nominee Contact Number" /></label>
            <div class="controls">
                  <g:textField name="nomineeContactNumber" value="${jobseekerInstance?.nomineeContactNumber}"/>
                  <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'nomineeContactNumber', 'error')}</span>
            </div>
      </div>

      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'relation', 'error')} ">
            <label for="relation" class="control-label"><g:message code="jobseeker.relation.label" default="Relation" /></label>
            <div class="controls">
                  <g:textField name="relation" value="${jobseekerInstance?.relation}"/>
                  <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'relation', 'error')}</span>
            </div>
      </div>
</fieldset>
<fieldset>
      <legend>Other Info</legend>
      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'jobCategory', 'error')} ">
            <label for="jobCategory" class="control-label"><g:message code="jobseeker.jobCategory.label" default="Job Category" /></label>
            <div class="controls">
                  <g:select name="jobCategory" id="jobCategory" from="${jobCategory}" multiple="multiple" optionKey="id" size="5" value="${jobseekerInstance?.jobCategory*.id}" class="many-to-many"/>
                  <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'jobCategory', 'error')}</span>
            </div>
      </div>
      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'localAgent', 'error')} ">
            <label for="localAgent" class="control-label"><g:message code="jobseeker.localAgent.label" default="Local Agent" /></label>
            <div class="controls">
                  <g:select id="localAgent" name="localAgent.id" from="${agents}" optionKey="id" value="${jobseekerInstance?.localAgent?.id}"  class="many-to-one" noSelection="['': '--Select--']"/>
                  <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'localAgent', 'error')}</span>
            </div>
      </div>
      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'otherDescription', 'error')} ">
            <label for="otherDescription" class="control-label"><g:message code="jobseeker.otherDescription.label" default="Other Description" /></label>
            <div class="controls">
                  <g:textField name="otherDescription" value="${jobseekerInstance?.otherDescription}"/>
                  <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'otherDescription', 'error')}</span>
            </div>
      </div>
      <div class="control-group fieldcontain ${hasErrors(bean: jobseekerInstance, field: 'workExperience', 'error')} ">
            <label for="workExperience" class="control-label"><g:message code="jobseeker.workExperience.label" default="Work Experience" /></label>
            <div class="controls">
                  <g:textField name="workExperience" value="${jobseekerInstance?.workExperience}"/>
                  <span class="help-inline">${hasErrors(bean: jobseekerInstance, field: 'workExperience', 'error')}</span>
            </div>
      </div>
</fieldset>
<fieldset>
      <legend>Passport</legend>
      <g:render template="/shared/passport" model="[item:'passport',passportInstance:jobseekerInstance?.passport]" bean="${jobseekerInstance?.passport}"/>
</fieldset>
<script>
      $(document).ready(function(){
            $('#same_as_current').change(function(){
                  if($(this).is(':checked')){
                        copyAddress()
                  }else{
                        $('#permanentAddress').find('input:text').val('').prop('disabled', false);
                        $('#permanentAddress').find('select').val('').prop('disabled', false);
                  }
            });
      });
      function copyAddress(){
            $('#currentAddress input').each(function(){
                  var name=$(this).prop('name').replace('currentAddress','permanentAddress');
                  var copyInput=$('#permanentAddress input[name="'+name+'"]')
                  copyInput.val($(this).val());
                  copyInput.prop('disabled', true);
            });
            $('#currentAddress select').each(function(){
                  var name=$(this).prop('name').replace('currentAddress','permanentAddress');
                  var copyInput=$('#permanentAddress select[name="'+name+'"]')
                  copyInput.val($(this).val());
                  copyInput.prop('disabled', true);
            });
      }
      $(document).ready(function(){
            $('#jobCategory').multiSelect({
                  uniqueKey: "jobCategory",
                  title:'Job Category'
            });
      });
</script>