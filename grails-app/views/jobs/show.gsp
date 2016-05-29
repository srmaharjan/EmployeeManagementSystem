
<%@ page import="com.ligontech.Jobs" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'jobs.label', default: 'Jobs')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
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
				
					<g:if test="${jobsInstance?.designation}">
						<dt><g:message code="jobs.designation.label" default="Designation" /></dt>
						
							<dd><g:fieldValue bean="${jobsInstance}" field="designation"/></dd>
						
					</g:if>
				
					<g:if test="${jobsInstance?.jobCategory}">
						<dt><g:message code="jobs.jobCategory.label" default="Job Category" /></dt>
						
							<dd><g:link controller="jobCategory" action="show" id="${jobsInstance?.jobCategory?.id}">${jobsInstance?.jobCategory?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${jobsInstance?.numberOfPosition}">
						<dt><g:message code="jobs.numberOfPosition.label" default="Number Of Position" /></dt>
						
							<dd><g:fieldValue bean="${jobsInstance}" field="numberOfPosition"/></dd>
						
					</g:if>
				
					<g:if test="${jobsInstance?.basicSalary}">
						<dt><g:message code="jobs.basicSalary.label" default="Basic Salary" /></dt>
						
							<dd><g:fieldValue bean="${jobsInstance}" field="basicSalary"/></dd>
						
					</g:if>
				
					<g:if test="${jobsInstance?.salaryInNepali}">
						<dt><g:message code="jobs.salaryInNepali.label" default="Salary In Nepali" /></dt>
						
							<dd><g:fieldValue bean="${jobsInstance}" field="salaryInNepali"/></dd>
						
					</g:if>
				
					<g:if test="${jobsInstance?.qualification}">
						<dt><g:message code="jobs.qualification.label" default="Qualification" /></dt>
						
							<dd><g:fieldValue bean="${jobsInstance}" field="qualification"/></dd>
						
					</g:if>
				
					<g:if test="${jobsInstance?.experience}">
						<dt><g:message code="jobs.experience.label" default="Experience" /></dt>
						
							<dd><g:fieldValue bean="${jobsInstance}" field="experience"/></dd>
						
					</g:if>
				
					<g:if test="${jobsInstance?.ageGroup}">
						<dt><g:message code="jobs.ageGroup.label" default="Age Group" /></dt>
						
							<dd><g:link controller="fixedValue" action="show" id="${jobsInstance?.ageGroup?.id}">${jobsInstance?.ageGroup?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${jobsInstance?.dailyWorkingHour}">
						<dt><g:message code="jobs.dailyWorkingHour.label" default="Daily Working Hour" /></dt>
						
							<dd><g:fieldValue bean="${jobsInstance}" field="dailyWorkingHour"/></dd>
						
					</g:if>
				
					<g:if test="${jobsInstance?.weeklyWorkDays}">
						<dt><g:message code="jobs.weeklyWorkDays.label" default="Weekly Work Days" /></dt>
						
							<dd><g:fieldValue bean="${jobsInstance}" field="weeklyWorkDays"/></dd>
						
					</g:if>
				
					<g:if test="${jobsInstance?.annualLeave}">
						<dt><g:message code="jobs.annualLeave.label" default="Annual Leave" /></dt>
						
							<dd><g:fieldValue bean="${jobsInstance}" field="annualLeave"/></dd>
						
					</g:if>
				
					<g:if test="${jobsInstance?.expenseToProcess}">
						<dt><g:message code="jobs.expenseToProcess.label" default="Expense To Process" /></dt>
						
							<dd><g:fieldValue bean="${jobsInstance}" field="expenseToProcess"/></dd>
						
					</g:if>
				
					<g:if test="${jobsInstance?.customer}">
						<dt><g:message code="jobs.customer.label" default="Customer" /></dt>
						
							<dd><g:link controller="customer" action="show" id="${jobsInstance?.customer?.id}">${jobsInstance?.customer?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${jobsInstance?.demand}">
						<dt><g:message code="jobs.demand.label" default="Demand" /></dt>
						
							<dd><g:link controller="demand" action="show" id="${jobsInstance?.demand?.id}">${jobsInstance?.demand?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${jobsInstance?.description}">
						<dt><g:message code="jobs.description.label" default="Description" /></dt>
						
							<dd><g:fieldValue bean="${jobsInstance}" field="description"/></dd>
						
					</g:if>
				
					<g:if test="${jobsInstance?.facility}">
						<dt><g:message code="jobs.facility.label" default="Facility" /></dt>
						
							<g:each in="${jobsInstance.facility}" var="f">
							<dd><g:link controller="fixedValue" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				
					<g:if test="${jobsInstance?.gender}">
						<dt><g:message code="jobs.gender.label" default="Gender" /></dt>
						
							<dd><g:link controller="fixedValue" action="show" id="${jobsInstance?.gender?.id}">${jobsInstance?.gender?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${jobsInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${jobsInstance?.id}">
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

		</div>
	</body>
</html>
