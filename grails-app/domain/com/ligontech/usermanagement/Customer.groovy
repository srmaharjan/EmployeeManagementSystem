package com.ligontech.usermanagement

class Customer{
      String ltCode;
      String name
      String address1;
      String address2;
      String country;
      String phoneNo;
      String email;
      String website;
      Long isDeleted=0L
      static searchable ={
            ltCode name: "customerCode"
            only:['ltCode']
            root false
      }
      static constraints = {
            name nullable: false, blank: false, unique: 'ltCode'
            ltCode unique: true,nullable: false,blank: false
            email email:true,nullable: false,blank: false
            website url:true,nullable: false,blank: false
            phoneNo(phone:true,nullable: false,blank: false)
      }

      static mapping={
            id generator: 'assigned',name:'ltCode'
      }
      String toString(){
            return name
      }
      static namedQueries = {
            listAll {
                  eq 'isDeleted',0L
            }
      }
      public String getId(){
            return ltCode;
      }
      public void setId(ltCode){
            this.ltCode=ltCode;
      }

      boolean equals(o) {
            if (this.is(o)) return true
            if (!(o instanceof Customer)) return false

            Customer customer = (Customer) o

            if (ltCode != customer.ltCode) return false

            return true
      }

      int hashCode() {
            int result
            result = ltCode.hashCode()
            result = 31 * result + name.hashCode()
            result = 31 * result + country.hashCode()
            result = 31 * result + email.hashCode()
            result = 31 * result + isDeleted.hashCode()
            return result
      }
}
