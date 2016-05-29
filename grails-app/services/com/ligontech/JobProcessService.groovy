package com.ligontech

class JobProcessService {
	static transactional = true
	def grailsApplication
	def springSecurityService
	def searchService;
	def jobseekerService
	def jobsService
	def demandService
	def processService
	def agentService

	def search(params){
		def query = params.query
		def result;
		params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
		result = searchService.searchApplicationProcess(params)

		return result;
	}
	def list(params) {
		def currentUser=springSecurityService.getCurrentUser()
		def result = [:]
		def fail = { Map m ->
			result.error = [ code: m.code, args: ["ApplicationProcess"] ]
			return result
		}

		params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
		result.results = ApplicationProcess.domain(currentUser.userCustomerCode).list(params)
		result.total = ApplicationProcess.domain(currentUser.userCustomerCode).count()

		if(!result.results || !result.total)
			return fail(code:"default.list.failure")
		return result
	}
	def findById(id){
		def currentUser=springSecurityService.getCurrentUser()
		return ApplicationProcess.domain(currentUser.userCustomerCode).get(id);
	}
	def create(params){
		def result = [:]
		ApplicationProcess.withTransaction {status ->

			def fail = { Map m ->
				if (status.isRollbackOnly())
					status.setRollbackOnly()
				if(result.applicationProcess && m.field){
					result.applicationProcess.errors.rejectValue(m.field, m.code)
				}
				result.error = [ code: m.code ]
				return result
			}
			try{
				result.applicationProcess =new ApplicationProcess(params)
				result.applicationProcess.jobseeker=jobseekerService.findById(params.jobseeker?.id?.toLong());
//                  if (result.applicationProcess.jobseeker.version > params.jobseeker.version.toLong()) {
//                        return fail(code:"default.optimistic.locking.failure")
//                  }
				result.applicationProcess.demand=demandService.findById(params.demand?.id?.toLong())
//                  Process process=Process.findByCodeAndCountry('Reg-'+result.applicationProcess.demand.company.address.country.id,result.applicationProcess.demand.company.address.country)
				Process process=processService.findByCountryAndIsFirstProcess(result.applicationProcess.demand.company.address.country,true);
				if(!process){
					process=processService.findByCountryAndIsFirstProcess(null,true);
				}
				if(!process){
					return fail(code:"default.process.notfound")
				}
				result.applicationProcess.process=process
				result.applicationProcess.jobseeker.isReadyToApply=process.getCanApplyOtherJob();
				if(params.passportProcess=='Collected'){
					result.passportProcess=new PassportProcess();
					result.passportProcess.collectedBy=''
					result.passportProcess.passport=result.applicationProcess.jobseeker.passport;
					result.passportProcess.status=params.passportProcess;
					if(result.passportProcess.save(flush: true)){
						return fail(code:"default.create.failure")
					}
				}

				result.applicationProcess.jobs=jobsService.findById(params.jobs?.id?.toLong())
				result.applicationProcess.jobseeker.save(flush: true)
				def instance=result.applicationProcess.save(flush:true)
				if(result.applicationProcess.hasErrors() || !instance){
					return fail(code:"default.create.failure")
				}
			}catch(e){
				log.error(e.getMessage())
				if (status.isRollbackOnly())
					status.setRollbackOnly()
			}

			return result;

		}
	}
	def update(params){
		def result = [:]
		ApplicationProcess.withTransaction {status ->
			def fail = { Map m ->
				if (status.isRollbackOnly())
					status.setRollbackOnly()
				if(result.applicationProcess && m.field){
					result.applicationProcess.errors.rejectValue(m.field, m.code)
				}
				result.error = [ code: m.code, args: ["ApplicationProcess", params.id] ]
				return result
			}
			result.applicationProcess = findById(params.id)
			if(!result.applicationProcess)
				return fail(code:"default.not.found")

			if(params.version) {
				if(result.applicationProcess.version > params.version.toLong())
					return fail(field:"version", code:"default.optimistic.locking.failure")
			}
			result.applicationProcess.properties=params;
			def instance=result.applicationProcess.save(flush:true)
			if(result.applicationProcess.hasErrors() || !instance){
				return fail(code:"default.create.failure")
			}
			return result;
		}
	}
	def delete(params){
		def result = [:]
		ApplicationProcess.withTransaction {status ->
			def fail = { Map m ->
				if (status.isRollbackOnly())
					status.setRollbackOnly()
				result.error = [ code: m.code, args: ["ApplicationProcess", params.id] ]
				return result
			}
			result.applicationProcess=findById(params.id)
			if (!result.applicationProcess) {
				return fail(code:"default.not.found")
			}
			result.applicationProcess.isDeleted=System.currentTimeMillis();
			result.applicationProcess.save(flush: true)
			return result;
		}
	}
	Map requiredResources(){
		//demandd,process,agent
		def demands=demandService.getAllDemands();
		def process=processService.getAllProcess();
		def agents=agentService.getAllAgents();
		return [demands:demands,agents:agents,processes:process]
	}
}
