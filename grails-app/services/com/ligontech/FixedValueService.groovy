package com.ligontech

class FixedValueService {
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
                        result.error = [ code: m.code, args: ["FixedValue"] ]
                        return result
                  }
                  result = searchService.search(FixedValue,params,['value','description','fieldType'])
            }else{
                  result=list(params)
            }
            return result;
      }

      def list(params) {
            def currentUser=springSecurityService.getCurrentUser()
            def result = [:]
            def fail = { Map m ->
                  result.error = [ code: m.code, args: ["FixedValue"] ]
                  return result
            }

            params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
            result.results = FixedValue.domain(currentUser.userCustomerCode).listAll.list(params)
            result.total = FixedValue.domain(currentUser.userCustomerCode).listAll.count()

            if(!result.results || !result.total)
                  return fail(code:"default.list.failure")
            return result
      }
      def findById(id){
            def currentUser=springSecurityService.getCurrentUser()
            return FixedValue.domain(currentUser.userCustomerCode).listAll.get(id);
      }
      def create(params){
            def result = [:]
            FixedValue.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        if(result.fixedValue && m.field){
                              result.fixedValue.errors.rejectValue(m.field, m.code)
                        }
                        result.error = [ code: m.code ]
                        return result
                  }
                  result.fixedValue =new FixedValue(params)
                  def instance=result.fixedValue.save(flush:true)
                  if(result.fixedValue.hasErrors() || !instance){
                        return fail(code:"default.create.failure")
                  }
                  return result;
            }
      }
      def update(params){
            def result = [:]
            FixedValue.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        if(result.fixedValue && m.field){
                              result.fixedValue.errors.rejectValue(m.field, m.code)
                        }
                        result.error = [ code: m.code, args: ["FixedValue", params.id] ]
                        return result
                  }
                  result.fixedValue = findById(params.id)
                  if(!result.fixedValue)
                        return fail(code:"default.not.found")

                  if(params.version) {
                        if(result.fixedValue.version > params.version.toLong())
                              return fail(field:"version", code:"default.optimistic.locking.failure")
                  }
                  result.fixedValue.properties=params;
                  def instance=result.fixedValue.save(flush:true)
                  if(result.fixedValue.hasErrors() || !instance){
                        return fail(code:"default.create.failure")
                  }
                  return result;
            }
      }
      def delete(params){
            def result = [:]
            FixedValue.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        result.error = [ code: m.code, args: ["FixedValue", params.id] ]
                        return result
                  }
                  result.fixedValue=findById(params.id)
                  if (!result.fixedValue) {
                        return fail(code:"default.not.found")
                  }
                  result.fixedValue.isDeleted=System.currentTimeMillis();
                  result.fixedValue.save(flush: true)
                  return result;
            }
      }
}
