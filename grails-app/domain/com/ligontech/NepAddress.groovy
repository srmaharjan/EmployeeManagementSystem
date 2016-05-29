package com.ligontech

import com.ligontech.usermanagement.Customer


class NepAddress {
      String blockNumber
      String street
      String wardNumber
      String muncipalityOrVdc
      FixedValue district
      FixedValue zone
      Country country
      Customer customer;
//    static mappedBy = [currentAddress: 'currentAddress',
//            permanentAddress: 'permanentAddress',
//            companyAddress:'address']
//
//    static belongsTo = [currentAddress: Jobseeker,
//            permanentAddress: Jobseeker,
//            companyAddress:Company]
//    static mappedBy = [companyAddress: 'address']
//    static belongsTo = [companyAddress:Company]
      Date dateCreated
      Date lastUpdated

      Long isDeleted=0
      static constraints = {
            district(nullable: false,blank: false)
            zone (nullable: false,blank: false)
            country (nullable: false,blank: false)
      }
      static mapping = {
           country column:'country_code'
          //  customer cascade: 'none'
      }
      String toString(){
            return blockNumber+" "+country
      }
//      static searchable = {
//            'blockNumber'
//            'street'
//            'wardNumber'
//            'muncipalityOrVdc'
//            'district' component:true
//            'zone' component:true
//            exclude : 'customer'
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
      def springSecurityService
      def beforeInsert() {
            if(this.customer==null)
                  this.customer=springSecurityService.principal.customer;
      }
}
