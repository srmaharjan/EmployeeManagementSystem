package com.ligontech

import com.ligontech.usermanagement.Customer

class JobCategory {
      String value
      String description
      Date dateCreated
      Date lastUpdated
      Customer customer;

      Long isDeleted=0
      def springSecurityService
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
      static mapping = {
            description type:'text'
            tablePerHierarchy false
      }
      String toString(){
            return value
      }
      static searchable = {
            id name:'jobCategoryId'
            root:false
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
