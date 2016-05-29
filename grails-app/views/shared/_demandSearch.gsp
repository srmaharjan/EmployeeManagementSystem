<div class="search">
      <g:form name="search" action="search">
            Search:
            <input type="text" name="query" value="${params.query}"/>
            <label for="query_deadline" class="control-label">Deadline Start Date</label>
            <div class="controls">
                  <g:textField name="date_deadline" disabled="disabled" placeholder="Select Start Date..."
                               value="${params['query_deadline']?.format('dd MMMM yyyy')}"  class="datepicker"/>
                  <div>
                        <g:datePicker name="query_deadline"  precision="day" value="${params['query_deadline']}" default="none"
                                      noSelection="['':'']" />
                  </div>
            </div>
            <label for="query_deadline-to" class="control-label">Deadline End Date</label>
            <div class="controls">
                  <g:textField name="date_deadline-to" disabled="disabled" placeholder="Select End Date..."
                               value="${params['query_deadline-to']?.format('dd MMMM yyyy')}"  class="datepicker"/>
                  <div>
                        <g:datePicker name="query_deadline-to"  precision="day" value="${params['query_deadline-to']}" default="none"
                                      noSelection="['':'']" />
                  </div>
            </div>
            <label for="query_company" class="control-label">Company</label>
            <div class="controls">
                  <g:select id="company" name="query_company" from="${companies}" optionKey="id"  value="${params?.query_company}"
                            class="many-to-one" noSelection="['':'--All--']" />
            </div>
            <label for="query_demandType" class="control-label">Demand Type</label>
            <div class="controls">
                  <g:select id="demandType" name="query_demandType" from="${demandTypes}" optionKey="id" value="${params?.query_demandType}"
                            class="many-to-one" noSelection="['':'--All--']"/>
            </div>
            <input type="submit" value="Search"/>
      </g:form>
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
                  onClose: function( selectedDate ) {
                        var date = $(this).datepicker('getDate'),
                              day  = date.getDate(),
                              month = date.getMonth() + 1,
                              year =  date.getFullYear();
                        var dateId=$(this).prop('id').replace('date_','');
                        $('#query_'+dateId+'_year').val(year);
                        $('#query_'+dateId+'_month').val(month);
                        $('#query_'+dateId+'_day').val(day);
                        $( "#date_deadline-to" ).datepicker( "option", "minDate", selectedDate );
                  }
            });
            $('#date_deadline-to').datepicker({
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
                        var date = $(this).datepicker('getDate'),
                              day  = date.getDate(),
                              month = date.getMonth() + 1,
                              year =  date.getFullYear();
                        var dateId=$(this).prop('id').replace('date_','');
                        $('#query_'+dateId+'_year').val(year);
                        $('#query_'+dateId+'_month').val(month);
                        $('#query_'+dateId+'_day').val(day);
                        $( "#date_deadline" ).datepicker( "option", "maxDate", selectedDate );
                  }
            });
      });

</script>