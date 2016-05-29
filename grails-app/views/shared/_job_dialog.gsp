<%@ page import="com.ligontech.FixedValue; com.ligontech.FieldType" %>
<div id="dialog_job_form" title="Create new job">
      <g:hiddenField name="jobs[{i}].id" id="jobs[{i}].id"/>
      <div class="control-group fieldcontain required">
            <div class="controls">
                  <label for="designation" >
                        <g:message code="jobs.designation.label" default="Designation" />
                        <span class="required-indicator">*</span>
                  </label>
                  <g:textField name="jobs[{i}].designation" id="jobs[{i}].designation" required="" value=""/>
                  <span class="help-inline"></span>
            </div>
      </div>

      <div class="control-group fieldcontain  required">
            <div class="controls">
                  <label for="jobCategory" >
                        <g:message code="jobs.jobCategory.label" default="Job Category" />
                        <span class="required-indicator">*</span>
                  </label>

                  <g:select id="jobs[{i}].jobCategory" name="jobs[{i}].jobCategory.id" from="${com.ligontech.JobCategory.listAll.list()}" optionKey="id" value="" class="many-to-one" noSelection="['': '--Select--']"/>
                  <span class="help-inline"></span>
            </div>
      </div>
      <div class="control-group fieldcontain required">
            <div class="controls">
                  <label for="numberOfPosition" ><g:message code="jobs.numberOfPosition.label" default="Number Of Position" /><span class="required-indicator">*</span></label>

                  <g:textField name="jobs[{i}].numberOfPosition" id="jobs[{i}].numberOfPosition" type="number" min="1" class="span2" value="" required=""/>
                  <span class="help-inline"></span>
            </div>
      </div>

      <div class="control-group fieldcontain required">
            <div class="controls">
                  <label for="basicSalary" ><g:message code="jobs.basicSalary.label" default="Basic Salary" /><span class="required-indicator">*</span></label>

                  <g:textField name="jobs[{i}].basicSalary" id="jobs[{i}].basicSalary" required="" value="" />
                  <span class="help-inline"></span>
            </div>
      </div>

      <div class="control-group fieldcontain  ">
            <div class="controls">
                  <label for="salaryInNepali" ><g:message code="jobs.salaryInNepali.label" default="Salary In Nepali" /></label>

                  <g:field name="jobs[{i}].salaryInNepali" id="jobs[{i}].salaryInNepali" type="number" min="1" value=""/>
                  <span class="help-inline"></span>
            </div>
      </div>


      <div class="control-group fieldcontain ">
            <div class="controls">
                  <label for="expenseToProcess" ><g:message code="jobs.expenseToProcess.label" default="Expense To Process" /></label>

                  <g:field name="jobs[{i}].expenseToProcess" id="jobs[{i}].expenseToProcess" type="number" min="1" value="${jobsInstance?.expenseToProcess}"/>
                  <span class="help-inline"></span>
            </div>
      </div>
      <div class="control-group fieldcontain  ">
            <div class="controls">
                  <label for="qualification" ><g:message code="jobs.qualification.label" default="Qualification" /></label>

                  <g:textArea rows="3" name="jobs[{i}].qualification" id="jobs[{i}].qualification"></g:textArea>
                  <span class="help-inline"></span>
            </div>
      </div>

      <div class="control-group fieldcontain  ">
            <div class="controls">
                  <label for="ageGroup" ><g:message code="jobs.ageGroup.label" default="Age Group" /></label>

                  <g:select id="jobs[{i}].ageGroup.id" name="jobs[{i}].ageGroup.id" from="${com.ligontech.FixedValue.findAllByFieldType(FieldType.AGEGROUP)}" optionKey="id" value="" class="many-to-one" noSelection="['': '--Select--']"/>
                  <span class="help-inline"></span>
            </div>
      </div>

      <div class="control-group fieldcontain  required">
            <div class="controls">
                  <label for="gender" ><g:message code="jobs.gender.label" default="Gender" /><span class="required-indicator">*</span></label>

                  <g:set var="allGender" value="${com.ligontech.FixedValue.findAllByFieldType(FieldType.GENDER)}"/>
                  <label class="radio inline"> <input type="radio" name="jobs[{i}].gender.id" checked="checked" value="" id="" > Any </label>
                  <g:radioGroup name="jobs[{i}].gender.id" id="jobs[{i}].gender.id"
                                labels="${allGender.value}"
                                values="${allGender.id}" value="">
                        <label class="radio inline"> ${it.radio} ${it.label} </label>
                  </g:radioGroup>
                  <span class="help-inline"></span>
            </div>
      </div>

      <div class="control-group fieldcontain  required">
            <div class="controls">
                  <label for="dailyWorkingHour" ><g:message code="jobs.dailyWorkingHour.label" default="Daily Working Hour" /><span class="required-indicator">*</span></label>

                  <g:textField class="span2" name="jobs[{i}].dailyWorkingHour" type="number" max="24" value="" required="" min="0"/>
                  <span class="help-inline"></span>
            </div>
      </div>

      <div class="control-group fieldcontain  required">
            <div class="controls">
                  <label for="weeklyWorkDays" ><g:message code="jobs.weeklyWorkDays.label" default="Weekly Work Days" /><span class="required-indicator">*</span></label>

                  <g:textField class="span2" name="jobs[{i}].weeklyWorkDays" id="jobs[{i}].weeklyWorkDays" type="number" max="7" value="" required="" min="0"/>
                  <span class="help-inline"></span>
            </div>
      </div>

      <div class="control-group fieldcontain  required">
            <div class="controls">
                  <label for="annualLeave" ><g:message code="jobs.annualLeave.label" default="Annual Leave" /><span class="required-indicator">*</span></label>

                  <g:textField class="span2" name="jobs[{i}].annualLeave" id="jobs[{i}].annualLeave" type="number" max="365" value="" required="" min="0"/>
                  <span class="help-inline"></span>
            </div>
      </div>

      <div class="control-group fieldcontain  ">
            <div class="controls">
                  <label for="experience" ><g:message code="jobs.experience.label" default="Experience" /></label>

                  <g:textArea rows="3" name="jobs[{i}].experience"></g:textArea>
                  <span class="help-inline"></span>
            </div>
      </div>

      <div class="control-group fieldcontain  ">
            <div class="controls">
                  <label for="description" ><g:message code="jobs.description.label" default="Description" /></label>

                  <g:textArea rows="3" name="jobs[{i}].description"></g:textArea>
                  <span class="help-inline"></span>
            </div>
      </div>
      <%
            def facilityList=FixedValue.listAll.findAllWhere([fieldType: FieldType.FACILITY]);
            def facilityCount=facilityList.size()
            println facilityCount
            int rows=3
            int perRow=facilityCount/rows
      %>
      <div class="control-group">
      <div class="controls span3">
            <label for="" >Facility</label>
            <g:set var="count" value="${0}"/>
            <g:set var="row" value="${1}"/>
            <g:each in="${facilityList}" var="facility">
                  <g:if test="${count==perRow && row<3}">
                        <g:set var="row" value="${row+1}"/>
                        <g:set var="count" value="${0}"/>
                        </div>
                        <div class="controls span3">
                    <label for="" >&nbsp;</label>
                  </g:if>
                  <label class="checkbox">
                        <input type="checkbox" name="jobs[{i}].facility.id" value="${facility.id}"> ${facility}
                  </label>
                  <g:set var="count" value="${count+1}"/>
            </g:each>
      </div>
      </div>
</div>
