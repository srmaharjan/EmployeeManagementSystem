package com.ligontech

import com.ligontech.usermanagement.Customer

class Company {
      String name;
      String phone;
      String email;
      String website;
      Date dateCreated
      Date lastUpdated
      Address address
      Long isDeleted=0
      Customer customer;

      def springSecurityService
      def beforeInsert() {
            if(this.customer==null)
                  this.customer=springSecurityService.principal.customer;
            name=name.split(' ').collect{ it.capitalize() }.join(' ')
      }
      def beforeUpdate(){
            name=name.split(' ').collect{ it.capitalize() }.join(' ')
      }

      static mapping = {
           address cascade: 'all-delete-orphan'
      }

      static constraints = {
            name(nullable: false,blank: false,unique: ['isDeleted','customer'])
            email(email:true,nullable: false,blank: false)
            phone(phone:true,nullable: false,blank: false)
            website(url:true,nullable: true,blank: true)
            address(nullable: false,blank: false)
      }
      String toString(){
            return name+' ('+address.country+')'
      }
      static searchable = {
            id name:'companyId'
            'name' spellCheck:'include'
            'phone' index:'not_analyzed'
            'email' index:'not_analyzed'
            'website' index:'not_analyzed'
            address component:true
            customer component:true
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
