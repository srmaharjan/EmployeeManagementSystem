package com.ligontech.usermanagement

import grails.plugin.springsecurity.annotation.Secured
import org.apache.shiro.authz.annotation.Logical
import org.apache.shiro.authz.annotation.RequiresPermissions

@Secured(['IS_AUTHENTICATED_FULLY'])
class UserController {

      static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
      def sessionFactory;
      def userService;
      def searchableService;
      def springSecurityService;


      @RequiresPermissions(value=['user:view','user:create','user:delete','user:update'],logical=Logical.OR)
      def search() {

            def query = params.query
            if(query){
                  def result;
                  def loggedInUser=springSecurityService.currentUser;
                  def userCustomerCode=loggedInUser.userCustomerCode;
                  if(userCustomerCode.equals('LT')){
                        result=User.search{
                              must(queryString(query))
                        }
//                        result=searchableService.search(query)
                  }else{
                        result=User.search{
                              must(queryString(query))
                              must(term('userCustomerCode',userCustomerCode))
                        }
//                        result = searchableService.search("$query AND userCustomerCode:$userCustomerCode");
                  }
                  render(view: "list", model: [userInstanceList: result?.results, userInstanceTotal: result?.total])
            }else{
                  redirect(action: "list")
            }
      }

      @RequiresPermissions(value=['user:view','user:create','user:delete','user:update'],logical=Logical.OR)
      def index() {
            redirect(action: "list", params: params)
      }

      @RequiresPermissions(value=['user:view','user:create','user:delete','user:update'],logical=Logical.OR)
      def list(Integer max) {
            def result = userService.list(params)
            println "{result.error} = ${result.error}"
            if(!result.error) {
                  return [userInstanceList: result.results, userInstanceTotal: result.total]
            }
            flash.message = g.message(code: result.error.code, args: result.error.args)
            redirect( url: resource(dir:'') )
      }

      @RequiresPermissions('user:create')
      def create() {
            def permissions=userService.getAllPermissions();
            def permissionsWithParent=userService.getAllPermissionWithParent(permissions)
            [userPermissions:[],permissions:permissionsWithParent.getAt('result'),displayMap: permissionsWithParent.getAt('displayMap')]
      }

      @RequiresPermissions('user:create')
      def save() {
            def result=userService.create(params)
            if(!result.error) {
                  flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), result?.user.id])
                  redirect(action: "show", id: result?.user.id)
                  return
            }
            render(view: "create", model: [userInstance: result?.user])
      }

      @RequiresPermissions(value=['user:view','user:create','user:delete','user:update'])
      def show(Long id) {
            def userInstance = userService.findById(id);
            if (!userInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
                  redirect(action: "list")
                  return
            }
            [userInstance: userInstance]
      }

      @RequiresPermissions('user:update')
      def edit(Long id) {
            def userInstance =userService.findById(id);
            if (!userInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
                  redirect(action: "list")
                  return
            }
            def userPermissions=Permission.createCriteria().list{
                  eq 'user',userInstance
            }
            def permissions=userService.getAllPermissions();
            def permissionsWithParent=userService.getAllPermissionWithParent(permissions)

            [userInstance: userInstance,userPermissions:userPermissions*.permission,permissions:permissionsWithParent.getAt('result'),displayMap: permissionsWithParent.getAt('displayMap')]
      }

      @RequiresPermissions('user:update')
      def update(Long id, Long version) {
            def result=userService.update(params)
            if(!result.error) {
                  flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), result?.user.id])
                  redirect(action: "show", id: result?.user.id)
                  return
            }

            if(result.error.code == "default.not.found") {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
                  redirect(action: "list")
                  return
            }
            render(view: "edit", model: [userInstance: result.user.attach()])
      }

      @RequiresPermissions('user:delete')
      def delete(Long id) {
            def userInstance = userService.findById(id)
            if (!userInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
                  redirect(action: "list")
                  return
            }
            def result=userService.delete(userInstance)
            if(!result.error) {
                  flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
                  redirect(action: "list");
                  return
            }
            if(result.error.code == "default.not.found") {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
                  redirect(action: "list")
                  return
            }
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "show", id: id)

      }

}
