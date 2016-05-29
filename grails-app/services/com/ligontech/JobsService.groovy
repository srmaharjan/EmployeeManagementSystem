package com.ligontech

class JobsService {
      static transactional = false
      def grailsApplication
      def springSecurityService
      def searchService;
      def demandService

      def search(params){
            def query = params.query
            def result;
            params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
            if(query){
                  def fail = { Map m ->
                        result.error = [ code: m.code, args: ["Jobs"] ]
                        return result
                  }
                  result = searchService.searchJobs(params)
            }else{
                  result=list(params)
            }
            return result;
      }

      def list(params) {
            def currentUser=springSecurityService.getCurrentUser()
            def result = [:]
            def fail = { Map m ->
                  result.error = [ code: m.code, args: ["Jobs"] ]
                  return result
            }

            params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
            result.results = Jobs.domain(currentUser.userCustomerCode).listAll.list(params)
            result.total = Jobs.domain(currentUser.userCustomerCode).listAll.count()

            if(!result.results || !result.total)
                  return fail(code:"default.list.failure")
            return result
      }
      def findById(id){
            def currentUser=springSecurityService.getCurrentUser()
            return Jobs.domain(currentUser.userCustomerCode).listAll.get(id);
      }
      def create(params){
            def result = [:]
            Jobs.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        if(result.jobs && m.field){
                              result.jobs.errors.rejectValue(m.field, m.code)
                        }
                        result.error = [ code: m.code ]
                        return result
                  }
                  def demand=demandService.findById(params.demand.id)
                  result.jobs =new Jobs(params)
                  demand.addToJobs(result.jobs)
                  demand.save(flush: true)
                  if(result.jobs.hasErrors() || !result.jobs.id){
                        return fail(code:"default.create.failure")
                  }
                  return result;
            }
      }
      def update(params){
            def result = [:]
            Jobs.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        if(result.jobs && m.field){
                              result.jobs.errors.rejectValue(m.field, m.code)
                        }
                        result.error = [ code: m.code, args: ["Jobs", params.id] ]
                        return result
                  }
                  result.jobs = findById(params.id)
                  if(!result.jobs)
                        return fail(code:"default.not.found")

                  if(params.version) {
                        if(result.jobs.version > params.version.toLong())
                              return fail(field:"version", code:"default.optimistic.locking.failure")
                  }
                  result.jobs.facility.clear();
                  result.jobs.gender=null;
                  result.jobs.properties=params;

                  result.jobs.save(flush:true)

                  Jobs.executeUpdate('update Jobs set demand.id=:demandId where id=:id',[demandId:result.jobs.demand.id,id:result.jobs.id])

                  if(result.jobs.hasErrors()){
                        return fail(code:"default.create.failure")
                  }
                  return result;
            }
      }
      def delete(params){
            def result = [:]
            Jobs.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        result.error = [ code: m.code, args: ["Jobs", params.id] ]
                        return result
                  }
                  result.jobs=findById(params.id)
                  if (!result.jobs) {
                        return fail(code:"default.not.found")
                  }
                  result.jobs.facility.clear();
                  result.jobs.isDeleted=System.currentTimeMillis();
                  result.jobs.save(flush: true)
                  return result;
            }
      }

      Map requiredResources(){
            def currentUser=springSecurityService.getCurrentUser()
            List<FixedValue> fixedValues= FixedValue.domain(currentUser.userCustomerCode).listAll.list()
            def ageGroups=fixedValues.findAll{it.fieldType==FieldType.AGEGROUP}
            def facilities=fixedValues.findAll{it.fieldType==FieldType.FACILITY}
            def genders=fixedValues.findAll{it.fieldType==FieldType.GENDER}

            def demands=Demand.domain(currentUser.userCustomerCode).listAll.list()
            def jobCategories=JobCategory.domain(currentUser.userCustomerCode).listAll.list()
            return  [ageGroups:ageGroups,facilities:facilities,genders:genders,demands:demands,jobCategories:jobCategories]
      }
}
