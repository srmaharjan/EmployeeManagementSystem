package com.ligontech

import org.codehaus.groovy.grails.web.metaclass.BindDynamicMethod

class DemandServiceBackup {
    boolean transactional = false
    def create(params){
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
            println "params = $params"
            result.demandInstance = new Demand(params)
            def jobs=params.jobsList
            if(jobs instanceof String){
                jobs=[jobs]
            }
            jobs.each{
                println "{it.class} = ${it.class}"
                def map=        LigonUtils.queryStringToMap(it)
                println "map = $map"
                    params.putAll(map)
            }
            BindDynamicMethod bind = new BindDynamicMethod()

            def args =  [ result.demandInstance.jobs, params, [exclude:[]] ]

            bind.invoke( result.demandInstance.jobs, 'bind', args)
            println     result.demandInstance.jobs
            List listJobs=[]
            def jobList=JsonHelper.parseJson(params.jobs);
            jobList.each{
                Jobs job=new Jobs(it)
                job.facility?.clear()
                def facilities=it['facility.id']
                if(facilities){
                    if(facilities instanceof String){
                        facilities=[facilities]
                    }
                    def facilityList=FixedValue.executeQuery("from FixedValue where id in :ids and fieldType = :fieldType",[ids:facilities.collect{it as Long},fieldType:FieldType.FACILITY])
                    facilityList.each{
                        job.addToFacility(it)
                    }
                }
                listJobs.add(job)
            }
            listJobs.each{
                result.demandInstance.addToJobList(it)
            }
            def instance=result.demandInstance.save(flush:true)
            if(result.demandInstance.hasErrors() || !instance){
                return fail(code:"default.create.failure")
            }
            return result;
        }
    }

//    def update(params) {
//        Book.withTransaction { status ->
//            def result = [:]
//
//            def fail = { Map m ->
//                status.setRollbackOnly()
//                if(result.bookInstance && m.field)
//                    result.bookInstance.errors.rejectValue(m.field, m.code)
//                result.error = [ code: m.code, args: ["Book", params.id] ]
//                return result
//            }
//
//            result.bookInstance = Book.get(params.id)
//
//            if(!result.bookInstance)
//                return fail(code:"default.not.found")
//
//            // Optimistic locking check.
//            if(params.version) {
//                if(result.bookInstance.version > params.version.toLong())
//                    return fail(field:"version", code:"default.optimistic.locking.failure")
//            }
//
//            result.bookInstance.properties = params
//
//            if(result.bookInstance.hasErrors() || !result.bookInstance.save())
//                return fail(code:"default.update.failure")
//
//            // Success.
//            return result
//
//        } //end withTransaction
//    }
    //controller
//    def update = {
//        def result = bookService.update(params)
//
//        if(!result.error) {
//            flash.message = g.message(code: "default.update.success", args: ["Book", params.id])
//            redirect(action:show, id: params.id)
//            return
//        }
//
//        if(result.error.code == "default.not.found") {
//            flash.message = g.message(code: result.error.code, args: result.error.args)
//            redirect(action:list)
//            return
//        }
//
//        render(view:'edit', model:[bookInstance: result.bookInstance.attach()])
//    }
//    public List parseJson(def json){
//        if(json instanceof String){
//            json=[json]
//        }
//        List result=[]
//        json.each{
//            def jsonData=grails.converters.JSON.parse(it)
//            def data=[:]
//            jsonData.each{
//                if(it['name']){
//                    if(data.containsKey(it['name'])){
//                        def value=data[it['name']]
//                        if(value instanceof List){
//                            value.add(it['value'])
//                        }else{
//                            value=[value,it['value']]
//                        }
//                        data[it['name']]=value
//                    }else{
//                        data[it['name']]=it['value']
//                    }
//                }
//            }
//            result.add(data);
//        }
//        return result;
//    }
}
