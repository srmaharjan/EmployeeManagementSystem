<%@ page import="com.ligontech.FieldType; com.ligontech.AcedemicEducation" %>
<g:set var="prevYear" value="${java.util.Calendar.getInstance().get(Calendar.YEAR)}"/>
<g:set var="yearList" value=""/>
<div class="modal hide fade" id="educations_modal">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4>Education</h4>
    </div>
    <div class="modal-body">
        <form id="educations_form" class="form-horizontal">
        </form>
        <div id="educations_form_container" class="hide">
            <g:hiddenField name="educations[{i}].id" id="educations[{i}].id"/>
            <div class="control-group fieldcontain  required">
                <label for="educations[{i}].degree" class="control-label">
                    <g:message code="educations[{i}].degree.label" default="Degree" />
                    <span class="required-indicator">*</span>
                </label>
                <div class="controls">
                    <g:select id="educations[{i}].degree" name="educations[{i}].degree.id" from="${com.ligontech.FixedValue.findAllByFieldType(FieldType.DEGREE)}" optionKey="id" value="" class="many-to-one" noSelection="['': '--Select--']"/>
                    <span class="help-inline"></span>
                </div>
            </div>
            <div class="control-group fieldcontain required">
                <label for="educations[{i}].nameOfDegree" class="control-label">
                    <g:message code="educations[{i}].nameOfDegree.label" default="Name Of Degree" /><span class="required-indicator">*</span>
                </label>
                <div class="controls">
                    <g:textField name="educations[{i}].nameOfDegree" id="educations[{i}].nameOfDegree" required="" value=""/>
                    <span class="help-inline"></span>
                </div>
            </div>

            <div class="control-group fieldcontain">
                <label for="educations[{i}].college_school" class="control-label"><g:message code="educations[{i}].college_school.label" default="College/School" /></label>
                <div class="controls">
                    <g:textField name="educations[{i}].college_school" value=""/>
                    <span class="help-inline"></span>
                </div>
            </div>

            <div class="control-group fieldcontain ">
                <label for="educations[{i}].board" class="control-label"><g:message code="educations[{i}].board.label" default="Board" /></label>
                <div class="controls">
                    <g:textField name="educations[{i}].board" value=""/>
                    <span class="help-inline"></span>
                </div>
            </div>

            <div class="control-group fieldcontain">
                <label for="educations[{i}].graduationYear" class="control-label"><g:message code="educations[{i}].graduationYear.label" default="Graduation Year" /></label>
                <div class="controls">
                    <g:select name="educations[{i}].graduationYear" id="educations[{i}].graduationYear" from="${prevYear..2004}" noSelection="['Running':'Running']" />
                    <span class="help-inline"></span>
                </div>
            </div>

            <div class="control-group fieldcontain">
                <label for="educations[{i}].percent" class="control-label"><g:message code="educations[{i}].percent.label" default="Percent" /></label>
                <div class="controls">
                    <g:textField name="educations[{i}].percent" value=""/>
                    <span class="help-inline"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" data-dismiss="modal" class="btn">Close</button>
        <button type="button" class="btn btn-primary" id="educations_reset">Reset</button>
        <button type="button" class="btn btn-primary" id="educations_save">Save</button>
        <button type="button" class="btn btn-primary" id="educations_update">Update</button>
    </div>
</div>
<script>
    $(document).ready(function() {
        $('#educations_modal').on('hidden', function() {
            $('#educations_modal #educations_update').removeClass('hide');
            $('#educations_modal #educations_save').removeClass('hide');
            $('#educations_modal form').html('');
        });
    });
</script>
