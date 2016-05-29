<div class="control-group fieldcontain ${hasErrors(bean: demandInstance, field: 'demandNumber', 'error')} required">
      <label for="demandNumber" class="control-label"><g:message code="demand.demandNumber.label" default="Demand Number" /><span class="required-indicator">*</span></label>
      <div class="controls">
            <g:textField name="demandNumber" required="" value="${demandInstance?.demandNumber}"/>
            <span class="help-inline">${hasErrors(bean: demandInstance, field: 'demandNumber', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: demandInstance, field: 'deadline', 'error')} required">
      <label for="deadline" class="control-label"><g:message code="demand.deadline.label" default="Deadline" /><span class="required-indicator">*</span></label>
      <div class="controls">
            <g:textField name="date_deadline" disabled="disabled" placeholder="Select Date..." required=""  value="${demandInstance?.deadline?.format('dd MMMM yyyy')}"  class="datepicker"/>
            <div style="display:none;">
                  <g:datePicker name="deadline"  precision="day"  value="${demandInstance?.deadline}"  />
            </div>
            <span class="help-inline">${hasErrors(bean: demandInstance, field: 'deadline', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: demandInstance, field: 'demandType', 'error')} required">
      <label for="demandType" class="control-label"><g:message code="demand.demandType.label" default="Demand Type" /><span class="required-indicator">*</span></label>
      <div class="controls">
            <g:select id="demandType" name="demandType.id" from="${demandTypes}" optionKey="id" required="" value="${demandInstance?.demandType?.id}" class="many-to-one" noSelection="['':'--Select--']"/>
            <span class="help-inline">${hasErrors(bean: demandInstance, field: 'demandType', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: demandInstance, field: 'company', 'error')} required">
      <label for="company" class="control-label"><g:message code="demand.company.label" default="Company" /><span class="required-indicator">*</span></label>
      <div class="controls">
            <g:select id="company" name="company.id" from="${companies}" optionKey="id" required="" value="${demandInstance?.company?.id}" class="many-to-one" noSelection="['':'--Select--']" />
            <span class="help-inline">${hasErrors(bean: demandInstance, field: 'company', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: demandInstance, field: 'agent', 'error')} ">
      <label for="agent" class="control-label"><g:message code="demand.agent.label" default="Agent" /></label>
      <div class="controls">
            <g:select id="agent" name="agent.id" from="${agents}" optionKey="id" value="${demandInstance?.agent?.id}" class="many-to-one" noSelection="['':'--Select--']"/>
            <span class="help-inline">${hasErrors(bean: demandInstance, field: 'agent', 'error')}</span>
      </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: demandInstance, field: 'batchNo', 'error')} ">
      <label for="batchNo" class="control-label"><g:message code="demand.batchNo.label" default="Batch No" /></label>
      <div class="controls">
            <g:textField name="batchNo" value="${demandInstance?.batchNo}"/>
            <span class="help-inline">${hasErrors(bean: demandInstance, field: 'batchNo', 'error')}</span>
      </div>
</div>


<div class="control-group fieldcontain ${hasErrors(bean: demandInstance, field: 'otherDescription', 'error')} ">
      <label for="otherDescription" class="control-label"><g:message code="demand.otherDescription.label" default="Other Description" /></label>
      <div class="controls">
            <g:textArea name="otherDescription" value="${demandInstance?.otherDescription}"/>
            <span class="help-inline">${hasErrors(bean: demandInstance, field: 'otherDescription', 'error')}</span>
      </div>
</div>

<script type="text/javascript">

      $(function(){
            $('#date_deadline').datepicker({
                  inline: true,
                  nextText: '&rarr;',
                  prevText: '&larr;',
                  showOtherMonths: true,
                  dateFormat: 'dd MM yy',
                  dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
                  showOn: "button",
                  buttonImage: "<g:resource dir="img" file="calendar-blue.png"/>",
                  buttonImageOnly: true,
                  minDate:$.datepicker.parseDate( "yy-mm-dd", "${new Date().format('yyyy-MM-dd')}"),
                  onClose: function( selectedDate ) {
                        var date = $(this).datepicker('getDate'),
                              day  = date.getDate(),
                              month = date.getMonth() + 1,
                              year =  date.getFullYear();
                        var dateId=$(this).prop('id').replace('date_','');
                        $('#'+dateId+'_year').val(year);
                        $('#'+dateId+'_month').val(month);
                        $('#'+dateId+'_day').val(day);
                  },
                  %{--defaultDate: $.datepicker.parseDate("${(demandInstance?.deadline)?demandInstance?.deadline.format('yyyy-MM-dd'):new Date().format('yyyy-MM-dd')}")--}%
                  %{--defaultDate: $.datepicker.parseDate("yy-mm-dd","${new Date().format('yyyy-MM-dd')}")--}%
            });
      });

</script>
<!--
  $(function() {
    $( "#from" ).datepicker({
      changeMonth: true,
      changeYear:true,
      maxDate:0,
      onSelect: function( selectedDate ) {
        $( "#to" ).datepicker( "option", "minDate", selectedDate );
      }
    });
    $( "#to" ).datepicker({
      changeMonth: true,
      changeYear:true,
      maxDate:0,
      onSelect: function( selectedDate ) {
        $( "#from" ).datepicker( "option", "maxDate", selectedDate );
      }
    });
  });
-->
<!--
<script>
$(function() {

  $( "#date_start" ).datepicker({
    changeMonth: true,
    numberOfMonths: 1,
  dateFormat: "yy-mm-dd",
  showOn: "both",
    buttonImage: "images/smCal.gif",
    buttonImageOnly: true,
  constrainInput: true,
    onSelect: function( selectedDate ) {
      var diffDays = daydiff(parseDate($('#curStartDate').val()), parseDate($('#date_end').val()));

      if(!isNumber(diffDays)) diffDays = 0;

      var date2 = $('#date_start').datepicker('getDate');
      date2.setDate(date2.getDate()+diffDays);

      $( "#date_end" ).datepicker( "option", "minDate", selectedDate );
      $('#date_end').datepicker('setDate', date2);
     $( "#curStartDate" ).val(selectedDate)
    }
  });

  $( "#date_end" ).datepicker({
    changeMonth: true,
    numberOfMonths: 1,
  dateFormat: "yy-mm-dd",
  showOn: "both",
    buttonImage: "images/smCal.gif",
    buttonImageOnly: true,
  constrainInput: true,
  minDate:$( "#date_start" ).val()
  });

$( "#curStartDate" ).val($( "#date_start" ).val());
});

function isNumber(n) {
  return !isNaN(parseFloat(n)) && isFinite(n);
}
function parseDate(str) {
  var mdy = str.split('-');
  return new Date(mdy[0], mdy[1]-1, mdy[2]);
}
function daydiff(first, second) {
  return (second-first)/(1000*60*60*24);
}
</script>
-->
