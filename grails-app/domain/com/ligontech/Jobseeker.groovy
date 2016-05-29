package com.ligontech

import com.ligontech.usermanagement.Customer

class Jobseeker extends AutoComplete{
      String firstName
      String middleName
      String lastName
      Date dateOfBirth
      String fatherName
      String email
      Float expectedSalary
      FixedValue nationality
      String contactNumber
      String mobileNumber
      FixedValue gender
      FixedValue martialStatus
      String complexion
      Float height
      Float weight
      FixedValue religion
      String workExperience
      NepAddress permanentAddress
      NepAddress currentAddress


      String otherDescription
      String nominee
      String nomineeAddress
      String nomineeContactNumber
      String relation
      boolean isReadyToApply
      Passport passport;

      Agent localAgent
      static hasOne = [passport:Passport]
      static hasMany = [languages:KnownLanguage,documents:Documents,jobCategory:JobCategory,educations:AcedemicEducation,trainings:Training]
      List<Documents> documents=new ArrayList<Documents>()
      FileEntry photo
      List<Training> trainings = new ArrayList()
      List<KnownLanguage> languages = new ArrayList()
      List<AcedemicEducation> educations = new ArrayList()

      Date dateCreated
      Date lastUpdated
      Customer customer;

      Long isDeleted=0L
      def springSecurityService
      def beforeInsert() {
            if(this.customer==null)
                  this.customer=springSecurityService.principal.customer;
      }
      static constraints = {
            firstName(nullable: false,blank: false)
            lastName(nullable: false,blank: false)
            dateOfBirth(nullable: false,blank: false)
            nationality(nullable: false,blank: false)
            contactNumber(nullable: false,blank: false)
            currentAddress(nullable:true,blank:true)
      }
      static mapping = {
            complexion type:'text'
            workExperience type:'text'
            otherDescription type:'text'
            permanentAddress cascade: 'all-delete-orphan'
            currentAddress cascade: 'all-delete-orphan'
            trainings cascade: 'all-delete-orphan'
            languages cascade: 'all-delete-orphan'
            educations cascade: 'all-delete-orphan'
            photo cascade: 'all-delete-orphan'
            passport cascade: 'all-delete-orphan'
            documents cascade: 'all-delete-orphan'
      }
      static searchable = {
            'fullName' name:'name', spellCheck:'include'
            'dateOfBirth' format:'yyyyMMdd'
            'passport' component:true
            'customer' component: true
            'trainings' component: true
            'languages' component: true
            'educations' component: true
            exclude : ['photo','documents']
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

      public String getFullName(){
            return "${firstName}${middleName?' '+middleName:''} ${lastName}"
      }

      @Override
      public static def autoCompleteQuery(query, fixedQuery){
            return {
                  must(queryString(fixedQuery))
                  must(term('isReadyToApply','true'))
                  must{
                        wildcard('firstName','*'+query+'*')
                        wildcard('middleName','*'+query+'*')
                        wildcard('lastName','*'+query+'*')
                        wildcard('email','*'+query+'*')
                  }
            }
      }
}
