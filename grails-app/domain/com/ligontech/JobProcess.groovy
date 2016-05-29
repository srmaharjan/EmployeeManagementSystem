package com.ligontech

import com.ligontech.usermanagement.Customer

class JobProcess {
      Jobs job;
      Process process;
      Jobseeker jobseeker;

      Date dateCreated
      Date lastUpdated
      Customer customer;


      def springSecurityService
      def beforeInsert() {
            if(this.customer==null)
                  this.customer=springSecurityService.principal.customer;
      }

      static searchable={
            'job' component:true
            'process' component:true
            'jobseeker' component:true
      }
      static constraints = {
            job(nullable: false,blank: false)
            process(nullable: false,blank: false)
            jobseeker(min:1,nullable: false,blank: false)
      }

      static namedQueries = {
            listAll {
                  eq 'isDeleted',0L
            }
            domain{customerCode ->
                  if(customerCode!='LT')
                        'customer'{
                              eq 'ltCode',customerCode
                        }
            }
      }
}
