package com.ligontech

class CountryService {
      static transactional = false
      def grailsApplication
      def springSecurityService
      def searchService;

      def search(params){
            def query = params.query
            def result;
            params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
            if(query){
                  def fail = { Map m ->
                        result.error = [ code: m.code, args: ["Country"] ]
                        return result
                  }
                  result = searchService.search(Country,params,['value','description'])
                  //result = Country.search("$query AND cutomer:$customer AND isDelete:${0L}");
//                  if(userCustomerCode.equals('LT')){
//                        result=Country.search{
//                              must(queryString(query))
//                        }
////                        result=searchableService.search(query)
//                  }else{
//                        result=Country.search{
//                              must(queryString(query))
//                              must(term('customer',Customer.get(userCustomerCode)))
//                        }
////                        result = searchableService.search("$query AND userCustomerCode:$userCustomerCode");
//                  }
            }else{
                  result=list(params)
            }
            return result;
      }
//      def search(params){
//            def query = params.query
//            def result;
//            if(query){
//                  def loggedInCountry=springSecurityService.currentUser;
//                  def userCustomerCode=loggedInCountry.userCustomerCode;
//                  if(userCustomerCode.equals('LT')){
//                        result=Country.search{
//                              must(queryString(query))
//                        }
////                        result=searchableService.search(query)
//                  }else{
//                        result=Country.search{
//                              must(queryString(query))
//                              must(term('customer',Customer.get(userCustomerCode)))
//                        }
////                        result = searchableService.search("$query AND userCustomerCode:$userCustomerCode");
//                  }
//            }else{
//                 result=list(params)
//            }
//            return result;
//      }
      def list(params) {
            def loggedInuser=springSecurityService.getCurrentUser()
            def result = [:]
            def fail = { Map m ->
                  result.error = [ code: m.code, args: ["Country"] ]
                  return result
            }

            params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
            result.results = Country.domain(loggedInuser.userCustomerCode).listAll.list(params)
            result.total = Country.domain(loggedInuser.userCustomerCode).listAll.count()

            if(!result.results || !result.total)
                  return fail(code:"default.list.failure")
            return result
      }
      def findById(id){
            def loggedInuser=springSecurityService.getCurrentUser()
            return Country.domain(loggedInuser.userCustomerCode).listAll.get(id);
      }
      def create(params){
            def result = [:]
            Country.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        if(result.country && m.field){
                              result.country.errors.rejectValue(m.field, m.code)
                        }
                        result.error = [ code: m.code ]
                        return result
                  }
                  result.country =new Country(params)
                  def instance=result.country.save(flush:true)
                  if(result.country.hasErrors() || !instance){
                        return fail(code:"default.create.failure")
                  }
                  return result;
            }
      }
      def update(params){
            def result = [:]
            Country.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        if(result.country && m.field){
                              result.country.errors.rejectValue(m.field, m.code)
                        }
                        result.error = [ code: m.code, args: ["Country", params.id] ]
                        return result
                  }
                  result.country = findById(params.id)
                  if(!result.country)
                        return fail(code:"default.not.found")

                  if(params.version) {
                        if(result.country.version > params.version.toLong())
                              return fail(field:"version", code:"default.optimistic.locking.failure")
                  }
                  result.country.properties=params;
                  def instance=result.country.save(flush:true)
                  if(result.country.hasErrors() || !instance){
                        return fail(code:"default.create.failure")
                  }
                  return result;
            }
      }
      def delete(params){
            def result = [:]
            Country.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        result.error = [ code: m.code, args: ["Country", params.id] ]
                        return result
                  }
                  result.country=findById(params.id)
                  if (!result.country) {
                        return fail(code:"default.not.found")
                  }
                  result.country.isDeleted=System.currentTimeMillis();
                  result.country.save(flush: true)
                  return result;
            }
      }
}
