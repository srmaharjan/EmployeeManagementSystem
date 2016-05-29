package com.ligontech

import com.ligontech.usermanagement.Customer

class Passport {
      String number
      Date issuedDate
      Date expiryDate
      String issuedAddress
      String issuedBy
      String remarks
      Jobseeker jobseeker;

      Date dateCreated
      Date lastUpdated
      Customer customer;

      String isDeleted=0
      def springSecurityService
      def beforeInsert() {
            if(this.customer==null)
                  this.customer=springSecurityService.principal.customer;
      }
      static constraints = {
            number unique: 'customer'
      }
      static mapping = {
            remarks type:'text'
      }
      static searchable = {
            'issuedDate' format:'yyyyMMdd'
            'expiryDate' format:'yyyyMMdd'
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
