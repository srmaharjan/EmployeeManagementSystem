<div class="search">
      <g:form name="search" action="search">
            Search:
            <input type="text" name="query" value="${params.query}"/>
            <div class="control-group fieldcontain">
                  <label for="query_jobCategory" class="control-label">Job Category</label>
                  <div class="controls">
                        <g:select id="query_jobCategory" name="query_jobCategory" from="${jobCategories}" optionKey="id"
                                 value="${params?.query_jobCategory}" class="many-to-one"  noSelection="['':'--All--']"/>
                  </div>
            </div>
            <input type="submit" value="Search"/>
      </g:form>
</div>
