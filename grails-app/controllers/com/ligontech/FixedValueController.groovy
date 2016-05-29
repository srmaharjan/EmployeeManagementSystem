package com.ligontech

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.apache.shiro.authz.annotation.Logical
import org.apache.shiro.authz.annotation.RequiresPermissions

@Secured(['IS_AUTHENTICATED_FULLY'])
class FixedValueController {
      def springSecurityService
      def fixedValueService

      static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
      @RequiresPermissions(value=['fixedValue:view','fixedValue:create','fixedValue:delete','fixedValue:update'],logical=Logical.OR)
      def search() {
            def result = fixedValueService.search(params)
            if(result.error) {
                  flash.message = g.message(code: result.error?.code, args: result.error?.args)
                  render(view: "list", model: [fixedValueInstanceList: [], fixedValueInstanceTotal:0])
            }
            render(view: "list", model: [fixedValueInstanceList: result?.results, fixedValueInstanceTotal: result?.total])
      }
      @RequiresPermissions(value=['fixedValue:view','fixedValue:create','fixedValue:delete','fixedValue:update'],logical=Logical.OR)
      def index() {
            redirect(action: "list", params: params)
      }

      @RequiresPermissions(value=['fixedValue:view','fixedValue:create','fixedValue:delete','fixedValue:update'],logical=Logical.OR)
      def list(Integer max) {
            def result = fixedValueService.list(params)
            if(!result.error) {
                  render(view: "list", model: [fixedValueInstanceList: result?.results, fixedValueInstanceTotal: result?.total])
                  return;
            }
            flash.message = g.message(code: result.error.code, args: result.error.args)
            render(view: "list", model: [fixedValueInstanceList: [], fixedValueInstanceTotal:0])
      }

      @RequiresPermissions('fixedValue:create')
      def create() {

      }

      @RequiresPermissions('fixedValue:create')
      def save() {
            def result=fixedValueService.create(params)
            if(!result.error) {
                  flash.message = message(code: 'default.created.message', args: [message(code: 'fixedValue.label', default: 'FixedValue'), result?.fixedValue.id])
                  redirect(action: "show", id: result?.fixedValue.id)
                  return
            }
            render(view: "create", model: [fixedValueInstance: result?.fixedValue])
      }

      @RequiresPermissions(value=['fixedValue:view','fixedValue:create','fixedValue:delete','fixedValue:update'],logical=Logical.OR)
      def show(Integer id) {
            def fixedValueInstance = fixedValueService.findById(id);
            if (!fixedValueInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'fixedValue.label', default: 'FixedValue'), id])
                  redirect(action: "list")
                  return
            }
            [fixedValueInstance: fixedValueInstance]
      }

      @RequiresPermissions('fixedValue:update')
      def edit(Integer id) {
            def fixedValueInstance =fixedValueService.findById(id);
            if (!fixedValueInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'fixedValue.label', default: 'FixedValue'), id])
                  redirect(action: "list")
                  return
            }
            [fixedValueInstance: fixedValueInstance]
      }

      @RequiresPermissions('fixedValue:update')
      def update(Integer id, Long version) {
            def result=fixedValueService.update(params)
            if(!result.error) {
                  flash.message = message(code: 'default.updated.message', args: [message(code: 'fixedValue.label', default: 'FixedValue'), result?.fixedValue.id])
                  redirect(action: "show", id: result?.fixedValue.id)
                  return
            }

            if(result.error.code == "default.not.found") {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'fixedValue.label', default: 'FixedValue'), id])
                  redirect(action: "list")
                  return
            }
            render(view: "edit", model: [fixedValueInstance: result.fixedValue.attach()])
      }

      @RequiresPermissions('fixedValue:delete')
      def delete(Integer id) {
            def fixedValueInstance = fixedValueService.findById(id)
            if (!fixedValueInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'fixedValue.label', default: 'FixedValue'), id])
                  redirect(action: "list")
                  return
            }
            def result=fixedValueService.delete(fixedValueInstance)
            if(!result.error) {
                  flash.message = message(code: 'default.deleted.message', args: [message(code: 'fixedValue.label', default: 'FixedValue'), id])
                  redirect(action: "list");
                  return
            }
            if(result.error.code == "default.not.found") {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'fixedValue.label', default: 'FixedValue'), id])
                  redirect(action: "list")
                  return
            }
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'fixedValue.label', default: 'FixedValue'), id])
            redirect(action: "show", id: id)
      }

      @RequiresPermissions('fixedValue:create')
      def ajaxSave(){
            def fixedValueInstance = new FixedValue(params)
            if (!fixedValueInstance.save(flush: true)) {
                  if(fixedValueInstance.hasErrors()){
                        StringBuilder s=new StringBuilder()
                        s.append('<ul>')
                        s.append('<li>')
                        s.append(message(error: fixedValueInstance.errors.getFieldError("value")))
                        s.append('</li>')
                        s.append('</ul>')
                        render ([id:'',error:s.toString()] as JSON)
                        return
                  }
                  render ([id:'',error:'Error occured while saving '+fixedValueInstance.fieldType] as JSON)
                  return
            }
            render ([id:fixedValueInstance.id,value:fixedValueInstance.value] as JSON)
      }

}
