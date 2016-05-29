package com.ligontech

import org.codehaus.groovy.grails.web.context.ServletContextHolder
import org.codehaus.groovy.grails.web.util.WebUtils
import org.springframework.web.multipart.MultipartFile

class FileUploadService {
      def grailsApplication;
      def springSecurityService

      def uploadImage(String fileName,String fileType){
            FileEntry fileEntry=new FileEntry();
            def result=[:]
            def fail = { Map m ->
                  result.error = [ code: m.code ]
                  return result
            }
            def webUtils = WebUtils.retrieveGrailsWebRequest()
            def request=webUtils.getCurrentRequest();
            MultipartFile file=request.getFile(fileName)
            if(!file || file.isEmpty()){
                  return result;
            }
            def config = grailsApplication.config.fileuploader[fileType];
            def path = config.path;
            def servletContext = ServletContextHolder.servletContext
            def storagePath = servletContext.getRealPath(path)
            if(!new File(storagePath).exists()){
                  log.error "directory not exists"
                  if (!new File(storagePath).mkdirs()){
                        log.error "Fail to create create directories: [${path}]"
                        return fail(code:'fileupload.upload.invalid')
                  }
            }
            if (!path.endsWith('/'))
                  path = path+"/"

            String fileNameBase = UUID.randomUUID().toString()
            String fileExtension = file.originalFilename.substring(file.originalFilename.lastIndexOf(".")+1)
            String newFilename= fileNameBase +'.'+ fileExtension

            fileEntry.path=path;
            fileEntry.extension=fileExtension;
            fileEntry.fileName=newFilename;
            fileEntry.contentType=file.contentType
            fileEntry.size=file.size
            if (!config.allowedExtensions[0].equals("*")) {
                  if (!config.allowedExtensions.contains(fileExtension)) {
                        return fail(code:'fileupload.upload.invalid')
                        //result['msg']=messageSource.getMessage("fileupload.upload.invalid", [fileExtension, config.allowedExtensions] as Object[], request.locale)
                  }
            }
            if (config.maxSize) {
                  def maxSizeInKb = ((int) (config.maxSize/1024))
                  if (file.size > config.maxSize) { //if filesize is bigger than allowed
                        log.warn "FileUploader plugin received a file bigger than allowed. Max file size is ${maxSizeInKb} kb"
                        return fail(code:'fileupload.upload.invalidSize')
                        //  result['msg'] = messageSource.getMessage("fileupload.upload.invalidSize", [maxSizeInKb] as Object[], request.locale)
                  }
            }


            if (!file.isEmpty()) {
                  file.transferTo(new File("${storagePath}/${newFilename}"))
            }
            return [fileEntry:fileEntry];
      }
      def String uploadFile(MultipartFile file, String destinationDirectory,String fileName) {
            if(!file){
                  return null;
            }
            String newFilename=fileName;
            if(!fileName){
                  String newFilenameBase = UUID.randomUUID().toString()
                  String originalFileExtension = file.originalFilename.substring(file.originalFilename.lastIndexOf("."))
                  newFilename= newFilenameBase + originalFileExtension
            }

            def servletContext = ServletContextHolder.servletContext
            def storagePath = servletContext.getRealPath(destinationDirectory)

            def storagePathDirectory = new File(storagePath)
            if (!storagePathDirectory.exists()) {
                  storagePathDirectory.mkdirs()
            }
            if (!file.isEmpty()) {
                  file.transferTo(new File("${storagePath}/${newFilename}"))
                  return "${newFilename}"

            }
            return null;
      }
      def deleteFile(String filePath,String fileName){
            if(!filePath || !fileName){
                  return;
            }
            def servletContext = ServletContextHolder.servletContext
            def storagePath = servletContext.getRealPath(filePath)

            File file= new File(storagePath,fileName)
            println "file = $file"
            if(file.exists()){
                  if(file.isDirectory()){
                        file.deleteDir()
                  }else{
                        file.delete();
                  }
            }
      }

      def uploadFiles(params,request){
            def currentUser=springSecurityService.getCurrentUser()
            def location="${currentUser.userCustomerCode}/"+(params.jobseekerId?:'');
            if (!location.endsWith('/'))
                  location = location+"/"
            def result=[:]
            result.fileList=[]
            def fail = { Map m ->
                  result.error = [ code: m.code ]
                  result.fileList=[];
                  return result
            }
            request.getFileNames().each{
                  def output=upload(location,request,'docs',params.title,it)
                  if(output.error){
                        return fail(code:output.error.code);
                  }
                  result.fileList.add(output.fileEntry);
            }
            return result;

      }
      def downloadDocument(Documents document){
            File file = document.getFile()
            if (file.exists()) {
                  return [file:file,name:document.name+'.'+document.extension];
            }
            return null;

      }


      private Map upload(location,request,fileType,fileName,actualFileName){

            def result=[:]
            def fail = { Map m ->
                  result.error = [ code: m.code ]
                  result.fileEntry=null;
                  return result
            }
            FileEntry fileEntry=new FileEntry();
            fileEntry.name=fileName
            MultipartFile file=request.getFile(actualFileName)
            if(!file || file.isEmpty()){
                  return result;
            }
            def config = grailsApplication.config.fileuploader[fileType];
            def path = config.path
            if (!path.endsWith('/'))
                  path = path+"/"
            path = config.path+"${location}";
            def servletContext = ServletContextHolder.servletContext
            def storagePath = servletContext.getRealPath(path)
            if(!new File(storagePath).exists()){
                  log.error "directory not exists"
                  if (!new File(storagePath).mkdirs()){
                        log.error "Fail to create create directories: [${path}]"
                        return fail(code:'fileupload.upload.invalid')
                  }
            }


            def (String fileExtension, String newFilename) = fileProperty(file, path, fileEntry)
            if (!config.allowedExtensions[0].equals("*")) {
                  if (!config.allowedExtensions.contains(fileExtension)) {
                        return fail(code:'fileupload.upload.invalid')
                        //result['msg']=messageSource.getMessage("fileupload.upload.invalid", [fileExtension, config.allowedExtensions] as Object[], request.locale)
                  }
            }
            if (config.maxSize) {
                  def maxSizeInKb = ((int) (config.maxSize/1024))
                  if (file.size > config.maxSize) { //if filesize is bigger than allowed
                        log.warn "FileUploader plugin received a file bigger than allowed. Max file size is ${maxSizeInKb} kb"
                        return fail(code:'fileupload.upload.invalidSize')
                        //  result['msg'] = messageSource.getMessage("fileupload.upload.invalidSize", [maxSizeInKb] as Object[], request.locale)
                  }
            }


            if (!file.isEmpty()) {
                  file.transferTo(new File("${storagePath}/${newFilename}"))
            }
            result.fileEntry=fileEntry
            return result;
      }

      private List fileProperty(MultipartFile file, String path, FileEntry fileEntry) {
            String fileNameBase = UUID.randomUUID().toString()
            String fileExtension = file.originalFilename.substring(file.originalFilename.lastIndexOf(".") + 1)
            String newFilename = fileNameBase + '.' + fileExtension

            fileEntry.path = path;
            fileEntry.extension = fileExtension;
            fileEntry.fileName = newFilename;
            fileEntry.contentType = file.contentType
            fileEntry.size=file.size
            [fileExtension, newFilename]
      }
}
