package com.ligontech

class JobseekerService {
      static transactional = false
      def grailsApplication
      def springSecurityService
      def searchService;
      def fileUploadService;

      def search(params){
            def query = params.query
            def result;
            params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
            result = searchService.searchJobseeker(params)
            return result;
      }
      def list(params) {
            def currentUser=springSecurityService.getCurrentUser()
            def result = [:]
            def fail = { Map m ->
                  result.error = [ code: m.code, args: ["Jobseeker"] ]
                  return result
            }

            params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
            result.results = Jobseeker.domain(currentUser.userCustomerCode).listAll.list(params)
            result.total = Jobseeker.domain(currentUser.userCustomerCode).listAll.count()

            if(!result.results || !result.total)
                  return fail(code:"default.list.failure")
            return result
      }
      def findById(id){
            def currentUser=springSecurityService.getCurrentUser()
            def jobseeker=Jobseeker.domain(currentUser.userCustomerCode).listAll.get(id);
            return jobseeker;
      }
      def findByIdWithLock(id){
            def currentUser=springSecurityService.getCurrentUser()
            Jobseeker seeker=Jobseeker.lock(id);
            if((seeker.customer.id==currentUser.userCustomerCode || seeker.customer.id=='LT') && seeker.isDeleted==0L){
                  return seeker;
            }
            return null;
      }
      def create(params){
            def result = [:]
            Jobseeker.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly()){
                              status.setRollbackOnly()
                        }
                        if(result.jobseeker && m.field){
                              result.jobseeker.errors.rejectValue(m.field, m.code)
                        }
                        result.error = [ code: m.code ]
                        return result
                  }
                  try{
                        def fileResult=fileUploadService.uploadImage('photo_file','images');
                        def jobseeker=new Jobseeker(params);
                        //      jobseeker.dateOfBirth=params.dateOfBirth;
                        //      jobseeker.passport.issuedDate=params.issueDate
                        //      jobseeker.passport.expiryDate=params.expiryDate
                        result.jobseeker  = jobseeker
                        if(fileResult.error){
                              return fail(code:fileResult.error)
                        }else if(fileResult.fileEntry){
                              result.jobseeker.photo=fileResult.fileEntry
                              result.jobseeker.photo.name='photo'
                        }
                        result.jobseeker.status=Process.findByCodeAndCustomer
                        def instance=result.jobseeker.save(flush:true)
                        if(result.jobseeker.hasErrors() || !instance){
                              fileUploadService.deleteFile(result.jobseeker.photo?.path,result.jobseeker.photo?.fileName)
                              return fail(code:"default.create.failure")
                        }
                        return result;
                  }catch(e){
                        e.printStackTrace()
                        fileUploadService.deleteFile(result.jobseeker.photo?.path,result.jobseeker.photo?.fileName)
                        return fail(code:"default.create.failure")
                  }
            }

      }

      def update(params){
            def result = [:]
            Jobseeker.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        if(result.jobseeker && m.field){
                              result.jobseeker.errors.rejectValue(m.field, m.code)
                        }
                        result.error = [ code: m.code, args: ["Jobseeker", params.id] ]
                        return result
                  }
                  def fileResult=[:]
                  try{
                        result.jobseeker = findById(params.id)
                        if(!result.jobseeker)
                              return fail(code:"default.not.found")

                        if(params.version) {
                              if(result.jobseeker.version > params.version.toLong())
                                    return fail(field:"version", code:"default.optimistic.locking.failure")
                        }
                        FileEntry oldFileEntry=result.jobseeker.photo
                        result.jobseeker.properties=params;

                        fileResult=fileUploadService.uploadImage('photo_file','images');
                        if(fileResult.error){
                              return fail(code:fileResult.error)
                        }else if(fileResult.fileEntry){
                              result.jobseeker.photo=fileResult.fileEntry
                              result.jobseeker.photo.name='photo'
                              if(oldFileEntry){
                                    //result.jobseeker.photo.id=oldFileEntry.id;
                                    oldFileEntry.delete()
                                    fileUploadService.deleteFile(oldFileEntry?.path,oldFileEntry?.fileName)
                              }
                        }
                        if(params.remove_image){
                              fileUploadService.deleteFile(result.jobseeker.photo?.path,result.jobseeker.photo?.fileName)
                              result.jobseeker.photo?.delete()
                              result.jobseeker.photo=null;
                        }
                        removeAll(result.jobseeker)
                        def instance=result.jobseeker.save(flush:true)
                        if(result.jobseeker.hasErrors() || !instance){
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
      private void removeAll(jobseeker){
            def _toBeDeleteEducation = jobseeker.educations.findAll {(it?.deleted || (it == null))}
            def _toBeDeleteTraining = jobseeker.trainings.findAll {(it?.deleted || (it == null))}
            def _toBeDeleteLanguage = jobseeker.languages.findAll {(it?.deleted || (it == null))}
            if (_toBeDeleteEducation) {
                  jobseeker.educations.removeAll(_toBeDeleteEducation)

            }
            if (_toBeDeleteTraining) {
                  jobseeker.trainings.removeAll(_toBeDeleteTraining)
            }
            if (_toBeDeleteLanguage) {
                  jobseeker.languages.removeAll(_toBeDeleteLanguage)
            }
      }
      def delete(params){
            def result = [:]
            Jobseeker.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        result.error = [ code: m.code, args: ["Jobseeker", params.id] ]
                        return result
                  }
                  result.jobseeker=findById(params.id)
                  if (!result.jobseeker) {
                        return fail(code:"default.not.found")
                  }
                  result.jobseeker.isDeleted=System.currentTimeMillis();
                  result.jobseeker.currentAddress.isDeleted=System.currentTimeMillis();
//                  result.jobseeker.currentAddress.save()
                  result.jobseeker.permanentAddress.isDeleted=System.currentTimeMillis();
//                  result.jobseeker.permanentAddress.save()
                  result.jobseeker.photo?.isDeleted=System.currentTimeMillis();
                  result.jobseeker.save(flush: true)
                  return result;
            }
      }
      Map requiredResources(){
            def currentUser=springSecurityService.getCurrentUser()
            def fixedValue=FixedValue.domain(currentUser.userCustomerCode).listAll.list()

            def martialStatus=fixedValue.findAll{it.fieldType==FieldType.MARTIAL_STATUS};
            def religion=fixedValue.findAll{it.fieldType==FieldType.RELIGION};
            def district=fixedValue.findAll{it.fieldType==FieldType.DISTRICT};
            def zone=fixedValue.findAll{it.fieldType==FieldType.ZONE};
            def degree=fixedValue.findAll{it.fieldType==FieldType.DEGREE};
            def language=fixedValue.findAll{it.fieldType==FieldType.LANGUAGE};
            def nationality=fixedValue.findAll{it.fieldType==FieldType.NATIONALITY};
            def rating=fixedValue.findAll{it.fieldType==FieldType.RATING};
            def gender=fixedValue.findAll{it.fieldType==FieldType.GENDER};


            def country=Country.domain(currentUser.userCustomerCode).listAll.list()

            def agents=Agent.domain(currentUser.userCustomerCode).listAll.list()

            def jobCategory=JobCategory.domain(currentUser.userCustomerCode).listAll.list()

            return  [agents:agents,country:country,martialStatus:martialStatus,religion:religion,district:district,zone:zone,
                  degree:degree,languageList:language,jobCategory:jobCategory,nationality:nationality,rating:rating,gender:gender]
      }

}
