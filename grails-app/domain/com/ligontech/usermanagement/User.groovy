package com.ligontech.usermanagement


class User {

      transient springSecurityService

      static searchable = {
            fullName name:"name", spellCheck : "include"
            'email'
            'username'
      }

      String firstName
      String middleName
      String email
      String lastName
      String username
      String password
      String userCustomerCode
      boolean enabled=true
      boolean accountExpired
      boolean accountLocked
      boolean passwordExpired

      Date dateCreated
      Date lastUpdated

	static transients = ['springSecurityService']

      static constraints = {
            firstName blank: false
            middleName(blank: true,nullable: true)
            lastName blank: false
            email blank: false,unique: ['userCustomerCode'],email:true
            username blank: false, unique:['userCustomerCode']
            password blank: true,nullable:true
            enabled nullable:true,blank:true
      }

      static mapping = {
            password column: '`password`'
      }

      Set<Role> getAuthorities() {
            UserRole.findAllByUser(this).collect { it.role } as Set
      }

      def beforeInsert() {
            if(this.userCustomerCode==null)
                  this.userCustomerCode=springSecurityService.principal.customer?.id;
            encodePassword()
      }

      def beforeUpdate() {
            if (isDirty('password')) {
                  encodePassword()
            }
      }

      protected void encodePassword() {
            password = springSecurityService.encodePassword(password)
      }
      def String getFullName(){
            return "${firstName}${middleName?' '+middleName:''} ${lastName}"
      }
      static namedQueries = {
            customer{customerCode ->
                  if(customerCode!='LT'){
                        eq 'userCustomerCode',customerCode
                  }
            }
      }
}
