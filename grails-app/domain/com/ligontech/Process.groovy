package com.ligontech

import com.ligontech.usermanagement.Customer

class Process {
      String code;
      String description
      Country country;
      Boolean includeInProcess=true;
      String colorCode
      Boolean canApplyOtherJob=false;
      Boolean isFirstStep=false;


      Date dateCreated
      Date lastUpdated
      Long isDeleted=0L
      Customer customer;

      def springSecurityService
      def beforeInsert() {
            if(this.customer==null)
                  this.customer=springSecurityService.principal.customer;
      }

      static constraints = {
            colorCode (unique: ['customer'])
            code(unique: ['customer'],nullable: false,blank:false)
      }
      static searchable = true
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
