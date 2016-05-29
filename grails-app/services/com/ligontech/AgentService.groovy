package com.ligontech

class AgentService {
      static transactional = false
      def grailsApplication
      def springSecurityService
      def searchService;
      def fileUploadService;
      def getAllAgents(){
            def currentUser=springSecurityService.getCurrentUser()
            def results = Agent.domain(currentUser.userCustomerCode).listAll.list()
            return results
      }
      def search(params){
            def query = params.query
            def result;
            params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
            if(query){
                  def fail = { Map m ->
                        result.error = [ code: m.code, args: ["Agent"] ]
                        return result
                  }
                  result = searchService.search(Agent,params,['name','email','website','phoneNo','currentAddress'])
            }else{
                  result=list(params)
            }
            return result;
      }
      def list(params) {
            def currentUser=springSecurityService.getCurrentUser()
            def result = [:]
            def fail = { Map m ->
                  result.error = [ code: m.code, args: ["Agent"] ]
                  return result
            }

            params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
            result.results = Agent.domain(currentUser.userCustomerCode).listAll.list(params)
            result.total = Agent.domain(currentUser.userCustomerCode).listAll.count()

            if(!result.results || !result.total)
                  return fail(code:"default.list.failure")
            return result
      }
      def findById(id){
            def currentUser=springSecurityService.getCurrentUser()
            return Agent.domain(currentUser.userCustomerCode).listAll.get(id);
      }
      def create(params){
            def result = [:]
            Agent.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly()){
                              status.setRollbackOnly()
                        }
                        if(result.agent && m.field){
                              result.agent.errors.rejectValue(m.field, m.code)
                        }
                        result.error = [ code: m.code ]
                        return result
                  }
                  try{
                        def fileResult=fileUploadService.uploadImage('photo_file','images');
                        result.agent  = new Agent(params)
                        if(fileResult.error){
                              return fail(code:fileResult.error)
                        }else if(fileResult.fileEntry){
                              result.agent.photo=fileResult.fileEntry
                              result.agent.photo.name='photo'
                        }
                        //result.agent.photo=file.save(flush:true);
                        //   result.agent.currentAddress.save(flush: true)
                        //  result.agent.permanentAddress.save(flush: true)
                        def instance=result.agent.save(flush:true)
                        if(result.agent.hasErrors() || !instance){
                              fileUploadService.deleteFile(result.agent.photo?.path,result.agent.photo?.fileName)
                              return fail(code:"default.create.failure")
                        }
                        return result;
                  }catch(e){
                        fileUploadService.deleteFile(result.agent.photo?.path,result.agent.photo?.fileName)
                        return fail(code:"default.create.failure")
                  }
            }

      }

      def update(params){
            def result = [:]
            Agent.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        if(result.agent && m.field){
                              result.agent.errors.rejectValue(m.field, m.code)
                        }
                        result.error = [ code: m.code, args: ["Agent", params.id] ]
                        return result
                  }
                  def fileResult=[:]
                  try{
                        result.agent = findById(params.id)
                        if(!result.agent)
                              return fail(code:"default.not.found")

                        if(params.version) {
                              if(result.agent.version > params.version.toLong())
                                    return fail(field:"version", code:"default.optimistic.locking.failure")
                        }
                        FileEntry oldFileEntry=result.agent.photo
                        result.agent.properties=params;

                        fileResult=fileUploadService.uploadImage('photo_file','images');
                        if(fileResult.error){
                              return fail(code:fileResult.error)
                        }else if(fileResult.fileEntry){
                              result.agent.photo=fileResult.fileEntry
                              result.agent.photo.name='photo'
                              if(oldFileEntry){
                                    //result.agent.photo.id=oldFileEntry.id;
                                    oldFileEntry.delete()
                                    fileUploadService.deleteFile(oldFileEntry?.path,oldFileEntry?.fileName)
                              }
                        }
                        if(params.remove_image){
                              fileUploadService.deleteFile(result.agent.photo?.path,result.agent.photo?.fileName)
                              result.agent.photo?.delete()
                              result.agent.photo=null;
                        }
                        def instance=result.agent.save(flush:true)
                        if(result.agent.hasErrors() || !instance){
                              return fail(code:"default.create.failure")
                        }
                        return result;
                  }catch(e){
                        e.printStackTrace()
                        log.error(e.getMessage())
                        fileUploadService.deleteFile(fileResult?.path,fileResult?.fileName)
                        return fail(code:"default.create.failure")
                  }
            }
      }
      def delete(params){
            def result = [:]
            Agent.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        result.error = [ code: m.code, args: ["Agent", params.id] ]
                        return result
                  }
                  result.agent=findById(params.id)
                  if (!result.agent) {
                        return fail(code:"default.not.found")
                  }
                  result.agent.isDeleted=System.currentTimeMillis();
                  result.agent.currentAddress.isDeleted=System.currentTimeMillis();
//                  result.agent.currentAddress.save()
                  result.agent.permanentAddress.isDeleted=System.currentTimeMillis();
//                  result.agent.permanentAddress.save()
                  result.agent.photo.isDeleted=System.currentTimeMillis();
                  result.agent.save(flush: true)
                  return result;
            }
      }
}
