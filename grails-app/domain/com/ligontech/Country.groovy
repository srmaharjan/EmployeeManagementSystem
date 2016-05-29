package com.ligontech

import com.ligontech.usermanagement.Customer


class Country {
      def springSecurityService;
      String value
      String description
      Date dateCreated
      Date lastUpdated

      Long isDeleted=0
      Customer customer;

      def beforeInsert() {
            if(this.customer==null)
                  this.customer=springSecurityService.principal.customer;
            value=value.split(' ').collect{ it.capitalize() }.join(' ')
      }
      def beforeUpdate(){
            value=value.split(' ').collect{ it.capitalize() }.join(' ')
      }

      static constraints = {
            value(nullable:false,blank: false,unique: ['isDeleted','customer'])
      }

      String toString(){
            return value
      }
      static searchable = {
            'value' index:'analyzed',spellCheck : "include"
            'description' index:'analyzed'
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
