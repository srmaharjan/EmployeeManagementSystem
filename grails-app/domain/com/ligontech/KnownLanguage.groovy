package com.ligontech

import com.ligontech.usermanagement.Customer

class KnownLanguage {
      FixedValue language
      FixedValue reading
      FixedValue writing
      FixedValue speaking
      static belongsTo = [jobseeker:Jobseeker]

      Date dateCreated
      Date lastUpdated

      String isDeleted=0
      boolean deleted
      static transients = [ 'deleted' ]
      Customer customer;
      def springSecurityService
//      static searchable = {
//            exclude : 'customer'
//      }
      static searchable = {
            root false
      }
      static mapping = {
            //   customer cascade: 'none'
      }
      def beforeInsert() {
            if(this.customer==null)
                  this.customer=springSecurityService.principal.customer;
      }
      static constraints = {
            language(unique: ['jobseeker','isDeleted','customer']/*,inList: FixedValue.findAll {it.fieldType==com.ligontech.FieldType.LANGUAGE}*/)
//        reading(inList: FixedValue.findAllByFieldType (com.ligontech.FieldType.RATING))
//        writing(inList: FixedValue.findAllByFieldType (com.ligontech.FieldType.RATING))
//        speaking(inList: FixedValue.findAllByFieldType (com.ligontech.FieldType.RATING))
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
