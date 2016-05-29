package com.ligontech

import com.ligontech.usermanagement.Customer

class FixedValue {
      String value;
      String description
      FieldType fieldType
      Customer customer
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
      static mapping = {
            tablePerHierarchy false
      }


      static constraints = {
            value(unique: ['fieldType','isDeleted','customer'],blank: false,nullable: false)
            fieldType(inList: FieldType.values() as List,blank:false,nullable: false)
      }
      String toString(){
            return value
      }
      static searchable = {
            id name:'fixedValueId'
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
