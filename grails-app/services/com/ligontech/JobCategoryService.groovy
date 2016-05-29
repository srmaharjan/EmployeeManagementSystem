package com.ligontech

class JobCategoryService {
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
                        result.error = [ code: m.code, args: ["JobCategory"] ]
                        return result
                  }
                  result = searchService.search(JobCategory,params,['value','description'])
            }else{
                  result=list(params)
            }
            return result;
      }

      def list(params) {
            def currentUser=springSecurityService.getCurrentUser()
            def result = [:]
            def fail = { Map m ->
                  result.error = [ code: m.code, args: ["JobCategory"] ]
                  return result
            }

            params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
            result.results = JobCategory.domain(currentUser.userCustomerCode).listAll.list(params)
            result.total = JobCategory.domain(currentUser.userCustomerCode).listAll.count()

            if(!result.results || !result.total)
                  return fail(code:"default.list.failure")
            return result
      }
      def findById(id){
            def currentUser=springSecurityService.getCurrentUser()
            return JobCategory.domain(currentUser.userCustomerCode).listAll.get(id);
      }
      def create(params){
            def result = [:]
            JobCategory.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        if(result.jobCategory && m.field){
                              result.jobCategory.errors.rejectValue(m.field, m.code)
                        }
                        result.error = [ code: m.code ]
                        return result
                  }
                  result.jobCategory =new JobCategory(params)
                  def instance=result.jobCategory.save(flush:true)
                  if(result.jobCategory.hasErrors() || !instance){
                        return fail(code:"default.create.failure")
                  }
                  return result;
            }
      }
      def update(params){
            def result = [:]
            JobCategory.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        if(result.jobCategory && m.field){
                              result.jobCategory.errors.rejectValue(m.field, m.code)
                        }
                        result.error = [ code: m.code, args: ["JobCategory", params.id] ]
                        return result
                  }
                  result.jobCategory = findById(params.id)
                  if(!result.jobCategory)
                        return fail(code:"default.not.found")

                  if(params.version) {
                        if(result.jobCategory.version > params.version.toLong())
                              return fail(field:"version", code:"default.optimistic.locking.failure")
                  }
                  result.jobCategory.properties=params;
                  def instance=result.jobCategory.save(flush:true)
                  if(result.jobCategory.hasErrors() || !instance){
                        return fail(code:"default.create.failure")
                  }
                  return result;
            }
      }
      def delete(params){
            def result = [:]
            JobCategory.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        result.error = [ code: m.code, args: ["JobCategory", params.id] ]
                        return result
                  }
                  result.jobCategory=findById(params.id)
                  if (!result.jobCategory) {
                        return fail(code:"default.not.found")
                  }
                  result.jobCategory.isDeleted=System.currentTimeMillis();
                  result.jobCategory.save(flush: true)
                  return result;
            }
      }
}
