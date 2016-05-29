package com.ligontech

import com.ligontech.usermanagement.Customer

class AcedemicEducation {
      FixedValue degree
      String nameOfDegree
      String graduationYear
      String college_school
      String board
      String percent
      static belongsTo = [jobseeker:Jobseeker]
      Customer customer
      Date dateCreated
      Date lastUpdated

      String isDeleted=0
      boolean deleted
      static transients = [ 'deleted' ]
      def springSecurityService

//      static searchable = {
//            exclude : 'customer'
//      }
     static searchable = {
           root false
     }
      def beforeInsert() {
            if(this.customer==null)
                  this.customer=springSecurityService.principal.customer;
      }
      static constraints = {
            degree(nullable: false,blank: false,unique: ['jobseeker','isDeleted','nameOfDegree','customer'])
            nameOfDegree(nullable: false,blank: false)
            college_school(validator: {value,obj ->
                  return (value!=null) && (obj.nameOfDegree!=null)
            })
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
