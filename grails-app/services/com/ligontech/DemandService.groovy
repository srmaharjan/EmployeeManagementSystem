package com.ligontech

class DemandService {
	static transactional = false
	def grailsApplication
	def springSecurityService
	def searchService;

	def getAllDemands(){
		def currentUser=springSecurityService.getCurrentUser()
		def results = Demand.domain(currentUser.userCustomerCode).listAll.list()
		return results
	}
	def search(params){
		def query = params.query
		def result;
		params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
		if(query || params.search){
			result = searchService.searchDemand(params)
		}else{
			result=list(params)
		}
		return result;
	}

	def list(params) {
		def currentUser=springSecurityService.getCurrentUser()
		def result = [:]
		def fail = { Map m ->
			result.error = [ code: m.code, args: ["Demand"] ]
			return result
		}

		params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
		result.results = Demand.domain(currentUser.userCustomerCode).listAll.list(params)
		result.total = Demand.domain(currentUser.userCustomerCode).listAll.count()

		if(!result.results || !result.total)
			return fail(code:"default.list.failure")
		return result
	}
	def findById(id){
		def currentUser=springSecurityService.getCurrentUser()
		return Demand.domain(currentUser.userCustomerCode).listAll.get(id);
	}
	def create(params){
		def result = [:]
		Demand.withTransaction {status ->
			def fail = { Map m ->
				if (status.isRollbackOnly())
					status.setRollbackOnly()
				if(result.demand && m.field){
					result.demand.errors.rejectValue(m.field, m.code)
				}
				result.error = [ code: m.code ]
				return result
			}
			result.demand =new Demand(params)
			def instance=result.demand.save(flush:true)
			if(result.demand.hasErrors() || !instance){
				return fail(code:"default.create.failure")
			}
			return result;
		}
	}
	def update(params){
		def result = [:]
		Demand.withTransaction {status ->
			def fail = { Map m ->
				if (status.isRollbackOnly())
					status.setRollbackOnly()
				if(result.demand && m.field){
					result.demand.errors.rejectValue(m.field, m.code)
				}
				result.error = [ code: m.code, args: ["Demand", params.id] ]
				return result
			}
			result.demand = findById(params.id)
			if(!result.demand)
				return fail(code:"default.not.found")

			if(params.version) {
				if(result.demand.version > params.version.toLong())
					return fail(field:"version", code:"default.optimistic.locking.failure")
			}
			result.demand.properties=params;
			def instance=result.demand.save(flush:true)
			if(result.demand.hasErrors() || !instance){
				return fail(code:"default.create.failure")
			}
			return result;
		}
	}
	def delete(params){
		def result = [:]
		Demand.withTransaction {status ->
			def fail = { Map m ->
				if (status.isRollbackOnly())
					status.setRollbackOnly()
				result.error = [ code: m.code, args: ["Demand", params.id] ]
				return result
			}
			result.demand=findById(params.id)
			if (!result.demand) {
				return fail(code:"default.not.found")
			}
			result.demand.isDeleted=System.currentTimeMillis();
			result.demand.jobs*.isDeleted=System.currentTimeMillis();
			result.demand.save(flush: true)
			return result;
		}
	}
}
