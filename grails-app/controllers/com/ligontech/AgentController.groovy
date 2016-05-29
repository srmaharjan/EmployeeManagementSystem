package com.ligontech

import grails.plugin.springsecurity.annotation.Secured
import org.apache.shiro.authz.annotation.Logical
import org.apache.shiro.authz.annotation.RequiresPermissions
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest

@Secured(['IS_AUTHENTICATED_FULLY'])
class AgentController {

      def agentService;
      def springSecurityService

      static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
      @RequiresPermissions(value=['agent:view','agent:create','agent:delete','agent:update'],logical=Logical.OR)
      def search() {
            def result = agentService.search(params)
            if(result.error) {
                  flash.message = g.message(code: result.error?.code, args: result.error?.args)
                  render(view: "list", model: [agentInstanceList: [], agentInstanceTotal:0])
            }
            render(view: "list", model: [agentInstanceList: result?.results, agentInstanceTotal: result?.total])
      }
      @RequiresPermissions(value=['agent:view','agent:create','agent:delete','agent:update'],logical=Logical.OR)
      def index() {
            redirect(action: "list", params: params)
      }

      @RequiresPermissions(value=['agent:view','agent:create','agent:delete','agent:update'],logical=Logical.OR)
      def list(Integer max) {
            def result = agentService.list(params)
            if(!result.error) {
                  render(view: "list", model: [agentInstanceList: result?.results, agentInstanceTotal: result?.total])
                  return;
            }
            flash.message = g.message(code: result.error.code, args: result.error.args)
            render(view: "list", model: [agentInstanceList: [], agentInstanceTotal:0])
      }

      def create() {
      }

      @RequiresPermissions('agent:create')
      def save() {
            def result=agentService.create(params)
            if(!result.error) {
                  flash.message = message(code: 'default.created.message', args: [message(code: 'agent.label', default: 'Agent'), result?.agent.id])
                  redirect(action: "show", id: result?.agent.id)
                  return
            }
            render(view: "create", model: [agentInstance: result?.agent])
      }


      @RequiresPermissions(value=['agent:view','agent:create','agent:delete','agent:update'],logical=Logical.OR)
      def show(Integer id) {
            def agentInstance = agentService.findById(id);
            if (!agentInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'agent.label', default: 'FixedValue'), id])
                  redirect(action: "list")
                  return
            }
            [agentInstance: agentInstance]
      }

      @RequiresPermissions('agent:update')
      def edit(Integer id) {
            def agentInstance =agentService.findById(id);
            if (!agentInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'agent.label', default: 'FixedValue'), id])
                  redirect(action: "list")
                  return
            }
            [agentInstance: agentInstance]
      }

      @RequiresPermissions('agent:update')
      def update(Integer id, Long version) {
            def result=agentService.update(params)
            if(!result.error) {
                  flash.message = message(code: 'default.updated.message', args: [message(code: 'agent.label', default: 'FixedValue'), result?.agent.id])
                  redirect(action: "show", id: result?.agent.id)
                  return
            }

            if(result.error.code == "default.not.found") {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'agent.label', default: 'FixedValue'), id])
                  redirect(action: "list")
                  return
            }
            render(view: "edit", model: [agentInstance: result.agent.attach()])
      }

      @RequiresPermissions('agent:delete')
      def delete(Integer id) {
            def agentInstance = agentService.findById(id)
            if (!agentInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'agent.label', default: 'FixedValue'), id])
                  redirect(action: "list")
                  return
            }
            def result=agentService.delete(agentInstance)
            if(!result.error) {
                  flash.message = message(code: 'default.deleted.message', args: [message(code: 'agent.label', default: 'FixedValue'), id])
                  redirect(action: "list");
                  return
            }
            if(result.error.code == "default.not.found") {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'agent.label', default: 'FixedValue'), id])
                  redirect(action: "list")
                  return
            }
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'agent.label', default: 'FixedValue'), id])
            redirect(action: "show", id: id)
      }

}
