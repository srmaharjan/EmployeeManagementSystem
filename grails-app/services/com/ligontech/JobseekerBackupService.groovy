package com.ligontech

class JobseekerBackupService {
      def fileUploadService

      public def create(params,fileName){
            def result = [:]
            Jobseeker.withTransaction {status ->
                  def fail = { Map m ->
                        if (status.isRollbackOnly())
                              status.setRollbackOnly()
                        if(result.jobseekerInstance && m.field){
                              result.jobseekerInstance.errors.rejectValue(m.field, m.code)
                        }
                        result.error = [ code: m.code ]
                        return result
                  }
                  result.jobseekerInstance = bindJobseeker(null,params);
                  println "{result.jobseekerInstance} = ${result.jobseekerInstance}"
                  result.demamdInstance?.photo=fileName
                  def instance=result.jobseekerInstance.save(flush:true)
                  if(result.jobseekerInstance.hasErrors() || !instance){
                        return fail(code:"default.create.failure")
                  }
                  return result;
            }
      }

      public def update(Jobseeker jobseeker,params,fileName){
            def result = [:]
            Jobseeker.withTransaction {status ->
                  def fail = { Map m ->
                        status.setRollbackOnly()
                        if(result.jobseekerInstance && m.field){
                              result.jobseekerInstance.errors.rejectValue(m.field, m.code)
                        }
                        result.error = [ code: m.code ]
                        return result
                  }
                  result.jobseekerInstance = bindJobseeker(jobseeker,params);
                  if(params.remove_photo){
                        fileUploadService.deleteFile("/upload/images",result.jobseekerInstance.photo)
                        result.jobseekerInstance.photo=null
                  }
                  result.demamdInstance?.photo=fileName
                  def instance=result.jobseekerInstance.save(flush:true)
                  if(result.jobseekerInstance.hasErrors() || !instance){
                        return fail(code:"default.create.failure")
                  }
                  return result;
            }
      }

      private Jobseeker bindJobseeker(Jobseeker jobseeker,params)  {
            if(!jobseeker)
                  jobseeker=new Jobseeker()
            jobseeker.properties=params

            jobseeker.nationality=FixedValue.findByIdAndFieldType(params.nationality.id,FieldType.NATIONALITY)
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
            return jobseeker
      }
}
