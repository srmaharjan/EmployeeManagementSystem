<%@ page import="com.ligontech.admin.ModuleDashBoard" %>
<div class="control-group fieldcontain ${hasErrors(bean: moduleDashBoardInstance, field: 'moduleAction', 'error')} required">
      <label for="moduleAction" class="control-label"><g:message code="moduleDashBoard.moduleAction.label" default="Module Action" /><span class="required-indicator">*</span></label>
      <div class="controls">

            <g:textField name="moduleAction" required="" value="${moduleDashBoardInstance?.moduleAction}" class="large"/>
            <span class="help-inline">${hasErrors(bean: moduleDashBoardInstance, field: 'moduleAction', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: moduleDashBoardInstance, field: 'moduleController', 'error')} required">
      <label for="moduleController" class="control-label"><g:message code="moduleDashBoard.moduleController.label" default="Module Controller" /><span class="required-indicator">*</span></label>
      <div class="controls">
            <g:select id="moduleController" name="moduleController" from="${grailsApplication.controllerClasses.sort { it.fullName }}" optionValue="naturalName" optionKey="logicalPropertyName"  value="${moduleDashBoardInstance?.moduleController}" class="many-to-one typeahead medium" data-provide="typeahead"/>
            <span class="help-inline">${hasErrors(bean: moduleDashBoardInstance, field: 'moduleController', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: moduleDashBoardInstance, field: 'displayName', 'error')} required">
      <label for="displayName" class="control-label"><g:message code="moduleDashBoard.displayName.label" default="Display Name" /><span class="required-indicator">*</span></label>
      <div class="controls">
            <g:textField name="displayName" required="" value="${moduleDashBoardInstance?.displayName}" class="large"/>
            <span class="help-inline">${hasErrors(bean: moduleDashBoardInstance, field: 'displayName', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: moduleDashBoardInstance, field: 'image', 'error')} ">
      <label for="image" class="control-label"><g:message code="moduleDashBoard.image.label" default="Image Name" /></label>
      <div class="controls">
            <g:textField name="image" value="${moduleDashBoardInstance?.image}" class="large"/>
            <span class="help-inline">${hasErrors(bean: moduleDashBoardInstance, field: 'image', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: moduleDashBoardInstance, field: 'parent', 'error')} ">
      <label for="parent" class="control-label"><g:message code="moduleDashBoard.parent.label" default="Parent" /></label>
      <div class="controls">
            <select id='parent' name="parent.id" class="medium">
                  <g:each var="parent" in="${parentModule}">
                        <option value="${parent.id}" id="parent_${parent.id}">${parent}</option>
                  </g:each>
            </select>
            <span class="help-inline">${hasErrors(bean: moduleDashBoardInstance, field: 'parent', 'error')}</span>
      </div>
</div>
<script type="text/javascript">
      $(document).on('change','#parent',function(){
            var selected=$(this).val();
            $('#subParent').val('');
            $('#subParent').find(':not(.child_'+selected+')').hide();
            $('#subParent').find('.child_'+selected+',.child_').show();
      });
</script>
<div class="control-group fieldcontain ${hasErrors(bean: moduleDashBoardInstance, field: 'subParent', 'error')} ">
      <label for="subParent" class="control-label"><g:message code="moduleDashBoard.subParent.label" default="Sub Parent" /></label>
      <div class="controls">
            <select id='subParent' name="subParent.id" class="medium">
                  <option value="" class="child_">--</option>
                  <g:each var="subParent" in="${subParentModule}">
                        <option value="${subParent.id}" class="child_${subParent.parent.id}" style="display: none">${subParent}</option>
                  </g:each>
            </select>
            <span class="help-inline">${hasErrors(bean: moduleDashBoardInstance, field: 'subParent', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: moduleDashBoardInstance, field: 'displayOrder', 'error')} ">
      <label for="displayOrder" class="control-label"><g:message code="moduleDashBoard.displayOrder.label" default="Display Order" /></label>
      <div class="controls">
            <g:textField name="displayOrder" type="number" value="${moduleDashBoardInstance.displayOrder}" class="small"/>
            <span class="help-inline">${hasErrors(bean: moduleDashBoardInstance, field: 'displayOrder', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ">
      <div class="controls">
            <label class="checkbox">
                  <input type="checkbox"  name="isHidden"
                         <g:if test="${moduleDashBoardInstance.isHidden}"> checked="checked" </g:if>>Hide From Menu
            </label>
      </div>
</div>

