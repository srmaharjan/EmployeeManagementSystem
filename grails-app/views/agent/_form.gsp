<%@ page import="com.ligontech.Agent" %>



<div class="control-group fieldcontain ${hasErrors(bean: agentInstance, field: 'name', 'error')} required">
      <label for="name" class="control-label"><g:message code="agent.name.label" default="Name" /><span class="required-indicator">*</span></label>
      <div class="controls">
            <g:textField name="name" required="" value="${agentInstance?.name}"/>
            <span class="help-inline">${hasErrors(bean: agentInstance, field: 'name', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: agentInstance, field: 'phoneNo', 'error')} required">
      <label for="phoneNo" class="control-label"><g:message code="agent.phoneNo.label" default="Phone No" />
            <span class="required-indicator">*</span></label>
      <div class="controls">
            <g:textField name="phoneNo" required="" value="${agentInstance?.phoneNo}"/>
            <span class="help-inline">${hasErrors(bean: agentInstance, field: 'phoneNo', 'error')}</span>
      </div>
</div>


%{--<div class="fileupload fileupload-new" data-provides="fileupload">--}%
%{--<div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">--}%
%{--<img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&text=no+image" /></div>--}%
%{--<div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>--}%
%{--<div>--}%
%{--<span class="btn btn-file"><span class="fileupload-new">Select image</span><span class="fileupload-exists">Change</span><input type="file" /></span>--}%
%{--<a href="#" class="btn fileupload-exists" data-dismiss="fileupload">Remove</a>--}%
%{--</div>--}%
%{--</div>--}%


<div class="control-group fieldcontain ${hasErrors(bean: agentInstance, field: 'email', 'error')} ">
      <label for="email" class="control-label"><g:message code="agent.email.label" default="Email" /></label>
      <div class="controls">
            <g:field type="email" name="email" value="${agentInstance?.email}"/>
            <span class="help-inline">${hasErrors(bean: agentInstance, field: 'email', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: agentInstance, field: 'website', 'error')} ">
      <label for="website" class="control-label"><g:message code="agent.website.label" default="Website" /></label>
      <div class="controls">
            <g:field type="url" name="website" value="${agentInstance?.website}"/>
            <span class="help-inline">${hasErrors(bean: agentInstance, field: 'website', 'error')}</span>
      </div>
</div>
<div class="control-group fieldcontain ${hasErrors(bean: agentInstance, field: 'photo', 'error')} ">
      <label for="photo_file" class="control-label"><g:message code="agent.photo.label" default="Photo" /></label>
      <div class="controls">
            <g:field type="file" name="photo_file" value="${agentInstance?.photo}"/>
            <span class="help-inline">${hasErrors(bean: agentInstance, field: 'photo', 'error')}</span>
      </div>
</div>
%{--<div class="control-group fieldcontain ${hasErrors(bean: agentInstance, field: 'photo', 'error')} required">--}%
%{--<label for="photo_file" class="control-label"><g:message code="agent.photo.label" default="Photo" />--}%
%{--<span class="required-indicator">*</span></label>--}%
%{--<div class="controls">--}%
%{--<div class="fileupload fileupload-new" data-provides="fileupload">--}%
%{--<div class="fileupload-new thumbnail" style="width: 50px; height: 50px;">--}%
%{--<img src="${resource(dir: 'images',file: '_blank.gif')}" /></div>--}%
%{--<div class="fileupload-preview fileupload-exists thumbnail" style="width: 50px; height: 50px;"></div>--}%
%{--<span class="btn btn-file"><span class="fileupload-new">Select image</span><span class="fileupload-exists">Change</span><input type="file" /></span>--}%
%{--<a href="#" class="btn" data-toggle="modal" data-target="#webcam">Webcam</a>--}%
%{--<a href="#" class="btn fileupload-exists" data-dismiss="fileupload">Remove</a>--}%
%{--</div>--}%
%{--<span class="help-inline">${hasErrors(bean: agentInstance, field: 'photo', 'error')}</span>--}%
%{--</div>--}%
%{--</div>--}%
<g:if test="${isEdit}">
      <div class="control-group fieldcontain ">
            <div class="controls">
                  <label class="checkbox">
                        <input type="checkbox"  name="remove_image">Remove Photo
                  </label>
            </div>
      </div>
</g:if>
<div class="control-group fieldcontain ${hasErrors(bean: agentInstance, field: 'otherDescription', 'error')} ">
      <label for="otherDescription" class="control-label"><g:message code="agent.otherDescription.label" default="Other Description" /></label>
      <div class="controls">
            <g:textArea rows="3" name="otherDescription">${agentInstance?.otherDescription}</g:textArea>
            <span class="help-inline">${hasErrors(bean: agentInstance, field: 'otherDescription', 'error')}</span>
      </div>
</div>
<fieldset>
      <legend>Address</legend>
      <g:render template="/shared/address" model="[item:'currentAddress',address:agentInstance?.currentAddress]" bean="${agentInstance?.currentAddress}"/>
      <g:render template="/shared/address" model="[item:'permanentAddress',address:agentInstance?.permanentAddress]" bean="${agentInstance?.permanentAddress}"/>
</fieldset>
%{--<fieldset>--}%
      %{--<legend>Address</legend>--}%
      %{--<g:if test="${agentInstance?.currentAddress?.id}">--}%
            %{--<g:hiddenField value="${agentInstance?.currentAddress?.id}" name="currentAddress.id"/>--}%
      %{--</g:if>--}%
      %{--<div class="control-group fieldcontain ${hasErrors(bean: agentInstance, field: 'currentAddress.address', 'error')} required">--}%
            %{--<label for="currentAddress" class="control-label">Current Address--}%
                  %{--<span class="required-indicator">*</span></label>--}%
            %{--<div class="controls">--}%
                  %{--<g:textField id="currentAddress" name="currentAddress.address" required="" value="${agentInstance?.currentAddress?.address}"/>--}%
                  %{--<span class="help-inline">${hasErrors(bean: agentInstance, field: 'currentAddress.address', 'error')}</span>--}%
            %{--</div>--}%
      %{--</div>--}%
      %{--<div class="control-group fieldcontain ${hasErrors(bean: agentInstance, field: 'currentAddress.country', 'error')} required">--}%
            %{--<label for="currentCountry" class="control-label">Current Country--}%
                  %{--<span class="required-indicator">*</span>--}%
            %{--</label>--}%
            %{--<div class="controls">--}%
                  %{--<g:select id="currentCountry" name="currentAddress.country.id" from="${com.ligontech.Country.listAll.list()}" optionKey="id"--}%
                            %{--value="${agentInstance?.currentAddress?.country?.id}" class="many-to-one typeahead" data-provide="typeahead"/>--}%
                  %{--<span class="help-inline">${hasErrors(bean: agentInstance, field: 'currentAddress.country', 'error')}</span>--}%
            %{--</div>--}%
      %{--</div>--}%

      %{--<g:if test="${agentInstance?.permanentAddress?.id}">--}%
            %{--<g:hiddenField value="${agentInstance?.permanentAddress?.id}" name="permanentAddress.id"/>--}%
      %{--</g:if>--}%
      %{--<div class="control-group fieldcontain ${hasErrors(bean: agentInstance, field: 'permanentAddress.address', 'error')} required">--}%
            %{--<label for="permanentAddress" class="control-label">permanent Address--}%
                  %{--<span class="required-indicator">*</span></label>--}%
            %{--<div class="controls">--}%
                  %{--<g:textField id="permanentAddress" name="permanentAddress.address" required="" value="${agentInstance?.permanentAddress?.address}"/>--}%
                  %{--<span class="help-inline">${hasErrors(bean: agentInstance, field: 'permanentAddress.address', 'error')}</span>--}%
            %{--</div>--}%
      %{--</div>--}%
      %{--<div class="control-group fieldcontain ${hasErrors(bean: agentInstance, field: 'permanentAddress.country', 'error')} required">--}%
            %{--<label for="permanentCountry" class="control-label">permanent Country--}%
                  %{--<span class="required-indicator">*</span>--}%
            %{--</label>--}%
            %{--<div class="controls">--}%
                  %{--<g:select id="permanentCountry" name="permanentAddress.country.id" from="${com.ligontech.Country.listAll.list()}" optionKey="id"--}%
                            %{--value="${agentInstance?.permanentAddress?.country?.id}" class="many-to-one typeahead" data-provide="typeahead"/>--}%
                  %{--<span class="help-inline">${hasErrors(bean: agentInstance, field: 'permanentAddress.country', 'error')}</span>--}%
            %{--</div>--}%
      %{--</div>--}%
%{--</fieldset>--}%
<g:render template="/shared/webcam"/>

