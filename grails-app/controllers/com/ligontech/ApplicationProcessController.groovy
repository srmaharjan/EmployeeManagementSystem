package com.ligontech

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.apache.shiro.authz.annotation.Logical
import org.apache.shiro.authz.annotation.RequiresPermissions
import org.springframework.dao.DataIntegrityViolationException


@Secured(['IS_AUTHENTICATED_FULLY'])
class ApplicationProcessController {
	def springSecurityService
	def jobProcessService
	def processService
	def agentService

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	@RequiresPermissions(value=['applicationProcess:view','applicationProcess:create','applicationProcess:delete','applicationProcess:update'],logical=Logical.OR)
	def search() {
		def result = jobProcessService.search(params)
		def model=jobProcessService.requiredResources();
		if(result.error) {
			flash.message = g.message(code: result.error?.code, args: result.error?.args)
			render(view: "list", model: model+[applicationProcessInstanceList: [], applicationProcessInstanceTotal:0])
		}
		render(view: "list", model: model+[applicationProcessInstanceList: result?.results, applicationProcessInstanceTotal: result?.total])
	}
	@RequiresPermissions(value=['applicationProcess:view','applicationProcess:create','applicationProcess:delete','applicationProcess:update'],logical=Logical.OR)
	def index() {
		redirect(action: "list", params: params)
	}

	@RequiresPermissions(value=['applicationProcess:view','applicationProcess:create','applicationProcess:delete','applicationProcess:update'],logical=Logical.OR)
	def list(Integer max) {
		def result = jobProcessService.list(params)
		def model=jobProcessService.requiredResources();
		if(!result.error) {
			render(view: "list", model: model+[applicationProcessInstanceList: result?.results, applicationProcessInstanceTotal: result?.total])
			return;
		}
		flash.message = g.message(code: result.error.code, args: result.error.args)
		render(view: "list", model: model+[applicationProcessInstanceList: [], applicationProcessInstanceTotal:0])
	}

	@RequiresPermissions('applicationProcess:create')
	def create() {

	}

	@RequiresPermissions('applicationProcess:create')
	def save() {
		def result=jobProcessService.create(params)
		if(!result.error) {
			render ServerCode.SUCCESS
			return
		}
		render ServerCode.ERROR
	}

	@RequiresPermissions(value=['applicationProcess:view','applicationProcess:create','applicationProcess:delete','applicationProcess:update'],logical=Logical.OR)
	def show(Integer id) {
		def applicationProcessInstance = jobProcessService.findById(id);
		if (!applicationProcessInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicationProcess.label', default: 'ApplicationProcess'), id])
			redirect(action: "list")
			return
		}
		[applicationProcessInstance: applicationProcessInstance]
	}

	@Secured(["hasRole('SUPERMAN')"])
	def edit(Integer id) {
		def applicationProcessInstance =jobProcessService.findById(id);
		if (!applicationProcessInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicationProcess.label', default: 'ApplicationProcess'), id])
			redirect(action: "list")
			return
		}
		[applicationProcessInstance: applicationProcessInstance]
	}

	@Secured(["hasRole('SUPERMAN')"])
	def update(Integer id, Long version) {
		def result=jobProcessService.update(params)
		if(!result.error) {
			flash.message = message(code: 'default.updated.message', args: [message(code: 'applicationProcess.label', default: 'ApplicationProcess'), result?.applicationProcess.id])
			redirect(action: "show", id: result?.applicationProcess.id)
			return
		}

		if(result.error.code == "default.not.found") {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicationProcess.label', default: 'ApplicationProcess'), id])
			redirect(action: "list")
			return
		}
		render(view: "edit", model: [applicationProcessInstance: result.applicationProcess.attach()])
	}

	@Secured(["hasRole('SUPERMAN')"])
	def delete(Integer id) {
		def applicationProcessInstance = jobProcessService.findById(id)
		if (!applicationProcessInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicationProcess.label', default: 'ApplicationProcess'), id])
			redirect(action: "list")
			return
		}
		def result=jobProcessService.delete(applicationProcessInstance)
		if(!result.error) {
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'applicationProcess.label', default: 'ApplicationProcess'), id])
			redirect(action: "list");
			return
		}
		if(result.error.code == "default.not.found") {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicationProcess.label', default: 'ApplicationProcess'), id])
			redirect(action: "list")
			return
		}
		flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'applicationProcess.label', default: 'ApplicationProcess'), id])
		redirect(action: "show", id: id)
	}

	@RequiresPermissions('applicationProcess:create')
	def ajaxJobseeker(){
		println "params = $params"
		String demandId=params.demandId;
		String jobId=params.jobId;
		println "jobId = ${params.jobId}"
		println "demandId = ${params.demandId}"
//            def at=ApplicationProcess.withCriteria {
//                  inList "dateCreated", new grails.gorm.DetachedCriteria(ApplicationProcess).build {
//                        demand{
//                              eq('id',demandId)
//                        }
//                        jobs{
//                              eq('id',jobId)
//                        }
//                        projections {
//                              max "dateCreated"
//                        }
////                        groupProperty("jobseeker.id")
//                  }
//            }
//            println "at = $at"

		def st=ApplicationProcess.executeQuery("from ApplicationProcess where demand.id=:demandId and jobs.id=:jobId group by jobseeker.id",[demandId:demandId.toLong(),jobId:jobId.toLong()])
		println "st = $st"
		def applicationProcess=ApplicationProcess.executeQuery("select ap from ApplicationProcess ap where dateCreated in (select max(dateCreated) from ApplicationProcess where demand.id=:demandId and jobs.id=:jobId group by jobseeker.id)",[demandId:demandId.toLong(),jobId:jobId.toLong()]);
		println "applicationProcess = $applicationProcess"
		render (template: "jobseeker",model: [applicationProcessList:applicationProcess])
//            withFormat {
//                  json {
//                        render applicationProcess as JSON
//                  }
//                  html {
//                        render (template: "jobseeker",model: [applicationProcessList:applicationProcess])
//                  }
//            }
//            def jobseekers=Jobseeker.executeQuery("select j from Jobseeker j inner join ApplicationProcess a where j in " +
//                  "(select distinct ap.jobseeker from ApplicationProcess ap where ap.demand.id =:demandId and ap.jobs.id = :jobsId and dateCreated in " +
//                  "(select max(dateCreated) from ApplicationProcess where demand.id=:demandId2 and jobs.id=:jobsId2 group by demand.id ,jobs.id , jobseeker.id))",[:])
	}
	@RequiresPermissions('applicationProcess:view')
	def processStatus(){
		def agentList=agentService.getAllAgents();
		def processList=processService.getAllProcess();
		render (view: "processStatus",model:[agentList:agentList,processList:processList])
	}
	@RequiresPermissions('applicationProcess:view')
	def processStatusResult(){

	}
}
