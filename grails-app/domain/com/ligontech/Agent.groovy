package com.ligontech

import com.ligontech.usermanagement.Customer

class Agent {

      String name;
      String phoneNo;
      String email
      String website
      String otherDescription
      FileEntry photo
      Address currentAddress
      Address permanentAddress

      Date dateCreated
      Date lastUpdated
      Customer customer;

      Long isDeleted=0

      def beforeInsert() {
            if(this.customer==null)
                  this.customer=springSecurityService.principal.customer;
            name=name.split(' ').collect{ it.capitalize() }.join(' ')
      }
      def beforeUpdate(){
            name=name.split(' ').collect{ it.capitalize() }.join(' ')
      }


      static constraints = {
            name(nullable: false,blank: false)
            phoneNo(phone:true,nullable: false,blank: false)
            photo(nullable: true,blank: true)
            email(nullable: true,blank: true,email: true)
            currentAddress(nullable: false,blank: false)
            permanentAddress(nullable: false,blank: false)
            website(url:true)
      }

      static mapping = {
            otherDescription type:"text"
            photo cascade: 'all-delete-orphan'
            currentAddress cascade: 'all-delete-orphan'
            permanentAddress cascade: 'all-delete-orphan'
      }
      String toString(){
            return name+" "+currentAddress.country
      }

      static searchable = {
            'email' index:'not_analyzed'
            'website' index:'not_analyzed'
            currentAddress component:true
            permanentAddress component:true
            customer component:true
            except: 'photo'
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
}
