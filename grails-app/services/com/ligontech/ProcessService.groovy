package com.ligontech

class ProcessService {
      static transactional = false
      def grailsApplication
      def springSecurityService
      def searchService;
      def getAllProcess(){
            def currentUser=springSecurityService.getCurrentUser()
            def results = Process.domain(currentUser.userCustomerCode).listAll.list()
            return results;
      }
      def list(params) {
            def currentUser=springSecurityService.getCurrentUser()
            def result = [:]
            def fail = { Map m ->
                  result.error = [ code: m.code, args: ["Process"] ]
                  return result
            }

            params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
            result.results = Process.domain(currentUser.userCustomerCode).listAll.list(params)
            result.total = Process.domain(currentUser.userCustomerCode).listAll.count()

            if(!result.results || !result.total)
                  return fail(code:"default.list.failure")
            return result
      }
      def findById(id){
            def currentUser=springSecurityService.getCurrentUser()
            return Process.domain(currentUser.userCustomerCode).listAll.get(id);
      }
      def findByCode(code){
            def currentUser=springSecurityService.getCurrentUser()
            return Process.domain(currentUser.userCustomerCode).listAll.findWhere{it.code==code}
      }
      def findByCountryAndIsFirstProcess(country,isFirstProcess){
            def currentUser=springSecurityService.getCurrentUser()
            if(country)
                  return Process.domain(currentUser.userCustomerCode).listAll.findByCountryAndIsFirstStep(country,isFirstProcess)
            else{
                  return Process.domain(currentUser.userCustomerCode).listAll.findByCountryIsNullAndIsFirstStep(isFirstProcess)
            }
      }

      def create(params){
            def result = [:]
            Process.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        if(result.process && m.field){
                              result.process.errors.rejectValue(m.field, m.code)
                        }
                        result.error = [ code: m.code ]
                        return result
                  }
                  result.process =new Process(params)
                  if(result.process.code){
                        result.process.code=result.process.code.toUpperCase();
                  }
                  def instance=result.process.save(flush:true)
                  if(result.process.hasErrors() || !instance){
                        return fail(code:"default.create.failure")
                  }
                  return result;
            }
      }
      def update(params){
            def result = [:]
            Process.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        if(result.process && m.field){
                              result.process.errors.rejectValue(m.field, m.code)
                        }
                        result.error = [ code: m.code, args: ["Process", params.id] ]
                        return result
                  }
                  result.process = findById(params.id)
                  if(!result.process)
                        return fail(code:"default.not.found")

                  if(params.version) {
                        if(result.process.version > params.version.toLong())
                              return fail(field:"version", code:"default.optimistic.locking.failure")
                  }
                  result.process.properties=params;
                  def instance=result.process.save(flush:true)
                  if(result.process.hasErrors() || !instance){
                        return fail(code:"default.create.failure")
                  }
                  return result;
            }
      }
      def delete(params){
            def result = [:]
            Process.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        result.error = [ code: m.code, args: ["Process", params.id] ]
                        return result
                  }
                  result.process=findById(params.id)
                  if (!result.process) {
                        return fail(code:"default.not.found")
                  }
                  result.process.isDeleted=System.currentTimeMillis();
                  result.process.save(flush: true)
                  return result;
            }
      }
      def findAllCountry(){
            def currentUser=springSecurityService.getCurrentUser();
            def countryList=Process.executeQuery('select distinct p.country from Process p where p.customer.ltCode=:customerId and p.isDeleted=0L',[customerId:currentUser.userCustomerCode]);
            return [];
      }
      def findAllByCountry(countryId){
            def currentUser=springSecurityService.getCurrentUser();
            if(countryId){
                  return Process.executeQuery('from Process where customer.ltCode=:customerId and isDeleted=0L and includeInProcess=true and country.id=:countryId',[customerId:currentUser.userCustomerCode,countryId:countryId]);
            }else{
                  return Process.executeQuery('from Process where customer.ltCode=:customerId and isDeleted=0L and includeInProcess=true and country is null',[customerId:currentUser.userCustomerCode]);
            }
      }
      def updateStepOrder(params){
            println "params = $params"
            def result=[status:ServerCode.SUCCESS]
            Process.withTransaction {status ->
                  def processCodes=params['order[]'];
                  println "processCodes = $processCodes"
                  try{
                        processCodes.eachWithIndex{item,index ->
                              println "item = $item"
                              println "index = $index"
                              //def process=findById(item);
                              def process=Process.get(item);
                              process.step=(index+1)
                              process.save(flush:true)

                        }
                  }catch (e){
                        result.status=ServerCode.ERROR;
                        log.error(e.getMessage());
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                  }
            }
            return result;
      }
}
