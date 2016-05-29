<div class="search">
      <g:form name="search" action="search">
            Search:
            <input type="text" name="query" value="${params.query}"/>
            <label for="query_deadline" class="control-label">Start Date</label>
            <div class="controls">
                  <g:textField name="query_deadline" disabled="disabled" placeholder="Select Start Date..."
                               value="${params['query_deadline']?.format('dd MMMM yyyy')}"  class="datepicker"/>

            </div>
            <label for="query_deadline-to" class="control-label">Deadline End Date</label>
            <div class="controls">
                  <g:textField name="query_deadline-to" disabled="disabled" placeholder="Select End Date..."
                               value="${params['query_deadline-to']?.format('dd MMMM yyyy')}"  class="datepicker"/>

            </div>
            <label for="query_process" class="control-label">Process Status</label>
            <div class="controls">
                  <g:select name="query_process" from="${processes}" optionKey="id"  value="${params?.query_process}"
                            class="many-to-one" noSelection="['':'--All--']" />
            </div>
            <label for="query_agent" class="control-label">Demand Type</label>
            <div class="controls">
                  <g:select id="agent" name="query_agent" from="${agents}" optionKey="id" value="${params?.query_agent}"
                            class="many-to-one" noSelection="['':'--All--']"/>
            </div>
            <label for="query_demand" class="control-label">Demand Type</label>
            <div class="controls">
                  <g:select id="demand" name="query_demand" from="${demands}" optionKey="id" value="${params?.query_demand}"
                            class="many-to-one" noSelection="['':'--All--']"/>
            </div>
            <input type="submit" value="Search"/>
      </g:form>
</div>
<script type="text/javascript">

      $(function(){
            $('#query_deadline').datepicker({
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
                        $( "#query_deadline-to" ).datepicker( "option", "minDate", selectedDate );
                  }
            });
            $('#query_deadline-to').datepicker({
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
                        $( "#query_deadline" ).datepicker( "option", "maxDate", selectedDate );
                  }
            });
      });

</script>