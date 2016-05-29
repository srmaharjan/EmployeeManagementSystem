package com.ligontech

class DemandServiceLayoutBackup {

    private def update(params){
        def result = [:]
        Demand.withTransaction {status ->
            def fail = { Map m ->
                status.setRollbackOnly()
                if(result.demandInstance && m.field){
                    result.demandInstance.errors.rejectValue(m.field, m.code)
                }
                result.error = [ code: m.code ]
                return result
            }
            result.demandInstance = Demand.get(params.id)
            if (!result.demandInstance) {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'demand.label', default: 'Demand'), id])
                redirect(action: "list")
                return
            }
            if(params.version) {
                if(result.demandInstance.version > params.version.toLong())
                    return fail(field:"version", code:"default.optimistic.locking.failure")
            }
            def updatedParams=updateParams(params)
            result.demandInstance.jobs.each{
                it.facility?.clear()
            }
            result.demandInstance.properties = updatedParams
            result.demandInstance.jobs.removeAll(result.demandInstance.jobs.findAll {it==new Jobs()})
            def instance=result.demandInstance.save(flush:true)
            if(result.demandInstance.hasErrors() || !instance){
                return fail(code:"default.create.failure")
            }
            return result;
        }
    }

    public def create(params){
        def result = [:]
        Demand.withTransaction {status ->
            def fail = { Map m ->
                status.setRollbackOnly()
                if(result.demandInstance && m.field){
                    result.demandInstance.errors.rejectValue(m.field, m.code)
                }
                result.error = [ code: m.code ]
                return result
            }
            result.demandInstance = bindDemand(params);
            def instance=result.demandInstance.save(flush:true)
            if(result.demandInstance.hasErrors() || !instance){
                return fail(code:"default.create.failure")
            }
            return result;
        }
    }

    private Demand bindDemand(params)  {
        def updateParams=updateParams(params)
        def demandInstance = new Demand(updateParams)
        demandInstance.jobs.removeAll(demandInstance.jobs.findAll {it==new Jobs()})
        return demandInstance
    }
    private def updateParams(params){
        def jobsList=params.jobsList
        if(jobsList instanceof String){
            jobsList=[jobsList]
        }
        jobsList.each{
            Map map=LigonUtils.jsonToGroovyMap(it)
            for (keyValue in map) {
                if (keyValue.key.toString().endsWith('facility.id')) {
                    def key = keyValue.key.toString();
                    def value = keyValue.value;
                    if (value instanceof String) {
                        map[key.replace('.id', '[0].id')] = value
                    } else {
                        def index = 0
                        value.each {
                            println "index = $index"
                            map[key.replace('.id', "[${index++}].id")]=it
                        }
                    }
                    break;
                }
            }
            params.putAll(map)
        }
        return params;
    }
}
