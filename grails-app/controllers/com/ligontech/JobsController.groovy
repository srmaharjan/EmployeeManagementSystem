package com.ligontech

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.apache.shiro.authz.annotation.Logical
import org.apache.shiro.authz.annotation.RequiresPermissions

@Secured(['IS_AUTHENTICATED_FULLY'])
class JobsController {
      def springSecurityService
      def jobsService

      static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
      @RequiresPermissions(value=['jobs:view','jobs:create','jobs:delete','jobs:update'],logical=Logical.OR)
      def search() {
            def result = jobsService.search(params)
            def model=jobsService.requiredResources();
            if(result.error) {
                  model=model+ [jobsInstanceList: [], jobsInstanceTotal:0]
                  flash.message = g.message(code: result.error?.code, args: result.error?.args)
                  render(view: "list", model: model)
            }
            model=model+ [jobsInstanceList: result?.results, jobsInstanceTotal: result?.total]
            render(view: "list", model: model)
      }
      @RequiresPermissions(value=['jobs:view','jobs:create','jobs:delete','jobs:update'],logical=Logical.OR)
      def index() {
            redirect(action: "list", params: params)
      }

      @RequiresPermissions(value=['jobs:view','jobs:create','jobs:delete','jobs:update'],logical=Logical.OR)
      def list(Integer max) {
            def result = jobsService.list(params)
            def model=jobsService.requiredResources();
            if(!result.error) {
                  model=model+ [jobsInstanceList: result?.results, jobsInstanceTotal: result?.total]
                  render(view: "list", model:model)
                  return;
            }
            flash.message = g.message(code: result.error.code, args: result.error.args)
            render(view: "list", model: [jobsInstanceList: [], jobsInstanceTotal:0])
      }
      def findAllByDemand(){
            def demand = demandService.findById(params.demand.id);
            def result=[:]
            demand?.jobs?.each{
                  result.put(it.id,it.toString());
            }
            println "result = $result"
            render (result as JSON)
      }
      def demandService;
      @RequiresPermissions('jobs:create')
      def create() {
            def modal=jobsService.requiredResources();
            if(params.demand){
                  def demand=demandService.findById(params.demand)
                  def jobsInstance=new Jobs();
                  jobsInstance.demand=demand;
                  modal=modal+[jobsInstance: jobsInstance]
            }
            modal
      }

      @RequiresPermissions('jobs:create')
      def save() {
            def result=jobsService.create(params)
            if(!result.error) {
                  flash.message = message(code: 'default.created.message', args: [message(code: 'jobs.label', default: 'Jobs'), result?.jobs.id])
                  redirect(action: "show", id: result?.jobs.id)
                  return
            }
            render(view: "create", model: [jobsInstance: result?.jobs]+ jobsService.requiredResources())
      }

      @RequiresPermissions(value=['jobs:view','jobs:create','jobs:delete','jobs:update'],logical=Logical.OR)
      def show(Integer id) {
            def jobsInstance = jobsService.findById(id);
            if (!jobsInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'jobs.label', default: 'Jobs'), id])
                  redirect(action: "list")
                  return
            }
            [jobsInstance: jobsInstance]
      }

      @RequiresPermissions('jobs:update')
      def edit(Integer id) {
            def model=jobsService.requiredResources();
            def jobsInstance =jobsService.findById(id);
            if (!jobsInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'jobs.label', default: 'Jobs'), id])
                  redirect(action: "list")
                  return
            }
            [jobsInstance: jobsInstance]+model
      }

      @RequiresPermissions('jobs:update')
      def update(Integer id, Long version) {
            def result=jobsService.update(params)
            if(!result.error) {
                  flash.message = message(code: 'default.updated.message', args: [message(code: 'jobs.label', default: 'Jobs'), result?.jobs.id])
                  redirect(action: "show", id: result?.jobs.id)
                  return
            }

            if(result.error.code == "default.not.found") {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'jobs.label', default: 'Jobs'), id])
                  redirect(action: "list")
                  return
            }
            render(view: "edit", model: [jobsInstance: result.jobs.attach()])
      }

      @RequiresPermissions('jobs:delete')
      def delete(Integer id) {
            def jobsInstance = jobsService.findById(id)
            if (!jobsInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'jobs.label', default: 'Jobs'), id])
                  redirect(action: "list")
                  return
            }
            def result=jobsService.delete(jobsInstance)
            if(!result.error) {
                  flash.message = message(code: 'default.deleted.message', args: [message(code: 'jobs.label', default: 'Jobs'), id])
                  redirect(action: "list");
                  return
            }
            if(result.error.code == "default.not.found") {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'jobs.label', default: 'Jobs'), id])
                  redirect(action: "list")
                  return
            }
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'jobs.label', default: 'Jobs'), id])
            redirect(action: "show", id: id)
      }

}
