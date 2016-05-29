package com.ligontech

import com.ligontech.usermanagement.Customer

class Training {
      String topic
      String trainingObjective
      String duration
      String trainingCenter
      static belongsTo = [jobseeker:Jobseeker]

      Date dateCreated
      Date lastUpdated

      String isDeleted=0
      boolean deleted
      Customer customer
      static transients = [ 'deleted' ]

      def springSecurityService
      static mapping = {
          //  customer cascade: 'none'
      }
      def beforeInsert() {
            if(this.customer==null)
                  this.customer=springSecurityService.principal.customer;
      }
      static constraints = {
            topic (nullable: false,blank: false,unique: ['jobseeker'])
            trainingObjective(nullable: false,blank: false)
            duration(nullable: false,blank: false)
      }
//      static searchable = {
//            'topic'
//            'trainingObjective'
//            exclude : 'customer'
//      }

      static searchable = {
            root false
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
