<%@ page import="com.ligontech.admin.ModuleDashBoard; com.ligontech.usermanagement.Role; com.ligontech.usermanagement.User" %>

<div class="control-group ${hasErrors(bean: userInstance, field: 'firstName', 'error')} required">
      <label class="control-label" for="firstName">
            <g:message code="user.firstName.label" default="First Name" />
            <span class="required-indicator">*</span>
      </label><div class="controls">
      <g:textField name="firstName" required="" value="${userInstance?.firstName}"/>
</div></div>
<div class="control-group ${hasErrors(bean: userInstance, field: 'middleName', 'error')}">
      <label class="control-label" for="middleName">
            <g:message code="user.middleName.label" default="Middle Name" />
      </label><div class="controls">
      <g:textField name="middleName" value="${userInstance?.middleName}"/>
</div></div>
<div class="control-group ${hasErrors(bean: userInstance, field: 'lastName', 'error')} required">
      <label class="control-label" for="lastName">
            <g:message code="user.lastName.label" default="Last Name" />
            <span class="required-indicator">*</span>
      </label><div class="controls">
      <g:textField name="lastName" required="" value="${userInstance?.lastName}"/>
</div></div>
<div class="control-group ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
      <label class="control-label" for="lastName">
            <g:message code="user.email.label" default="Email" />
            <span class="required-indicator">*</span>
      </label><div class="controls">
      <g:textField name="email" required="" value="${userInstance?.email}"/>
</div></div>

<div class="control-group ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
      <label class="control-label" for="username">
            <g:message code="user.username.label" default="Username" />
            <span class="required-indicator">*</span>
      </label><div class="controls">
      <g:textField name="username" required="" value="${userInstance?.username}"/>
</div></div>
<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
      <label for="password" class="control-label"><g:message code="user.password.label" default="Password" /></label>
      <div class="controls">
            <g:textField name="password" value="${userInstance?.password}"/>
            <span class="help-inline">${hasErrors(bean: userInstance, field: 'password', 'error')}</span>
      </div>
</div>
%{--<div class="control-group ${hasErrors(bean: userInstance, field: 'password', 'error')} required">--}%
%{--<label class="control-label" for="password">--}%
%{--<g:message code="user.password.label" default="Password" />--}%
%{--<span class="required-indicator">*</span>--}%
%{--</label><div class="controls">--}%
%{--<g:textField name="password" required="" value="${userInstance?.password}"/>--}%
%{--</div></div>--}%

<div class="control-group ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
      <label class="control-label" for="enabled">
            <g:message code="user.enabled.label" default="Enabled" />
      </label><div class="controls">
      <input type="checkbox" name="enabled"  ${(userInstance?.enabled)?'checked':''} />
</div></div>
<sec:access expression="hasRole('SUPERMAN')">
      <div class="control-group  required">
            <label class="control-label" for="userRole">
                  User Role
                  <span class="required-indicator">*</span>
            </label><div class="controls">
      %{--<g:each in="${DssRole.findAll()}" var="dssRole">--}%
      %{--<g:radio name="gender" value="${dssRole.id}" checked="${roleId==dssRole.id}"/>${dssRole}--}%
      %{--</g:each>--}%
            <g:set var="dssRoles" value="${Role.findAll()}"/>
            <g:set var="selectedRole" value="${userInstance?.getAuthorities()?userInstance?.getAuthorities()*.id?.get(0):dssRoles.find {it.authority=='ROLE_USER'}?.id}"/>
            <g:radioGroup name="role" id="userRole"
                          labels="${dssRoles.authority}"
                          values="${dssRoles.id}" value="${selectedRole}">
                  <label class="radio inline"> ${it.radio} ${it.label} </label>
            </g:radioGroup>
      </div></div>
      <div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'userCustomerCode', 'error')} ">
            <label for="userCustomerCode" class="control-label"><g:message code="user.userCustomerCode.label" default="Customer" /></label>
            <div class="controls">
                  <g:select id="userCustomerCode" name="userCustomerCode" from="${com.ligontech.usermanagement.Customer.listAll.list()}" optionKey="id" required="" value="${userInstance?.userCustomerCode}" class="many-to-one"/>
                  <span class="help-inline">${hasErrors(bean: userInstance, field: 'userCustomerCode', 'error')}</span>
            </div>
      </div>
</sec:access>
<div class="control-group" id="permission_checkbox">
      <div class="controls">
            <ul>
                  <g:each in="${permissions}" var="parent">

                        <li>
                              <label>
                                    <input type="checkbox" name="permissions" id="${parent.key.replaceAll(':','_')}" class="parent_permission" value="${parent.key}" ${(userPermissions.contains(parent.key) || userPermissions.contains('*:*'))?'checked':''}/>${displayMap.getAt(parent.key)}

                              </label>
                              <ul>
                                    <g:each in="${parent.value}" var="child">
                                          <li>
                                                <label>
                                                      <input type="checkbox" name="permissions" value="${child}" id="${child.replaceAll(':','_')}" class="${parent.key.replaceAll(':','_')} child_permission" ${(userPermissions.contains(child) || userPermissions.contains('*:*'))?'checked':''}/>${displayMap.getAt(child)}
                                                </label>
                                          </li>
                                    </g:each>
                              </ul>
                        </li>

                  </g:each>
            </ul>
      </div>
</div>
<script>
      $(document).ready(function(){
            $('#permission_checkbox').on('change','.child_permission',function(){
                  var parentId=$(this).prop('class').split(' ')[0];
                  if($(this).prop( "checked")){
                        $('#'+parentId).prop('checked',true);
                  }else{
                        var status = $(this).closest('ul').find('input.child_permission').filter(':checked').length === 0;
                        $('#'+parentId).prop('checked',!status);
                  }
            });
            $('#permission_checkbox').on('change','.parent_permission',function(){
                  if($(this).prop( "checked")){
                        $('.'+$(this).prop('id')).prop('checked',true);
                  }else{
                        $('.'+$(this).prop('id')).prop('checked',false);
                  }
            });
      })
</script>