package com.ligontech.admin

import com.ligontech.annotations.RequiresAuth
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.apache.shiro.authz.annotation.RequiresPermissions
import org.springframework.dao.DataIntegrityViolationException

import java.lang.annotation.Annotation
import java.lang.reflect.Method

@Secured(["hasRole('SUPERMAN')"])
class ModuleDashBoardController {

      static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

      def index() {
            redirect(action: "list", params: params)
      }

      def list(Integer max) {
            params.max = Math.min(max ?: 10, 100)
            [moduleDashBoardInstanceList: ModuleDashBoard.list(params), moduleDashBoardInstanceTotal: ModuleDashBoard.count()]
      }

      def create() {
            def parentModule=ModuleDashBoard.createCriteria().list{
                  isNull('parent')
            }
            def subParentModule=ModuleDashBoard.createCriteria().list{
                  and{
                        isNotNull('parent')
                        isNull('subParent')
                  }
            }
            [moduleDashBoardInstance: new ModuleDashBoard(params),parentModule:parentModule,subParentModule:subParentModule]
      }

      def save() {
            def moduleDashBoardInstance = new ModuleDashBoard(params)
            def permission=''
            def controller=grailsApplication.controllerClasses.find{it.logicalPropertyName==params.moduleController};

            Method method = controller.getClazz().getMethods().find{it.name==params.moduleAction};

            if( method?.isAnnotationPresent(RequiresPermissions.class)){
                  RequiresPermissions annotation=method.getAnnotation(RequiresPermissions.class)
                  permission=annotation.value()[0]
            }
            if(!permission){
                  if( method?.isAnnotationPresent(RequiresAuth.class)){
                        RequiresAuth annotation=method.getAnnotation(RequiresAuth.class)
                        permission=annotation.permission()
                  }
            }
            if(permission){
                  moduleDashBoardInstance.permission=permission
            }else{
                  moduleDashBoardInstance.permission= permission=params.moduleController+":"+params.moduleAction;
            }

            moduleDashBoardInstance.isParent=moduleDashBoardInstance.parent==null;
            if (!moduleDashBoardInstance.save(flush: true)) {
                  render(view: "create", model: [moduleDashBoardInstance: moduleDashBoardInstance])
                  return
            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'moduleDashBoard.label', default: 'ModuleDashBoard'), moduleDashBoardInstance.id])
            redirect(action: "show", id: moduleDashBoardInstance.id)
      }

      def show(Long id) {
            def moduleDashBoardInstance = ModuleDashBoard.get(id)
            if (!moduleDashBoardInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'moduleDashBoard.label', default: 'ModuleDashBoard'), id])
                  redirect(action: "list")
                  return
            }

            [moduleDashBoardInstance: moduleDashBoardInstance]
      }

      def edit(Long id) {
            def parentModule=ModuleDashBoard.createCriteria().list{
                  isNull('parent')
            }
            def subParentModule=ModuleDashBoard.createCriteria().list{
                  and{
                        isNotNull('parent')
                        isNull('subParent')
                  }
            }
            def moduleDashBoardInstance = ModuleDashBoard.get(id)
            if (!moduleDashBoardInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'moduleDashBoard.label', default: 'ModuleDashBoard'), id])
                  redirect(action: "list")
                  return
            }

            [moduleDashBoardInstance: moduleDashBoardInstance,parentModule:parentModule,subParentModule:subParentModule]
      }

      def update(Long id, Long version) {
            def moduleDashBoardInstance = ModuleDashBoard.get(id)
            if (!moduleDashBoardInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'moduleDashBoard.label', default: 'ModuleDashBoard'), id])
                  redirect(action: "list")
                  return
            }

            if (version != null) {
                  if (moduleDashBoardInstance.version > version) {
                        moduleDashBoardInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                              [message(code: 'moduleDashBoard.label', default: 'ModuleDashBoard')] as Object[],
                              "Another user has updated this ModuleDashBoard while you were editing")
                        render(view: "edit", model: [moduleDashBoardInstance: moduleDashBoardInstance])
                        return
                  }
            }
            //Message: identifier of an instance of com.ligontech.admin.ModuleDashBoard was altered from 8 to null
            moduleDashBoardInstance.parent = null
            moduleDashBoardInstance.subParent = null
            moduleDashBoardInstance.properties = params
            moduleDashBoardInstance.isParent=moduleDashBoardInstance.parent==null;
            def permission=''
            def controller=grailsApplication.controllerClasses.find{it.logicalPropertyName==params.moduleController};

            Method method = controller.getClazz().getMethods().find{it.name==params.moduleAction};

            if( method?.isAnnotationPresent(RequiresPermissions.class)){
                  RequiresPermissions annotation=method.getAnnotation(RequiresPermissions.class)
                  permission=annotation.value()[0]
            }
            if(!permission){
                  if( method?.isAnnotationPresent(RequiresAuth.class)){
                        RequiresAuth annotation=method.getAnnotation(RequiresAuth.class)
                        permission=annotation.permission()
                  }
            }
            if(permission){
                  moduleDashBoardInstance.permission=permission
            }else{
                  moduleDashBoardInstance.permission= permission=params.moduleController+":"+params.moduleAction;
            }
            if (!moduleDashBoardInstance.save(flush: true)) {
                  render(view: "edit", model: [moduleDashBoardInstance: moduleDashBoardInstance])
                  return
            }

            flash.message = message(code: 'default.updated.message', args: [message(code: 'moduleDashBoard.label', default: 'ModuleDashBoard'), moduleDashBoardInstance.id])
            redirect(action: "show", id: moduleDashBoardInstance.id)
      }

      def delete(Long id) {
            def moduleDashBoardInstance = ModuleDashBoard.get(id)
            if (!moduleDashBoardInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'moduleDashBoard.label', default: 'ModuleDashBoard'), id])
                  redirect(action: "list")
                  return
            }

            try {
                  moduleDashBoardInstance.delete(flush: true)
                  flash.message = message(code: 'default.deleted.message', args: [message(code: 'moduleDashBoard.label', default: 'ModuleDashBoard'), id])
                  redirect(action: "list")
            }
            catch (DataIntegrityViolationException e) {
                  flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'moduleDashBoard.label', default: 'ModuleDashBoard'), id])
                  redirect(action: "show", id: id)
            }
      }
}
