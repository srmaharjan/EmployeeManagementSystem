<%@ page import="com.ligontech.FieldType" %>
<tr id="trainings${i}" class="trainings-tr" <g:if test="${hidden}">style="display:none;"</g:if>>
    <td>
        <g:hiddenField name='trainings[${i}].id' value='${training?.id}'/>
        <g:hiddenField name='trainings[${i}].deleted' value='false'/>
        <g:hiddenField name='trainings[${i}].new' value="${training?.id == null?'true':'false'}"/>
        <div class="controls-1">
            <g:textField name="trainings[${i}].topic" class='input-small' required="" value="${training?.topic}"/>
            <span class="help-inline"></span>
        </div>
    </td>
    <td>
        <div class="controls-1">
            <g:textField class="input-small" name="trainings[${i}].trainingObjective" id="trainings[${i}].trainingObjective" required="" value="${training?.trainingObjective}"/>
            <span class="help-inline"></span>
        </div>
    </td>
    <td>
        <div class="controls-1">
            <g:textField class="input-small" name="trainings[${i}].duration"  id="trainings[${i}].duration" value="${training?.duration}"/>
            <span class="help-inline"></span>
        </div>
    </td>
    <td>
        <div class="controls-1">
            <g:textField name="trainings[${i}].trainingCenter"  class="input-small" id="trainings[${i}].trainingCenter" value="${training?.trainingCenter}"/>
            <span class="help-inline"></span>
        </div>
    </td>
    <td>
          <a href="javascript:void(0);" class="del-trainings">Delete</a>
    </td>
</tr>