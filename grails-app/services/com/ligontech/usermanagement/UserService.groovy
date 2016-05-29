package com.ligontech.usermanagement

import com.ligontech.admin.ModuleDashBoard
import com.ligontech.annotations.RequiresAuth
import org.apache.shiro.authz.annotation.RequiresPermissions
import org.springframework.dao.DataIntegrityViolationException

import java.lang.reflect.Method


class UserService {
      static transactional = false
      def sessionFactory;
      def grailsApplication
      def springSecurityService

      def list(params) {
            def loggedInuser=springSecurityService.getCurrentUser()
            def result = [:]
            def fail = { Map m ->
                  result.error = [ code: m.code, args: ["User"] ]
                  return result
            }

            params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
            result.results = User.customer(loggedInuser.userCustomerCode).list(params)
            result.total = User.customer(loggedInuser.userCustomerCode).count()

            if(!result.results || !result.total)
                  return fail(code:"default.list.failure")
            return result
      }
      def findById(id){
            def loggedInuser=springSecurityService.getCurrentUser()
            return User.customer(loggedInuser.userCustomerCode).get(id);
      }
      def create(params){
            def result = [:]
            User.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        if(result.user && m.field){
                              result.user.errors.rejectValue(m.field, m.code)
                        }
                        result.error = [ code: m.code ]
                        return result
                  }
                  result.user =new User(params)
                  def instance=result.user.save(flush:true)
                  if(result.user.hasErrors() || !instance){
                        return fail(code:"default.create.failure")
                  }
                  updatePermission(result.user,params)
                  return result;
            }
      }
      def update(params){
            def result = [:]
            User.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        if(result.user && m.field){
                              result.user.errors.rejectValue(m.field, m.code)
                        }
                        result.error = [ code: m.code, args: ["User", params.id] ]
                        return result
                  }
                  result.user = User.get(params.id)
                  if(!result.user)
                        return fail(code:"default.not.found")

                  if(params.version) {
                        if(result.user.version > params.version.toLong())
                              return fail(field:"version", code:"default.optimistic.locking.failure")
                  }
                  result.user.properties=params;
                  def instance=result.user.save(flush:true)
                  if(result.user.hasErrors() || !instance){
                        return fail(code:"default.create.failure")
                  }
                  updatePermission(result.user,params)
                  return result;
            }
      }
      def delete(params){
            def result = [:]
            User.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        result.error = [ code: m.code, args: ["User", params.id] ]
                        return result
                  }
                  result.user=User.get(params.id)
                  if (!result.user) {
                        return fail(code:"default.not.found")
                  }
                  try {
                        Permission.removeAll(result.user);
                        UserRole.removeAll(result.user)
                        result.user.delete(flush: true)
                  }
                  catch (DataIntegrityViolationException e) {
                        return fail(code:"default.delete.failure");
                  }
            }
      }
      def updatePermission(User user,Map params){
            def role=Role.get(params.role);
            UserRole.removeAll(user)
            UserRole.create( user,role,true);
            Permission.removeAll(user)
            if(role.authority=='SUPERMAN'){
                  new Permission(user: user, permission: '*:*').save(flush: true)
            }else{
                  List batch=[]
                  params.permissions.each{
                        batch(new Permission(user: user, permission: it));
                        if(batch>20){
                              Permission.withTransaction {
                                    for(Permission p:batch){
                                          p.save();
                                    }
                                    batch.clear();
                              }
                              sessionFactory.getCurrentSession().clear();
                        }
                  }
                  if(batch){
                        Permission.withTransaction {
                              for(Permission p:batch){
                                    p.save();
                              }
                              batch.clear();
                        }
                  }
            }

      }
      public Set getAllPermissions(){
            Set permissions=[]
            for (controller in grailsApplication.controllerClasses) {
                  Method[] methods = controller.getClazz().getMethods();
                  for (Method method : methods) {
                        if( method.isAnnotationPresent(RequiresPermissions.class)){
                              RequiresPermissions annotation=method.getAnnotation(RequiresPermissions.class)
                              permissions.addAll( annotation.value())
                        }
                        if( method.isAnnotationPresent(RequiresAuth.class)){
                              RequiresAuth annotation=method.getAnnotation(RequiresAuth.class)
                              permissions << annotation.permission()
                        }
                  }
            }
            permissions=permissions as TreeSet;
            return permissions;
      }
      public Map getAllPermissionWithParent(Set permissions){
            def allModules=ModuleDashBoard.list();
            def allParent=allModules.findAll{it.isParent}
            def allChildren=allModules.findAll{!it.isParent}
            Map result=[:]
            Map displayMap=[:]
            allParent.each{
                  result.put(it.permission,[] as Set);
                  displayMap.put(it.permission,it.displayName)
            }
            permissions.each{value ->
                  def displayName=value.split(':').collect{ it.capitalize() }.join(' ');
                  def permission=allChildren.find{it.permission==value}
                  if(!permission && (value.toString().endsWith(':delete') || value.toString().endsWith(':update'))){
                        def replacedValue=value.replace(':delete',':create').replace(':update',':create')
                        permission=allChildren.find{it.permission==replacedValue}
                  }
                  if(permission){
                        def parent=permission?.parent;
                        Set otherPermission=result.getAt(parent.permission)?:[];
                        otherPermission.add(value);
                        result.put(parent.permission,otherPermission)
                        displayMap.put(value,displayName)
                  }
            }
            return [result:result,displayMap:displayMap];
      }
}
