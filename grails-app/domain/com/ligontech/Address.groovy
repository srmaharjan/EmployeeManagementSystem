package com.ligontech

import com.ligontech.usermanagement.Customer

class Address {
      String street;
      String city;
      Country country;

      Customer customer;
      Date dateCreated
      Date lastUpdated
      Long isDeleted=0
      static searchable = {
            country component:true
            customer component:true
      };
      static constraints = {
            street(nullable: false,blank: false)
            city(nullable: false,blank: false)
            country(nullable: false,blank: false)
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

      def springSecurityService
      def beforeInsert() {
            if(this.customer==null)
                  this.customer=springSecurityService.principal.customer;
      }
      public String toString(){
            return city+' '+country
      }

}
