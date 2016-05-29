<%@ page import="com.ligontech.FieldType" %>
<tr id="languages${i}" data-index="${i}" class="languages-tr" <g:if test="${hidden}">style="display:none;"</g:if>>
    <td>
        <g:hiddenField name='languages[${i}].id' value='${language?.id}'/>
        <g:hiddenField name='languages[${i}].deleted' value='false'/>
        <g:hiddenField name='languages[${i}].new' value="${language?.id == null?'true':'false'}"/>
        <div class="controls-1">
            <g:select id="languages[${i}].language" name="languages[${i}].language.id" from="${languageList}" optionKey="id" value="${language?.language?.id}" class="many-to-one input-small" noSelection="['': '--Select--']"/>
            <span class="help-inline"></span>
        </div>
    </td>
    <td>
        <div class="controls-1">
            <g:select id="languages[${i}].reading" name="languages[${i}].reading.id" from="${rating}" optionKey="id" value="${language?.reading?.id}" class="many-to-one input-small" noSelection="['': '--Select--']"/>
            <span class="help-inline"></span>
        </div>
    </td>
    <td>
        <div class="controls-1">
            <g:select id="languages[${i}].writing" name="languages[${i}].writing.id" from="${rating}" optionKey="id" value="${language?.writing?.id}" class="many-to-one input-small" noSelection="['': '--Select--']"/>
            <span class="help-inline"></span>
        </div>
    </td>
    <td>
        <div class="controls-1">
            <g:select id="languages[${i}].speaking" name="languages[${i}].speaking.id" from="${rating}" optionKey="id" value="${language?.speaking?.id}" class="many-to-one input-small" noSelection="['': '--Select--']"/>
            <span class="help-inline"></span>
        </div>
    </td>
    <td>
          <a href="javascript:void(0);" class="del-languages">Delete</a>
    </td>
</tr>