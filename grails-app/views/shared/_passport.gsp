<%@ page import="com.ligontech.Passport" %>
<div class="control-group fieldcontain ${hasErrors(bean: passportInstance, field: 'issuedDate', 'error')} ">
      <label for="${item}.issuedDate" class="control-label"><g:message code="passport.issuedDate.label" default="Issued Date" /></label>
      <div class="controls">
            <g:textField name="${item}.issuedDate" id="date_${item}_issuedDate" readonly="readonly" placeholder="Select issue Date..."
                         value="${passportInstance?.issuedDate?.format('dd MMMM yyyy')}"  class="datepicker"/>
            %{--<div>--}%
                  %{--<g:datePicker name="${item}.issuedDate" id="${item}_issuedDate"  precision="day" value="${passportInstance?.issuedDate}" default="none"--}%
                                %{--noSelection="['':'']" />--}%
            %{--</div>--}%
            <span class="help-inline">${hasErrors(bean: passportInstance, field: 'issuedDate', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: passportInstance, field: 'expiryDate', 'error')} ">
      <label for="${item}.expiryDate" class="control-label"><g:message code="passport.expiryDate.label" default="Expiry Date" /></label>
      <div class="controls">
            <g:textField name="${item}.expiryDate" id="date_${item}_expiryDate" readonly="readonly" placeholder="Select expire Date..."
                         value="${passportInstance?.expiryDate?.format('dd MMMM yyyy')}"  class="datepicker"/>
            %{--<div>--}%
                  %{--<g:datePicker name="${item}.expiryDate" id="${item}_expiryDate" precision="day" value="${passportInstance?.expiryDate}" default="none"--}%
                                %{--noSelection="['':'']" />--}%
            %{--</div>--}%
            <span class="help-inline">${hasErrors(bean: passportInstance, field: 'expiryDate', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: passportInstance, field: 'issuedAddress', 'error')} ">
      <label for="${item}.issuedAddress" class="control-label"><g:message code="passport.issuedAddress.label" default="Issued Address" /></label>
      <div class="controls">
            <g:textField name="${item}.issuedAddress" value="${passportInstance?.issuedAddress}"/>
            <span class="help-inline">${hasErrors(bean: passportInstance, field: 'issuedAddress', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: passportInstance, field: 'issuedBy', 'error')} ">
      <label for="${item}.issuedBy" class="control-label"><g:message code="passport.issuedBy.label" default="Issued By" /></label>
      <div class="controls">
            <g:textField name="${item}.issuedBy" value="${passportInstance?.issuedBy}"/>
            <span class="help-inline">${hasErrors(bean: passportInstance, field: 'issuedBy', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: passportInstance, field: 'number', 'error')} ">
      <label for="${item}.number" class="control-label"><g:message code="passport.number.label" default="Number" /></label>
      <div class="controls">
            <g:textField name="${item}.number" value="${passportInstance?.number}"/>
            <span class="help-inline">${hasErrors(bean: passportInstance, field: 'number', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: passportInstance, field: 'remarks', 'error')} ">
      <label for="${item}.remarks" class="control-label"><g:message code="passport.remarks.label" default="Remarks" /></label>
      <div class="controls">
            <g:textArea name="${item}.remarks" value="${passportInstance?.remarks}"/>
            <span class="help-inline">${hasErrors(bean: passportInstance, field: 'remarks', 'error')}</span>
      </div>
</div>

<script type="text/javascript">

      $(function(){
            $("#date_"+"${item}"+"_issuedDate").datepicker({
                  changeMonth: true,
                  changeYear: true,
                  inline: true,
                  nextText: '&rarr;',
                  prevText: '&larr;',
                  showOtherMonths: true,
                  dateFormat: 'dd MM yy',
                  dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
                  showOn: "button",
                  buttonImage: "<g:resource dir="img" file="calendar-blue.png"/>",
                  buttonImageOnly: true,
                  onClose: function( selectedDate ) {
                        $("#date_"+"${item}"+"_expiryDate" ).datepicker( "option", "minDate", selectedDate );
                        %{--var date = $(this).datepicker('getDate');--}%
                        %{--if(date!=null && date!=undefined){--}%
                              %{--var day  = date.getDate(),--}%
                                    %{--month = date.getMonth() + 1,--}%
                                    %{--year =  date.getFullYear();--}%
                              %{--var dateId=$(this).prop('id').replace('date_','');--}%
                              %{--$('#'+dateId+'_year').val(year);--}%
                              %{--$('#'+dateId+'_month').val(month);--}%
                              %{--$('#'+dateId+'_day').val(day);--}%
                              %{--$("#date_"+"${item}"+"_expiryDate" ).datepicker( "option", "minDate", selectedDate );--}%
                        %{--}--}%
                  }
            });
            $("#date_"+"${item}"+"_expiryDate").datepicker({
                  changeMonth: true,
                  changeYear: true,
                  inline: true,
                  nextText: '&rarr;',
                  prevText: '&larr;',
                  showOtherMonths: true,
                  dateFormat: 'dd MM yy',
                  dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
                  showOn: "button",
                  buttonImage: "<g:resource dir="img" file="calendar-blue.png"/>",
                  buttonImageOnly: true,
                  onClose: function( selectedDate ) {
                        $("#date_"+"${item}"+"_issuedDate").datepicker( "option", "maxDate", selectedDate );
                        %{--var date = $(this).datepicker('getDate');--}%
                        %{--if(date!=null && date!=undefined){--}%
                              %{--var day  = date.getDate(),--}%
                                    %{--month = date.getMonth() + 1,--}%
                                    %{--year =  date.getFullYear();--}%
                              %{--var dateId=$(this).prop('id').replace('date_','');--}%
                              %{--$('#'+dateId+'_year').val(year);--}%
                              %{--$('#'+dateId+'_month').val(month);--}%
                              %{--$('#'+dateId+'_day').val(day);--}%
                              %{--$("#date_"+"${item}"+"_issuedDate").datepicker( "option", "maxDate", selectedDate );--}%
                        %{--}--}%
                  }
            });
      });

</script>
