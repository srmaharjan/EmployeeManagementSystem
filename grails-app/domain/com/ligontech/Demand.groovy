package com.ligontech

import com.ligontech.usermanagement.Customer


class Demand extends AutoComplete implements Serializable{
      String demandNumber
      String batchNo='001';
      Date deadline;
      FixedValue demandType;
      String otherDescription
      static hasMany = [jobs:Jobs]
      Company company;
      Agent agent;
      List<Jobs> jobs = new ArrayList()
      Long isDeleted=0L
      Customer customer;




      Demand(){
      }
      static constraints = {
            demandNumber(nullable: false,blank: false,unique: ['batchNo','customer'])
            deadline(nullable: false,blank: false,validator: { val, obj ->
                  Calendar cal = Calendar.getInstance();
                  cal.add(Calendar.DATE, -1);
                  val?.after(cal.getTime())
            })
            demandType(nullable: false,blank: false)
            company(nullable: false,blank: false)
      }
      static mapping = {
            otherDescription type:'text'
      }
      def springSecurityService
      def beforeUpdate(){
            if(this.customer==null)
                  this.customer=springSecurityService.principal.customer;
            if(this.isDeleted!=0L){
                  this.jobs.each{
                        it.softDelete();
                  }
            }
      }
      static searchable = {
            id name:'demandId'
            'batchNo' index:'not_analyzed'
            'deadline' format:'yyyyMMdd'
            'demandType' component:true
            'agent' component:true
            'jobs' component:true
            'company' component:true
            'customer' component: true
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

      @Override
      public String toString(){
            return this.demandNumber+' '+ this.company
      }

      @Override
      public static def autoCompleteQuery(query, fixedQuery){
            return {
                  must(queryString(fixedQuery))
                  must(ge('deadline',new Date().format('yyyyMMdd')))
                  must{
                        wildcard('$/Demand/company/name','*'+query+'*')
                        wildcard('$/Demand/company/address/value','*'+query+'*')
                        wildcard('demandNumber','*'+query+'*')
                  }
            }
      }

      public static def extraQuery(query,max,userCustomerCode){
            return {
                  or{
                        ilike('demandNumber','%'+query+'%')
                        company{
                              ilike('name','%'+query+'%')
                        }
                        company{
                              address{
                                    country{
                                          ilike('value','%'+query+'%')
                                    }
                              }
                        }
                  }
                  and{
                        eq('isDeleted',0L)
                        ge('deadline',new Date())
                        eq('customer.id',userCustomerCode)
                  }
                  maxResults(max)
            }
      }
}
