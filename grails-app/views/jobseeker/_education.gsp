<%@ page import="com.ligontech.FieldType" %>
<g:set var="prevYear" value="${java.util.Calendar.getInstance().get(Calendar.YEAR)}"/>
<tr id="educations${i}" data-index="${i}" class="educations-tr" <g:if test="${hidden}">style="display:none;"</g:if>>
    <td>
        <g:hiddenField name='educations[${i}].id' value='${education?.id}'/>
        <g:hiddenField name='educations[${i}].deleted' value='false'/>
        <g:hiddenField name='educations[${i}].new' value="${education?.id == null?'true':'false'}"/>
        <div class="controls-1">
            <g:select id="educations[${i}].degree" name="educations[${i}].degree.id" from="${degree}" optionKey="id" value="${education?.degree?.id}" class="many-to-one input-small" noSelection="['': '--Select--']"/>
            <span class="help-inline"></span>
        </div>
    </td>
    <td>
        <div class="controls-1">
            <g:textField class="input-small" name="educations[${i}].nameOfDegree" id="educations[${i}].nameOfDegree" required="" value="${education?.nameOfDegree}"/>
            <span class="help-inline"></span>
        </div>
    </td>
    <td>
        <div class="controls-1">
            <g:textField class="input-small" name="educations[${i}].college_school"  id="educations[${i}].college_school" value="${education?.college_school}"/>
            <span class="help-inline"></span>
        </div>
    </td>
    <td>
        <div class="controls-1">
            <g:textField name="educations[${i}].board"  class="input-small" id="educations[${i}].board" value="${education?.board}"/>
            <span class="help-inline"></span>
        </div>
    </td>
    <td>
        <div class="controls-1">
            <g:select name="educations[${i}].graduationYear" class="input-small" id="educations[${i}].graduationYear" from="${prevYear..2004}" value="${education?.graduationYear}" noSelection="['Running':'Running']" />
            <span class="help-inline"></span>
        </div>
    </td>
    <td>
        <div class="controls-1">
            <g:textField name="educations[${i}].percent" class="input-mini" id="educations[${i}].percent" value="${education?.percent}"/>
            <span class="help-inline"></span>
        </div>
    </td>
    <td>
          <a href="javascript:void(0);" class="del-educations">Delete</a>
    </td>
</tr>