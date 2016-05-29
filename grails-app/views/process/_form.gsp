<%@ page import="com.ligontech.Process" %>
<%
      def colorList=["#ffffff","#ffccc9","#ffce93","#fffc9e","#ffffc7","#9aff99","#96fffb","#cdffff","#cbcefb","#cfcfcf","#fd6864","#fe996b","#fffe65","#fcff2f","#67fd9a","#38fff8","#68fdff","#9698ed","#c0c0c0","#fe0000","#f8a102","#ffcc67","#f8ff00","#34ff34","#68cbd0","#34cdf9","#6665cd","#9b9b9b","#cb0000","#f56b00","#ffcb2f","#ffc702","#32cb00","#00d2cb","#3166ff","#6434fc","#656565","#9a0000","#ce6301","#cd9934","#999903","#009901","#329a9d","#3531ff","#6200c9","#343434","#680100","#963400","#986536","#646809","#036400","#34696d","#00009b","#303498","#000000","#330001","#643403","#663234","#343300","#013300","#003532","#010066","#340096"];
%>
<div class="control-group fieldcontain ${hasErrors(bean: processInstance, field: 'code', 'error')} required">
      <label for="code" class="control-label"><g:message code="process.code.label" default="Code" /><span class="required-indicator">*</span></label>
      <div class="controls">
            <g:textField name="code" required="" value="${processInstance?.code}"/>
            <span class="help-inline">${hasErrors(bean: processInstance, field: 'code', 'error')}</span>
      </div>
</div>
<div class="control-group fieldcontain ${hasErrors(bean: processInstance, field: 'description', 'error')} required">
      <label for="description" class="control-label"><g:message code="process.description.label" default="Description" /><span class="required-indicator">*</span></label>
      <div class="controls">
            <g:textField name="description" required="" value="${processInstance?.description}"/>
            <span class="help-inline">${hasErrors(bean: processInstance, field: 'description', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: processInstance, field: 'country', 'error')} ">
      <label for="country" class="control-label"><g:message code="process.country.label" default="Country" /></label>
      <div class="controls">
            <g:select id="country" name="country.id" from="${com.ligontech.Country.listAll.list()}" optionKey="id"  value="${processInstance?.country?.id}" class="many-to-one typeahead" data-provide="typeahead" noSelection="['':'']"/>
            <span class="help-inline">${hasErrors(bean: processInstance, field: 'country', 'error')}</span>
      </div>
</div>


<div class="control-group fieldcontain ${hasErrors(bean: processInstance, field: 'colorCode', 'error')} required">
      <label for="colorCode" class="control-label"><g:message code="process.colorCode.label" default="Color Code" />
            <span class="required-indicator">*</span></label>
      <div class="controls">
            <g:select name="colorCode" from="${colorList}" required="" value="${processInstance?.colorCode}"/>
            <span class="help-inline">${hasErrors(bean: processInstance, field: 'colorCode', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ">
      <div class="controls">
            <label class="checkbox">
                  <input type="checkbox"  name="includeInProcess"
                        <g:if test="${processInstance?.includeInProcess}"> checked="checked" </g:if>>Process Include
            </label>
      </div>
</div>
<div class="control-group fieldcontain ">
      <div class="controls">
            <label class="checkbox">
                  <input type="checkbox"  name="canApplyOtherJob"
                        <g:if test="${processInstance?.canApplyOtherJob}"> checked="checked" </g:if>>Can Apply Other Job
            </label>
      </div>
</div>
<div class="control-group fieldcontain ">
      <div class="controls">
            <label class="checkbox">
                  <input type="checkbox"  name="isFirstStep"
                        <g:if test="${processInstance?.isFirstStep}"> checked="checked" </g:if>>Is First Process
            </label>
      </div>
</div>
<script type="text/javascript">
      jQuery('#colorCode').colourPicker({
            ico:   "${resource(dir: "/js/colorpick",file: "jquery.colourPicker.gif")}",
            title:    false
      });
</script>
