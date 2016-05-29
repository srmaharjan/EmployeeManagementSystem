package com.ligontech

class CompanyService {
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
                        result.error = [ code: m.code, args: ["Company"] ]
                        return result
                  }
                  result = searchService.search(Company,params,['name','email','website','phone','address'])
            }else{
                  result=list(params)
            }
            return result;
      }
      def list(params) {
            def currentUser=springSecurityService.getCurrentUser()
            def result = [:]
            def fail = { Map m ->
                  result.error = [ code: m.code, args: ["Company"] ]
                  return result
            }

            params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
            result.results = Company.domain(currentUser.userCustomerCode).listAll.list(params)
            result.total = Company.domain(currentUser.userCustomerCode).listAll.count()

            if(!result.results || !result.total)
                  return fail(code:"default.list.failure")
            return result
      }
      def findById(id){
            def currentUser=springSecurityService.getCurrentUser()
            return Company.domain(currentUser.userCustomerCode).listAll.get(id);
      }
      def create(params){
            def result = [:]
            Company.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly()){
                              status.setRollbackOnly()
                        }
                        if(result.company && m.field){
                              result.company.errors.rejectValue(m.field, m.code)
                        }
                        result.error = [ code: m.code ]
                        return result
                  }
                  result.company  = new Company(params)
                  def instance=result.company.save(failOnError: true, flush: true)
                  if(result.company.hasErrors() || !instance){
                        return fail(code:"default.create.failure")
                  }
                  return result;
            }

      }

      def update(params){
            def result = [:]
            Company.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        if(result.company && m.field){
                              result.company.errors.rejectValue(m.field, m.code)
                        }
                        result.error = [ code: m.code, args: ["Company", params.id] ]
                        return result
                  }
                  result.company = findById(params.id)
                  if(!result.company)
                        return fail(code:"default.not.found")

                  if(params.version) {
                        if(result.company.version > params.version.toLong())
                              return fail(field:"version", code:"default.optimistic.locking.failure")
                  }
                  result.company.properties=params;
                  def instance=result.company.save(flush:true)
                  if(result.company.hasErrors() || !instance){
                        return fail(code:"default.create.failure")
                  }
                  return result;

            }
      }
      def delete(params){
            def result = [:]
            Company.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        result.error = [ code: m.code, args: ["Company", params.id] ]
                        return result
                  }
                  result.company=findById(params.id)
                  if (!result.company) {
                        return fail(code:"default.not.found")
                  }
                  result.company.isDeleted=System.currentTimeMillis();
                  result.company.address.isDeleted=System.currentTimeMillis();
                  result.company.save(flush: true)
                  return result;
            }
      }
}
