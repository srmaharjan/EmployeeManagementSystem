package com.ligontech

import com.ligontech.annotations.RequiresAuth
import grails.plugin.springsecurity.annotation.Secured
import org.apache.shiro.authz.annotation.RequiresPermissions

@Secured(['IS_AUTHENTICATED_FULLY'])
class DashBoardController {

     // @RequiresRoles('SUPERMAN')
    //  @RequiresPermissions('dashBoard:index')
      @RequiresAuth(role='SUPERMAN',permission = 'dashBoard:index')
      def index() {
            def data = []

      }

      @RequiresPermissions('dashBoard:setting')
      def setting(){

      }

      @Secured(["hasRole('SUPERMAN')"])
      def superAdmin(){

      }

      @RequiresPermissions('dashBoard:report')
      def report(){

      }

      @RequiresPermissions('dashBoard:abc')
      def abc(){

      }

      @RequiresPermissions('dashBoard:xyz')
      def xyz(){

      }
      @RequiresPermissions('dashBoard:help')
      def help(){

      }

      @RequiresAuth(role='SUPERMAN',permission = 'dashBoard:index')
      def userManagement(){
            redirect(controller: 'user',action:'index')
      }
}
