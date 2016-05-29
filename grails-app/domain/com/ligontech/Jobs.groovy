package com.ligontech

import com.ligontech.usermanagement.Customer

class Jobs implements Serializable{
      String designation;
      JobCategory jobCategory;
      int numberOfPosition;
      String basicSalary;
      Long salaryInNepali;
      String qualification;
      String experience
      String description;
      FixedValue ageGroup;
      FixedValue gender;
      int dailyWorkingHour
      int weeklyWorkDays;
      int annualLeave
      Long expenseToProcess
      Customer customer;

      Long isDeleted=0L

      List facility;
      static belongsTo = [demand:Demand]
      static hasMany = [facility:FixedValue]

      def springSecurityService
      def beforeInsert() {
            if(this.customer==null)
                  this.customer=springSecurityService.principal.customer;
      }
      static constraints = {
            designation(nullable: false,blank: false)
            jobCategory(nullable: false,blank: false)
            numberOfPosition(min:1,nullable: false,blank: false)
            basicSalary(nullable: false,blank: false)
            salaryInNepali(min:1L,nullable: true,blank:true)
            qualification(nullable: true,blank: true)
            experience(nullable: true,blank: true)
            ageGroup(nullable: true,blank: true)
            dailyWorkingHour(max:24,nullable: true,blank: true)
            weeklyWorkDays(max: 7, nullable: true,blank: true)
            annualLeave(max:365,nullable: true,blank: true)
            expenseToProcess(min:1L,nullable: true,blank:true)
      }
      static mapping = {
            description type:"text"
            facility joinTable: [name: 'jobs_facility',key:'jobs_id',column:'facility_id']
      }



      static searchable = {
            'designation'
            'description'
            'jobCategory' component:true
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
//      @Override
//      public static Map<String,String> getSearchFieldList(){
//            return ['designation':'ilike','jobCategory.value':'ilike'];
//      }
//
//      @Override
//      public String toQueryString(){
//            return this.designation+', '+ this.jobCategory.value;
//      }
//      @Override
//      public static Map<String,String> getParent(){
//            return ['demand.id':'eq']
//      }
//
//      @Override
//      public static def extraQuery(){
//            return "";
//      }
}
