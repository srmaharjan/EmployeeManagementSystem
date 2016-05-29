<div class="control-group fieldcontain">
      <label for="query" class="control-label">Search for : </label>

      <div class="controls">
            <input type="text" name="query" id="query" value="${params.query}"/>
      </div>
</div>
<g:render template="/shared/dateRangePicker"
          model="[startDate: 'date', startDateLabel: 'From date : ', endDateLabel: 'To date : ']"/>
<div class="control-group fieldcontain ">
      <label for="process" class="control-label">Process</label>

      <div class="controls">
            <g:select id="process" name="process.id" from="${processList}" optionKey="id" noSelection="['': 'Any']"/>
      </div>
</div>

<div class="control-group fieldcontain">
      <label for="agent" class="control-label">Agent</label>

      <div class="controls">
            <g:select id="agent" name="agent.id" from="${agentList}" optionKey="id" optionValue="name" noSelection="['': 'Any']"/>
      </div>
</div>
<div class="control-group fieldcontain">
      <label for="demand" class="control-label">
            Demand
      </label>

      <div class="controls" id="demandContainer">
            <g:select id="demand" name="demand.id" from="[:]" noSelection="['': 'Any']"/>
      </div>
</div>
<script type="text/javascript">
      $(document).ready(function () {
            $('#agent').combobox({
                  select: function (event, ui) {
                        updateDemands();
                  }
            });
            $('#demand').combobox();
      })
      function updateDemands() {
            $('#demandContainer').load('<g:createLink controller="demand" action="search.js"/>',{'query_agent':$('#agent').val(),'search':true},function(){
                  $('#demand').combobox();
            });
      }
</script>