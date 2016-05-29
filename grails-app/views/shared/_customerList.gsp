<sec:access expression="hasRole('SUPERMAN')">
      <div class="control-group fieldcontain ${hasErrors(bean: bean, field: 'id', 'error')} ">
            <label for="customer.id" class="control-label">Customer</label>
            <div class="controls">
                  <g:select id="customer" name="customer.id" from="${com.ligontech.usermanagement.Customer.listAll.list()}"
                            optionKey="id" required="" value="${bean?.id}" noSelection="['':'--Select Customer--']" class="many-to-one"/>
                  <span class="help-inline">${hasErrors(bean: bean, field: 'id', 'error')}</span>
            </div>
      </div>
</sec:access>