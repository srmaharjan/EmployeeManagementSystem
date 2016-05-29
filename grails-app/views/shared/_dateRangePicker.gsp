<div class="control-group fieldcontain ">
      <label for="${startDate}" class="control-label">${startDateLabel}</label>
      <div class="controls">
            <g:textField name="${startDate}" disabled="disabled" placeholder="Select Date..."
                         value="${(startDateValue?:new Date()).format('dd MMMM yyyy')}"  class="datepicker"/>

      </div>
</div>
<div class="control-group fieldcontain ">
      <label for="${startDate}-to" class="control-label">${endDateLabel}</label>
      <div class="controls">
            <g:textField name="${startDate}-to" disabled="disabled" placeholder="Select Date..."
                         value="${(endDateValue?:new Date()).format('dd MMMM yyyy')}"  class="datepicker"/>

      </div>
</div>
<script type="text/javascript">
      $(function(){
            $('#${startDate}').datepicker({
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
                        $( "#${startDate}-to" ).datepicker( "option", "minDate", selectedDate );
                  }
            });
            $('#${startDate}-to').datepicker({
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
                        $( "#${startDate}" ).datepicker( "option", "maxDate", selectedDate );
                  }
            });
      });

</script>