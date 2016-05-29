package com.ligontech

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.apache.shiro.authz.annotation.Logical
import org.apache.shiro.authz.annotation.RequiresPermissions
import org.springframework.dao.DataIntegrityViolationException


@Secured(['IS_AUTHENTICATED_FULLY'])
class ProcessController {
      def springSecurityService
      def processService

      static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

      @RequiresPermissions(value=['process:view','process:create','process:delete','process:update'],logical=Logical.OR)
      def index() {
            redirect(action: "list", params: params)
      }

      @RequiresPermissions(value=['process:view','process:create','process:delete','process:update'],logical=Logical.OR)
      def list(Integer max) {
            def countryList=processService.findAllCountry();
            def result = processService.list(params)
            if(!result.error) {
                  render(view: "list", model: [processInstanceList: result?.results, processInstanceTotal: result?.total,country: countryList])
                  return;
            }
            flash.message = g.message(code: result.error.code, args: result.error.args)
            render(view: "list", model: [processInstanceList: [], processInstanceTotal:0,country: countryList])
      }

      @RequiresPermissions('process:create')
      def create() {

      }

      @RequiresPermissions('process:create')
      def save() {
            def result=processService.create(params)
            if(!result.error) {
                  flash.message = message(code: 'default.created.message', args: [message(code: 'process.label', default: 'Process'), result?.process.id])
                  redirect(action: "show", id: result?.process.id)
                  return
            }
            render(view: "create", model: [processInstance: result?.process])
      }

      @RequiresPermissions(value=['process:view','process:create','process:delete','process:update'],logical=Logical.OR)
      def show(Long id) {
            def processInstance = processService.findById(id);
            if (!processInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'process.label', default: 'Process'), id])
                  redirect(action: "list")
                  return
            }
            [processInstance: processInstance]
      }

      @RequiresPermissions('process:update')
      def edit(Long id) {
            def processInstance =processService.findById(id);
            if (!processInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'process.label', default: 'Process'), id])
                  redirect(action: "list")
                  return
            }
            [processInstance: processInstance]
      }

      @RequiresPermissions('process:update')
      def update(Long id, Long version) {
            def result=processService.update(params)
            if(!result.error) {
                  flash.message = message(code: 'default.updated.message', args: [message(code: 'process.label', default: 'Process'), result?.process.id])
                  redirect(action: "show", id: result?.process.id)
                  return
            }

            if(result.error.code == "default.not.found") {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'process.label', default: 'Process'), id])
                  redirect(action: "list")
                  return
            }
            render(view: "edit", model: [processInstance: result.process.attach()])
      }

      @RequiresPermissions('process:delete')
      def delete(Long id) {
            def processInstance = processService.findById(id)
            if (!processInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'process.label', default: 'Process'), id])
                  redirect(action: "list")
                  return
            }
            def result=processService.delete(processInstance)
            if(!result.error) {
                  flash.message = message(code: 'default.deleted.message', args: [message(code: 'process.label', default: 'Process'), id])
                  redirect(action: "list");
                  return
            }
            if(result.error.code == "default.not.found") {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'process.label', default: 'Process'), id])
                  redirect(action: "list")
                  return
            }
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'process.label', default: 'Process'), id])
            redirect(action: "show", id: id)
      }

      @RequiresPermissions('process:create')
      def setUpStep(){
            def process=processService.findAllByCountry(params.country);
            [process:process]
      }
      @RequiresPermissions('process:create')
      def updateStepOrder(){
            def status=processService.updateStepOrder(params);
            render status as JSON;
      }

}

