package com.ligontech

class ApplicationProcessService {

      public def create(params){
            def result = [:]
            ApplicationProcess.withTransaction {status ->
                  def fail = { Map m ->
                        status.setRollbackOnly()
                        if(result.applicationProcess && m.field){
                              result.applicationProcess.errors.rejectValue(m.field, m.code)
                        }
                        result.error = [ code: m.code ]
                        return result
                  }
                  result.applicationProcess = bindApplicationProcess(params);
                  def instance=result.applicationProcess.save(flush:true)
                  if(result.applicationProcess.hasErrors() || !instance){
                        return fail(code:"default.create.failure")
                  }
                  result.jobseeker=Jobseeker.findById(result.applicationProcess.jobseeker.id);
                  if (result.jobseeker.version > params.jversion) {
                        return fail(code:"default.optimistic.locking.failure")
                  }
                  jobseeker.status=Process.findByCodeAndCountry('Reg-'+result.applicationProcess.demand.country.code,result.applicationProcess.demand.country)
                  if(!jobseeker.status){
                        jobseeker.status=Process.findByCode('Reg')
                  }
                  if(params.passportProcess=='Collected'){
                        result.passportProcess=new PassportProcess();
                        result.passportProcess.collectedBy=''
                        result.passportProcess.passport=jobseeker.passport;
                        result.passportProcess.status=params.passportProcess;
                        if(result.passportProcess.save(flush: true)){
                              return fail(code:"default.create.failure")
                        }
                  }
                  return result;
            }
      }
      private ApplicationProcess bindApplicationProcess(params)  {
            def applicationProcess = new ApplicationProcess(params)
            return applicationProcess
      }

}
