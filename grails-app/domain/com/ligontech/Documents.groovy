package com.ligontech

import com.ligontech.usermanagement.Customer
import org.codehaus.groovy.grails.web.context.ServletContextHolder

class Documents extends FileEntry{
      File file;
      static belongsTo = [jobseeker:Jobseeker]
      static transients = ['file']

      Long isDeleted=0
      Customer customer;
      def springSecurityService
      def grailsApplication

      def beforeInsert() {
            if(this.customer==null)
                  this.customer=springSecurityService.principal.customer;
      }
      static namedQueries = {
            listAll {
                  eq 'isDeleted',0L
            }
            domain{customerCode ->
                  if(customerCode!='LT')
                        'customer'{
                              eq 'ltCode',customerCode
                        }
            }
      }
      def getFile(){
            if(this.jobseeker){
                  def currentUser = springSecurityService.getCurrentUser()
                  def location = "${currentUser.userCustomerCode}/" + ((this?.jobseeker?.id) ?: '');
                  if (!location.endsWith('/'))
                        location = location + "/"
                  def config = grailsApplication.config.fileuploader['docs'];
                  def path = config.path
                  if (!path.endsWith('/'))
                        path = path + "/"
                  path = path + "${location}";
                  def servletContext = ServletContextHolder.servletContext
                  def storagePath = servletContext.getRealPath(path)
                  def file = new File(storagePath, this.fileName)
                  if(file.exists())
                        return file
            }
            return null
      }
}
