<%@ page import="com.ligontech.ApplicationProcess" %>

<div class="control-group fieldcontain ${hasErrors(bean: applicationProcessInstance, field: 'demand', 'error')} required">
      <label for="_demand" class="control-label"><g:message code="jobseeker.demand.label" default="demand" /><span class="required-indicator">*</span></label>
      <div class="controls">
            <g:textField name="_demand" required=""  data-provide="typeahead" autocomplete="off" value="${applicationProcessInstance?.demand?.value}"/>
            <input type="hidden" name="demand.id" id="demand" value="${applicationProcessInstance?.demand?.id}"/>
            <span class="help-inline">${hasErrors(bean: applicationProcessInstance, field: 'demand', 'error')}</span>
      </div>
</div>
<script type="text/javascript">
      $(document).ready(function(){
            $('#_demand').jqueryAutoComplete({
                  hiddenId:'demand',
                  url:'<g:createLink controller="autoComplete" action="autoCompleteAction"/>',
                  query:{'domain':'${com.ligontech.Demand.getName()}'},
                  onSuccess:function(value){
                        $.ajax({
                              type:'GET',
                              url:'<g:createLink controller="jobs" action="findAllByDemand"/>',
                              data:{ 'demand.id': $('#demand').val() }
                        }).done(function(data){
                                    var $element = $('#jobs');
                                    $element.empty();
                                    $element.append($('<option/>').val('').text('Choose Job'));
                                    $element.prop('selected', 'selected');
                                    $.each(data, function(key, value) {
                                          var option = $('<option/>').val(key).text(value);
                                          $element.append(option)
                                    });
                                    $('#jobs').combobox('destroy');
                                    $('#jobs').combobox({
                                          select:function(event,ui){
                                                updateJobseeker();
                                          }
                                    });
                              }).fail(function(){

                              }).always(function(){

                              });
                  },
                  onError:function(){

                  }
            })

            $('#jobs').combobox({
                  select:function(event,ui){
                        updateJobseeker();
                  }
            });
      })
      function updateJobseeker(){
            $.ajax({
                  type:'GET',
                  url:'<g:createLink controller="applicationProcess" action="ajaxJobseeker"/>',
                  data:{ jobId:$('#jobs').val(), demandId: $('#demand').val() }
            }).done(function(data){
                        $('#jobseekerContainer').html(data);
                  }).fail(function(){

                  }).always(function(){

                  })
      }
</script>

%{--<div class="control-group fieldcontain ${hasErrors(bean: applicationProcessInstance, field: 'demand', 'error')} ">--}%
%{--<label for="demand" class="control-label"><g:message code="applicationProcess.demand.label" default="Demand" /></label>--}%
%{--<div class="controls">--}%
%{--<g:select id="demand" name="demand.id" from="${com.ligontech.Demand.list()}" optionKey="id" value="${applicationProcessInstance?.demand?.id}" class="many-to-one" noSelection="['null': '']"/>--}%
%{--<span class="help-inline">${hasErrors(bean: applicationProcessInstance, field: 'demand', 'error')}</span>--}%
%{--</div>--}%
%{--</div>--}%

<div class="control-group fieldcontain ${hasErrors(bean: applicationProcessInstance, field: 'jobs', 'error')} ">
      <label for="jobs" class="control-label"><g:message code="applicationProcess.jobs.label" default="Jobs" /></label>
      <div class="controls">
            <g:select id="jobs" name="jobs.id" from="[:]" noSelection="['': 'Choose Job']" />
            <span class="help-inline">${hasErrors(bean: applicationProcessInstance, field: 'jobs', 'error')}</span>
      </div>
</div>

%{--<div class="control-group fieldcontain ${hasErrors(bean: applicationProcessInstance, field: 'jobs', 'error')} required">--}%
%{--<label for="_jobs" class="control-label"><g:message code="jobseeker.jobs.label" default="jobs" /><span class="required-indicator">*</span></label>--}%
%{--<div class="controls">--}%
%{--<g:textField name="_jobs" required=""  data-provide="typeahead" autocomplete="off" value="${applicationProcessInstance?.jobs?.value}"/>--}%
%{--<input type="hidden" name="jobs.id" id="jobs" value="${applicationProcessInstance?.jobs?.id}"/>--}%
%{--<span class="help-inline">${hasErrors(bean: applicationProcessInstance, field: 'jobs', 'error')}</span>--}%
%{--</div>--}%
%{--</div>--}%
%{--<script>--}%
%{--$(document).ready(function(){--}%
%{--$('#_jobs').jqueryAutoComplete({--}%
%{--hiddenId:'jobs',--}%
%{--url:'<g:createLink controller="autoComplete" action="autoCompleteAction"/>',--}%
%{--parentObject:$('#demand'),--}%
%{--query:{'domain':'${com.ligontech.Jobs.getName()}'},--}%
%{--onSuccess:function(value){--}%
%{--$.ajax({--}%
%{--type:'GET',--}%
%{--url:'<g:createLink controller="applicationProcess" action="ajaxJobseeker"/>',--}%
%{--data:{ job:$('#jobs').val(), demand: $('#demand').val() }--}%
%{--}).done(function(data){--}%
%{--$('#jobseeker_list').remove();--}%
%{--$(document).append(data);--}%
%{--}).fail(function(){--}%

%{--}).always(function(){--}%

%{--});--}%
%{--},--}%
%{--onError:function(){--}%
%{--$('#jobseeker_list').remove();--}%
%{--}--}%
%{--})--}%

%{--})--}%
%{--</script>--}%
<div class="resetForm">
      <div class="control-group fieldcontain ${hasErrors(bean: applicationProcessInstance, field: 'jobseeker', 'error')} required">
            <label for="_jobseeker" class="control-label"><g:message code="jobseeker.jobseeker.label" default="jobseeker" /><span class="required-indicator">*</span></label>
            <div class="controls">
                  <g:textField name="_jobseeker" required=""  data-provide="typeahead" autocomplete="off" value="${applicationProcessInstance?.jobseeker?.value}"/>
                  <input type="hidden" name="jobseeker.id" id="jobseeker" value="${applicationProcessInstance?.jobseeker?.id}"/>
                  <input type="hidden" name="jobseeker.version" id="jversion" value=""/>
                  <span class="help-inline">${hasErrors(bean: applicationProcessInstance, field: 'jobseeker', 'error')}</span>
            </div>
      </div>
      <div id="jobseeker_details" style="display: none">

      </div>
      <script>
            $(document).ready(function(){
                  $('#_jobseeker').jqueryAutoComplete({
                        hiddenId:'jobseeker',
                        url:'<g:createLink controller="autoComplete" action="autoCompleteAction"/>',
                        query:{'domain':'${com.ligontech.Jobseeker.getName()}'},
                        onSuccess:function(value){
                              var data=value;
                              console.log(data)
                              var html="Name : "+data.firstName+" "+(data.middleName!=undefined?data.middleName+" ":"")+data.lastName+"<br>";
                              if(data.passport!=undefined)
                                    html+="Passport No :"+data.passport.number+"<br>";
                              if(data.email!=undefined)
                                    html+="Email : "+data.email+"<br>";
                              if(data.contactNumber!=undefined)
                                    html+="Contact Number : "+data.contactNumber;
                              alert(data.version)
                              $('#jversion').val(data.version)
                              $('#jobseeker_details').html(html);
                              $('#jobseeker_details').show();
                        },
                        onError:function(){
                              $('#jobseeker_details').hide();
                              $('#jversion').val('')
                              $('#jobseeker_details').html('');
                        }
                  })

            })
      </script>
      <div class="control-group fieldcontain required">
            <label for="passportProcess" class="control-label">Passport</label>
            <div class="controls">
                  <g:set var="passportProcess" value="${['Collected','Not Collected']}"/>
                  <g:radioGroup name="passportProcess" id="passportProcess"
                                labels="${passportProcess}"
                                values="${passportProcess}">
                        <label class="radio inline"> ${it.radio} ${it.label} </label>
                  </g:radioGroup>
                  <span class="help-inline"></span>
            </div>
      </div>
      <div class="control-group fieldcontain ">
            <label for="remark" class="control-label">Remark</label>
            <div class="controls">
                  <g:textArea rows="3" name="remark"></g:textArea>
            </div>
      </div>
</div>
%{--<div class="control-group fieldcontain ${hasErrors(bean: applicationProcessInstance, field: 'jobseeker', 'error')} ">--}%
%{--<label for="jobseeker" class="control-label"><g:message code="applicationProcess.jobseeker.label" default="Jobseeker" /></label>--}%
%{--<div class="controls">--}%
%{--<g:select id="jobseeker" name="jobseeker.id" from="${com.ligontech.Jobseeker.list()}" optionKey="id" value="${applicationProcessInstance?.jobseeker?.id}" class="many-to-one" noSelection="['null': '']"/>--}%
%{--<span class="help-inline">${hasErrors(bean: applicationProcessInstance, field: 'jobseeker', 'error')}</span>--}%
%{--</div>--}%
%{--</div>--}%


