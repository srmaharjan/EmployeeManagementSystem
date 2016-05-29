package com.ligontech

import grails.plugin.springsecurity.annotation.Secured
import org.apache.shiro.authz.annotation.Logical
import org.apache.shiro.authz.annotation.RequiresPermissions
import org.springframework.dao.DataIntegrityViolationException

@Secured(['IS_AUTHENTICATED_FULLY'])
class CountryController {
      def springSecurityService
      def countryService

      static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
      @RequiresPermissions(value=['country:view','country:create','country:delete','country:update'],logical=Logical.OR)
      def search() {
            def result = countryService.search(params)
            if(result.error) {
                  flash.message = g.message(code: result.error?.code, args: result.error?.args)
                  render(view: "list", model: [countryInstanceList: [], countryInstanceTotal:0])
            }
            render(view: "list", model: [countryInstanceList: result?.results, countryInstanceTotal: result?.total])
      }
      @RequiresPermissions(value=['country:view','country:create','country:delete','country:update'],logical=Logical.OR)
      def index() {
            redirect(action: "list", params: params)
      }

      @RequiresPermissions(value=['country:view','country:create','country:delete','country:update'],logical=Logical.OR)
      def list(Integer max) {
            def result = countryService.list(params)
            if(!result.error) {
                  render(view: "list", model: [countryInstanceList: result?.results, countryInstanceTotal: result?.total])
                  return;
            }
            flash.message = g.message(code: result.error.code, args: result.error.args)
            render(view: "list", model: [countryInstanceList: [], countryInstanceTotal:0])
      }

      @RequiresPermissions('country:create')
      def create() {

      }

      @RequiresPermissions('country:create')
      def save() {
            def result=countryService.create(params)
            if(!result.error) {
                  flash.message = message(code: 'default.created.message', args: [message(code: 'country.label', default: 'Country'), result?.country.id])
                  redirect(action: "show", id: result?.country.id)
                  return
            }
            render(view: "create", model: [countryInstance: result?.country])
      }

      @RequiresPermissions(value=['country:view','country:create','country:delete','country:update'],logical=Logical.OR)
      def show(Integer id) {
            def countryInstance = countryService.findById(id);
            if (!countryInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'country.label', default: 'Country'), id])
                  redirect(action: "list")
                  return
            }
            [countryInstance: countryInstance]
      }

      @RequiresPermissions('country:update')
      def edit(Integer id) {
            def countryInstance =countryService.findById(id);
            if (!countryInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'country.label', default: 'Country'), id])
                  redirect(action: "list")
                  return
            }
            [countryInstance: countryInstance]
      }

      @RequiresPermissions('country:update')
      def update(Integer id, Long version) {
            def result=countryService.update(params)
            if(!result.error) {
                  flash.message = message(code: 'default.updated.message', args: [message(code: 'country.label', default: 'Country'), result?.country.id])
                  redirect(action: "show", id: result?.country.id)
                  return
            }

            if(result.error.code == "default.not.found") {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'country.label', default: 'Country'), id])
                  redirect(action: "list")
                  return
            }
            render(view: "edit", model: [countryInstance: result.country.attach()])
      }

      @RequiresPermissions('country:delete')
      def delete(Integer id) {
            def countryInstance = countryService.findById(id)
            if (!countryInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'country.label', default: 'Country'), id])
                  redirect(action: "list")
                  return
            }
            def result=countryService.delete(countryInstance)
            if(!result.error) {
                  flash.message = message(code: 'default.deleted.message', args: [message(code: 'country.label', default: 'Country'), id])
                  redirect(action: "list");
                  return
            }
            if(result.error.code == "default.not.found") {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'country.label', default: 'Country'), id])
                  redirect(action: "list")
                  return
            }
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'country.label', default: 'Country'), id])
            redirect(action: "show", id: id)
      }
}
