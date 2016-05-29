<%@ page import="com.ligontech.FieldType; com.ligontech.AcedemicEducation" %>
<g:set var="prevYear" value="${java.util.Calendar.getInstance().get(Calendar.YEAR)}"/>
<g:set var="yearList" value=""/>
<div class="modal hide fade" id="education_modal">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4>Education</h4>
    </div>
    <div class="modal-body">
        <div class="control-group fieldcontain  required">
            <label for="education[{i}].degree" class="control-label">
                <g:message code="education[{i}].degree.label" default="Degree" />
                <span class="required-indicator">*</span>
            </label>
            <div class="controls">
                <g:select id="education[{i}].degree" name="education[{i}].degree.id" from="${com.ligontech.FixedValue.findAllByFieldType(FieldType.DEGREE)}" optionKey="id" value="" class="many-to-one" noSelection="['': '--Select--']"/>
                <span class="help-inline"></span>
            </div>
        </div>
        <div class="control-group fieldcontain required">
            <label for="education[{i}].nameOfDegree" class="control-label">
                <g:message code="education[{i}].nameOfDegree.label" default="Name Of Degree" /><span class="required-indicator">*</span>
            </label>
            <div class="controls">
                <g:textField name="education[{i}].nameOfDegree" id="education[{i}].nameOfDegree" required="" value=""/>
                <span class="help-inline"></span>
            </div>
        </div>

        <div class="control-group fieldcontain">
            <label for="education[{i}].college_school" class="control-label"><g:message code="education[{i}].college_school.label" default="College/School" /></label>
            <div class="controls">
                <g:textField name="education[{i}].college_school" value=""/>
                <span class="help-inline"></span>
            </div>
        </div>

        <div class="control-group fieldcontain ">
            <label for="education[{i}].board" class="control-label"><g:message code="education[{i}].board.label" default="Board" /></label>
            <div class="controls">
                <g:textField name="education[{i}].board" value=""/>
                <span class="help-inline"></span>
            </div>
        </div>

        <div class="control-group fieldcontain">
            <label for="education[{i}].graduationYear" class="control-label"><g:message code="education[{i}].graduationYear.label" default="Graduation Year" /></label>
            <div class="controls">
                <g:select name="education[{i}].graduationYear" id="education[{i}].graduationYear" from="${prevYear..2004}" noSelection="['Running':'Running']" />
                <span class="help-inline"></span>
            </div>
        </div>

        <div class="control-group fieldcontain">
            <label for="education[{i}].percent" class="control-label"><g:message code="education[{i}].percent.label" default="Percent" /></label>
            <div class="controls">
                <g:textField name="education[{i}].percent" value=""/>
                <span class="help-inline"></span>
            </div>
        </div>
    </div>

    <div class="modal-footer">
        <button type="button" data-dismiss="modal" class="btn">Close</button>
        <button type="button" class="btn btn-primary" id="education_reset">Reset</button>
        <button type="button" class="btn btn-primary" id="education_save">Save</button>
        <button type="button" class="btn btn-primary" id="education_update">Update</button>
    </div>
</div>
