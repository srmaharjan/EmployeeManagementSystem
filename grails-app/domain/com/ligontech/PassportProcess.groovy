package com.ligontech

import com.ligontech.usermanagement.Customer

class PassportProcess {

      Date	dateCreated
      Date	lastUpdated

      Passport passport
      String status
      String submitedBy
      String collectedBy
      String remarks


      String isDeleted=0
      Customer customer;
      def springSecurityService
      def beforeInsert() {
            if(this.customer==null)
                  this.customer=springSecurityService.principal.customer;
      }
      static constraints = {
            status(inList:['Collected','Not Collected','Returned'])
            submitedBy(nullable: true,blank: true, validator: {value,obj ->
                  return (value!=null) == (obj.status=='Collected' || obj.status=='Returned');
            })
            collectedBy(nullable: true,blank: true,validator: {value,obj ->
                  return (value!=null) == (obj.status=='Collected' || obj.status=='Returned');
            })

      }
//      static searchable = {
//            'status'
//            'collectedBy'
//            'submitedBy'
//            'dateCreated' format:'yyyy-MM-dd'
//            'passport' component:true
//      }
      static searchable = true;
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
