package com.ligontech

class DocumentService {
	def fileUploadService
	def jobseekerService
	def springSecurityService
	static transactional = false

	def upload(params,request) {
		def fileResult=fileUploadService.uploadFiles(params,request)
		def result=[:]
		if(fileResult.error){
			fileResult.fileList.each{FileEntry item ->
				def file = [:]
				file.put("name", item.name);
				file.put('size',item.size)
				file.put('error',fileResult.error)
				result.error=file
			}
		}else{
			fileResult.fileList.each{FileEntry item ->
				Jobseeker.withTransaction { status ->
					try{
						Documents doc=item.convertToDocuments()
						Jobseeker jobseeker=jobseekerService.findByIdWithLock(params.jobseekerId)
						if(jobseeker){
							jobseeker.addToDocuments(doc).save(flush: true);
							result.document=doc
//                                          def file = [:]
//                                          file.put("name", item.name);
//                                          file.put('size',item.size)
//                                          file.put("deleteType", "POST");
//                                          file.put("url", "${grailsLinkGenerator.link(controller: 'document',action:'download',params: [file:doc.id])}");
//                                          file.put("deleteUrl", "${grailsLinkGenerator.link(controller: 'document',action:'delete',params: [file:doc.id])}");
//                                          result.add(file);
						}else{
							def file = [:]
							file.put("name", item.name);
							file.put('size',item.size)
							file.put('error','Invalid Jobseeker')
							result.error=file
						}
					}catch(er){
						def file = [:]
						file.put("name", item.name);
						file.put('size',item.size)
						file.put('error',er.message)
						result.error=file
						log.error(er.message)
						status.setRollbackOnly();
					}
				}

			}
		}
		return result;
	}

	def download(params){
		def documents=Documents.findByIdAndFileName(params.id,params.name);
		if(documents.jobseeker.id==params.jobseekerId.toString().toLong()){
			return fileUploadService.downloadDocument(documents);
		}
		return null;
	}
	def downloadAll(params){
		return jobseekerService.findById(params.jobseekerId);
	}
	def delete(params){
		def result=ServerCode.NOT_FOUND
		def documents=Documents.findByIdAndFileName(params.id,params.name);
		if(documents && documents.jobseeker.id==params.jobseekerId.toString().toLong()){
			Jobseeker.withTransaction { status ->
				try{
					Jobseeker jobseeker=jobseekerService.findByIdWithLock(params.jobseekerId)
					if(jobseeker){
						File file= documents.getFile()
						jobseeker.removeFromDocuments(documents).save(flush: true);
						if(file.exists()){
							file.delete();
						}
						result=ServerCode.SUCCESS
					}else{
						result=ServerCode.ERROR
					}
				}catch(er){
					log.error(er.message)
					result=ServerCode.ERROR
					status.setRollbackOnly();
				}
			}
		}
		return result;
	}

	def bulkDelete(params){
		def result=[:]
		def documentList=findAllByIdlistAndJobseeker(params['id[]'])
		Jobseeker.withTransaction {status ->
			Jobseeker jobseeker=jobseekerService.findByIdWithLock(params.jobseekerid);
			documentList.each{
				def id=it.id;
				File file=it.getFile();
				jobseeker.removeFromDocuments(it);
				if(file && file.exists()){
					file.delete();
				}
				result[id]=ServerCode.SUCCESS
			}
		}
		return result;
	}

	def findAllByIdlistAndJobseeker(idList){
//		if(idList.class?.isArray()){
//			idList=new ArrayList()
//			idList=idList*.toLong();
//		}
		def currentUser=springSecurityService.getCurrentUser()
		try{
			List<Documents> listDocuments=Documents.domain(currentUser.userCustomerCode).listAll.list{
				it.id in idList
			}
//	            List<Documents> listDocuments=Documents.domain(currentUser.userCustomerCode).listAll.list()
			return listDocuments;
		}catch(er){
			er.printStackTrace();
		}
		return [];
	}
}
