package com.ligontech

import grails.plugin.springsecurity.annotation.Secured
import org.apache.shiro.authz.annotation.Logical
import org.apache.shiro.authz.annotation.RequiresPermissions
import org.springframework.dao.DataIntegrityViolationException


@Secured(['IS_AUTHENTICATED_FULLY'])
class CompanyController {

      def companyService;
      def springSecurityService

      static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
      @RequiresPermissions(value=['company:view','company:create','company:delete','company:update'],logical=Logical.OR)
      def search() {
            def result = companyService.search(params)
            if(result.error) {
                  flash.message = g.message(code: result.error?.code, args: result.error?.args)
                  render(view: "list", model: [companyInstanceList: [], companyInstanceTotal:0])
            }
            render(view: "list", model: [companyInstanceList: result?.results, companyInstanceTotal: result?.total])
      }
      @RequiresPermissions(value=['company:view','company:create','company:delete','company:update'],logical=Logical.OR)
      def index() {
            redirect(action: "list", params: params)
      }

      @RequiresPermissions(value=['company:view','company:create','company:delete','company:update'],logical=Logical.OR)
      def list(Integer max) {
            def result = companyService.list(params)
            if(!result.error) {
                  render(view: "list", model: [companyInstanceList: result?.results, companyInstanceTotal: result?.total])
                  return;
            }
            flash.message = g.message(code: result.error.code, args: result.error.args)
            render(view: "list", model: [companyInstanceList: [], companyInstanceTotal:0])
      }

      def create() {
      }

      @RequiresPermissions('company:create')
      def save() {
            def result=companyService.create(params)
            if(!result.error) {
                  flash.message = message(code: 'default.created.message', args: [message(code: 'company.label', default: 'Company'), result?.company.id])
                  redirect(action: "show", id: result?.company.id)
                  return
            }
            render(view: "create", model: [companyInstance: result?.company])
      }


      @RequiresPermissions(value=['company:view','company:create','company:delete','company:update'],logical=Logical.OR)
      def show(Integer id) {
            def companyInstance = companyService.findById(id);
            if (!companyInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'company.label', default: 'Company'), id])
                  redirect(action: "list")
                  return
            }
            [companyInstance: companyInstance]
      }

      @RequiresPermissions('company:update')
      def edit(Integer id) {
            def companyInstance =companyService.findById(id);
            if (!companyInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'company.label', default: 'Company'), id])
                  redirect(action: "list")
                  return
            }
            [companyInstance: companyInstance]
      }

      @RequiresPermissions('company:update')
      def update(Integer id, Long version) {
            def result=companyService.update(params)
            if(!result.error) {
                  flash.message = message(code: 'default.updated.message', args: [message(code: 'company.label', default: 'Company'), result?.company.id])
                  redirect(action: "show", id: result?.company.id)
                  return
            }

            if(result.error.code == "default.not.found") {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'company.label', default: 'Company'), id])
                  redirect(action: "list")
                  return
            }
            render(view: "edit", model: [companyInstance: result.company.attach()])
      }

      @RequiresPermissions('company:delete')
      def delete(Integer id) {
            def companyInstance = companyService.findById(id)
            if (!companyInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'company.label', default: 'Company'), id])
                  redirect(action: "list")
                  return
            }
            def result=companyService.delete(companyInstance)
            if(!result.error) {
                  flash.message = message(code: 'default.deleted.message', args: [message(code: 'company.label', default: 'Company'), id])
                  redirect(action: "list");
                  return
            }
            if(result.error.code == "default.not.found") {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'company.label', default: 'Company'), id])
                  redirect(action: "list")
                  return
            }
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'company.label', default: 'Company'), id])
            redirect(action: "show", id: id)
      }
}
