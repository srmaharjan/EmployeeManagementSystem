package com.ligontech

import com.ligontech.usermanagement.Customer


class ApplicationProcess {
      Jobseeker jobseeker;
      Jobs jobs;
      Demand demand;
      Process process;
      String remark;
//      static hasMany = [process:Process]

      Date dateCreated
      Date lastUpdated
      Customer customer
      static constraints = {

      }
      static mapping = {
//            process joinTable: [name: 'application_process_process',key:'application_process_id',column:'process_id']
            remark type: 'text'
            process column:'process_code'
      }
      static searchable = {
            'jobseeker' component: true
            'jobs' component: true
            'demand' component: true
            'process' component: true
            'customer' component: true
      }
      static namedQueries = {
            domain{customerCode ->
                  if(customerCode!='LT')
                        'customer'{
                              eq 'ltCode',customerCode
                        }
            }
      }
      def springSecurityService
      def beforeInsert() {
            if(this.customer==null)
                  this.customer=springSecurityService.principal.customer;
      }
}
