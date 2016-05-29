<%@ page import="com.ligontech.Training" %>



			<div class="control-group fieldcontain ${hasErrors(bean: trainingInstance, field: 'topic', 'error')} required">
				<label for="topic" class="control-label">
                    <g:message code="training.topic.label" default="Topic" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="topic" required="" value="${trainingInstance?.topic}"/>
					<span class="help-inline">${hasErrors(bean: trainingInstance, field: 'topic', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: trainingInstance, field: 'trainingObjective', 'error')} required">
				<label for="trainingObjective" class="control-label"><g:message code="training.trainingObjective.label" default="Training Objective" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="trainingObjective" required="" value="${trainingInstance?.trainingObjective}"/>
					<span class="help-inline">${hasErrors(bean: trainingInstance, field: 'trainingObjective', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: trainingInstance, field: 'duration', 'error')} required">
				<label for="duration" class="control-label"><g:message code="training.duration.label" default="Duration" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="duration" required="" value="${trainingInstance?.duration}"/>
					<span class="help-inline">${hasErrors(bean: trainingInstance, field: 'duration', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: trainingInstance, field: 'isDeleted', 'error')} ">
				<label for="isDeleted" class="control-label"><g:message code="training.isDeleted.label" default="Is Deleted" /></label>
				<div class="controls">
					<g:textField name="isDeleted" value="${trainingInstance?.isDeleted}"/>
					<span class="help-inline">${hasErrors(bean: trainingInstance, field: 'isDeleted', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: trainingInstance, field: 'jobseeker', 'error')} ">
				<label for="jobseeker" class="control-label"><g:message code="training.jobseeker.label" default="Jobseeker" /></label>
				<div class="controls">
					<g:select id="jobseeker" name="jobseeker.id" from="${com.ligontech.Jobseeker.list()}" optionKey="id" value="${trainingInstance?.jobseeker?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: trainingInstance, field: 'jobseeker', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: trainingInstance, field: 'trainingCenter', 'error')} ">
				<label for="trainingCenter" class="control-label"><g:message code="training.trainingCenter.label" default="Training Center" /></label>
				<div class="controls">
					<g:textField name="trainingCenter" value="${trainingInstance?.trainingCenter}"/>
					<span class="help-inline">${hasErrors(bean: trainingInstance, field: 'trainingCenter', 'error')}</span>
				</div>
			</div>

