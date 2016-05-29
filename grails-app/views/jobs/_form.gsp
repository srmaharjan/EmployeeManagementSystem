<%@ page import="com.ligontech.Jobs" %>



<div class="control-group fieldcontain ${hasErrors(bean: jobsInstance, field: 'designation', 'error')} required">
      <label for="designation" class="control-label"><g:message code="jobs.designation.label" default="Designation" /><span class="required-indicator">*</span></label>
      <div class="controls">
            <g:textField name="designation" required="" value="${jobsInstance?.designation}"/>
            <span class="help-inline">${hasErrors(bean: jobsInstance, field: 'designation', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: jobsInstance, field: 'jobCategory', 'error')} required">
      <label for="jobCategory" class="control-label"><g:message code="jobs.jobCategory.label" default="Job Category" /><span class="required-indicator">*</span></label>
      <div class="controls">
            <g:select id="jobCategory" name="jobCategory.id" from="${jobCategories}" optionKey="id" required="" value="${jobsInstance?.jobCategory?.id}" class="many-to-one"/>
            <span class="help-inline">${hasErrors(bean: jobsInstance, field: 'jobCategory', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: jobsInstance, field: 'numberOfPosition', 'error')} required">
      <label for="numberOfPosition" class="control-label"><g:message code="jobs.numberOfPosition.label" default="Number Of Position" /><span class="required-indicator">*</span></label>
      <div class="controls">
            <g:field name="numberOfPosition" type="number" min="1" value="${jobsInstance?.numberOfPosition}" required=""/>
            <span class="help-inline">${hasErrors(bean: jobsInstance, field: 'numberOfPosition', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: jobsInstance, field: 'basicSalary', 'error')} required">
      <label for="basicSalary" class="control-label"><g:message code="jobs.basicSalary.label" default="Basic Salary" /><span class="required-indicator">*</span></label>
      <div class="controls">
            <g:textField name="basicSalary" required="" value="${jobsInstance?.basicSalary}"/>
            <span class="help-inline">${hasErrors(bean: jobsInstance, field: 'basicSalary', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: jobsInstance, field: 'salaryInNepali', 'error')} ">
      <label for="salaryInNepali" class="control-label"><g:message code="jobs.salaryInNepali.label" default="Salary In Nepali" /></label>
      <div class="controls">
            <g:field name="salaryInNepali" type="number" min="1" value="${jobsInstance?.salaryInNepali}"/>
            <span class="help-inline">${hasErrors(bean: jobsInstance, field: 'salaryInNepali', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: jobsInstance, field: 'qualification', 'error')} ">
      <label for="qualification" class="control-label"><g:message code="jobs.qualification.label" default="Qualification" /></label>
      <div class="controls">
            <g:textField name="qualification" value="${jobsInstance?.qualification}"/>
            <span class="help-inline">${hasErrors(bean: jobsInstance, field: 'qualification', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: jobsInstance, field: 'experience', 'error')} ">
      <label for="experience" class="control-label"><g:message code="jobs.experience.label" default="Experience" /></label>
      <div class="controls">
            <g:textField name="experience" value="${jobsInstance?.experience}"/>
            <span class="help-inline">${hasErrors(bean: jobsInstance, field: 'experience', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: jobsInstance, field: 'ageGroup', 'error')} ">
      <label for="ageGroup" class="control-label"><g:message code="jobs.ageGroup.label" default="Age Group" /></label>
      <div class="controls">
            <g:select id="ageGroup" name="ageGroup.id" from="${ageGroups}" optionKey="id" value="${jobsInstance?.ageGroup?.id}" class="many-to-one" noSelection="['null': '']"/>
            <span class="help-inline">${hasErrors(bean: jobsInstance, field: 'ageGroup', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: jobsInstance, field: 'dailyWorkingHour', 'error')} required">
      <label for="dailyWorkingHour" class="control-label"><g:message code="jobs.dailyWorkingHour.label" default="Daily Working Hour" /><span class="required-indicator">*</span></label>
      <div class="controls">
            <g:field name="dailyWorkingHour" type="number" max="24" value="${jobsInstance?.dailyWorkingHour}" required=""/>
            <span class="help-inline">${hasErrors(bean: jobsInstance, field: 'dailyWorkingHour', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: jobsInstance, field: 'weeklyWorkDays', 'error')} required">
      <label for="weeklyWorkDays" class="control-label"><g:message code="jobs.weeklyWorkDays.label" default="Weekly Work Days" /><span class="required-indicator">*</span></label>
      <div class="controls">
            <g:field name="weeklyWorkDays" type="number" max="7" value="${jobsInstance?.weeklyWorkDays}" required=""/>
            <span class="help-inline">${hasErrors(bean: jobsInstance, field: 'weeklyWorkDays', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: jobsInstance, field: 'annualLeave', 'error')} required">
      <label for="annualLeave" class="control-label"><g:message code="jobs.annualLeave.label" default="Annual Leave" /><span class="required-indicator">*</span></label>
      <div class="controls">
            <g:field name="annualLeave" type="number" max="365" value="${jobsInstance?.annualLeave}" required=""/>
            <span class="help-inline">${hasErrors(bean: jobsInstance, field: 'annualLeave', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: jobsInstance, field: 'expenseToProcess', 'error')} ">
      <label for="expenseToProcess" class="control-label"><g:message code="jobs.expenseToProcess.label" default="Expense To Process" /></label>
      <div class="controls">
            <g:field name="expenseToProcess" type="number" min="1" value="${jobsInstance?.expenseToProcess}"/>
            <span class="help-inline">${hasErrors(bean: jobsInstance, field: 'expenseToProcess', 'error')}</span>
      </div>
</div>

      <div class="control-group fieldcontain ${hasErrors(bean: jobsInstance, field: 'demand', 'error')} ">
            <label for="demand" class="control-label"><g:message code="jobs.demand.label" default="Demand" /></label>
            <div class="controls">
                  <g:select id="demand" name="demand.id" from="${demands}" optionKey="id" value="${jobsInstance?.demand?.id}" class="many-to-one" noSelection="['null': '']"/>
                  <span class="help-inline">${hasErrors(bean: jobsInstance, field: 'demand', 'error')}</span>
            </div>
      </div>

<div class="control-group fieldcontain ${hasErrors(bean: jobsInstance, field: 'description', 'error')} ">
      <label for="description" class="control-label"><g:message code="jobs.description.label" default="Description" /></label>
      <div class="controls">
            <g:textField name="description" value="${jobsInstance?.description}"/>
            <span class="help-inline">${hasErrors(bean: jobsInstance, field: 'description', 'error')}</span>
      </div>
</div>



<div class="control-group fieldcontain ${hasErrors(bean: jobsInstance, field: 'gender', 'error')} ">
      <label for="gender"  class="control-label" ><g:message code="jobs.gender.label" default="Gender" /><span class="required-indicator">*</span></label>

      <g:set var="allGender" value="${genders}"/>
      <div class="controls">
            <label class="radio inline">
                  <input type="radio" name="gender.id" checked="checked" value="" id="" > Any </label>
            <g:radioGroup name="gender.id" id="gender.id"
                          labels="${allGender.value}"
                          values="${allGender.id}" value="${jobsInstance?.gender?.id}">
                  <label class="radio inline"> ${it.radio} ${it.label} </label>
            </g:radioGroup>
            <span class="help-inline">${hasErrors(bean: jobsInstance, field: 'gender', 'error')}</span>
      </div>
</div>
<div class="control-group fieldcontain ${hasErrors(bean: jobsInstance, field: 'facility', 'error')} ">
      <label for="facility" class="control-label"><g:message code="jobs.facility.label" default="Facility" /></label>
      <div class="controls">
            <g:select name="facility" id="facility" from="${facilities}" multiple="multiple" optionKey="id" size="5" value="${jobsInstance?.facility*.id}" class="many-to-many"/>
            <span class="help-inline">${hasErrors(bean: jobsInstance, field: 'facility', 'error')}</span>
      </div>
</div>
<script type="text/javascript">
      $(document).ready(function(){
            $('#facility').multiSelect({
                  uniqueKey: "facility",
                  title:'Facility'
            });
      });
</script>
%{--<%--}%
%{--def facilityCount=facilities.size()--}%
%{--int rows=3--}%
%{--int perRow=facilityCount/rows--}%
%{--%>--}%
%{--<div class="control-group fieldcontain ${hasErrors(bean: jobsInstance, field: 'facility', 'error')} ">--}%
%{--<label for="facility" class="control-label"><g:message code="jobs.facility.label" default="Facility" /></label>--}%
%{--<div class="controls">--}%
%{--<g:set var="count" value="${0}"></g:set>--}%
%{--<g:set var="row" value="${1}"></g:set>--}%
%{--<g:each in="${facilities}" var="facility">--}%
%{--<g:if test="${count==perRow && row<3}">--}%
%{--<g:set var="row" value="${row+1}"></g:set>--}%
%{--<g:set var="count" value="${0}"></g:set>--}%
%{--</div>--}%
%{--<div class="controls span3">--}%
%{--<label for="" >&nbsp;</label>--}%
%{--</g:if>--}%
%{--<label class="checkbox">--}%
%{--<input type="checkbox" name="facility.id" value="${facility.id}"> ${facility}--}%
%{--</label>--}%
%{--<g:set var="count" value="${count+1}"></g:set>--}%
%{--</g:each>--}%
%{--</div>--}%
%{--</div>--}%

