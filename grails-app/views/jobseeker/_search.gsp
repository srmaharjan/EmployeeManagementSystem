<div class="search">
      <g:form name="search" action="search">
            Search:
            <input type="text" name="query" value="${params.query}"/>
            <label for="query_dob" class="control-label">Deadline Start Date</label>
            <div class="controls">
                  <g:textField name="query_dob" disabled="disabled" placeholder="Select Start Date..."
                               value="${params['query_dob']?.format('dd MMMM yyyy')}"  class="datepicker"/>

            </div>
            <label for="query_dob-to" class="control-label">Deadline End Date</label>
            <div class="controls">
                  <g:textField name="query_dob-to" disabled="disabled" placeholder="Select End Date..."
                               value="${params['query_dob-to']?.format('dd MMMM yyyy')}"  class="datepicker"/>

            </div>
                  <label for="query_gender" class="control-label">Gender</label>
                  <div class="controls">
                        <label class="radio inline"> <input type="radio" name="query_gender" value=""> Any </label>
                        <g:set var="allGender" value="${gender}"/>
                        <g:radioGroup name="query_gender"
                                      labels="${allGender.value}"
                                      values="${allGender.id}" value="${(params?.query_gender)}">
                              <label class="radio inline"> ${it.radio} ${it.label} </label>
                        </g:radioGroup>
                  </div>
            <input type="submit" value="Search"/>
      </g:form>
</div>
<script type="text/javascript">

      $(function(){
            $('#query_dob').datepicker({
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
                        $( "#query_dob-to" ).datepicker( "option", "minDate", selectedDate );
                  }
            });
            $('#query_dob-to').datepicker({
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
                        $( "#query_dob" ).datepicker( "option", "maxDate", selectedDate );
                  }
            });
      });

</script>