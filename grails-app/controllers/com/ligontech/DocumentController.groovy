package com.ligontech

import grails.converters.JSON
import org.apache.shiro.authz.annotation.Logical
import org.apache.shiro.authz.annotation.RequiresPermissions

import javax.imageio.ImageIO
import javax.servlet.ServletOutputStream
import java.awt.image.BufferedImage
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream

class DocumentController {
      def documentService

      @RequiresPermissions(value=['jobseeker:create','jobseeker:update'],logical=Logical.OR)
      def upload() {
            def fileResult=documentService.upload(params,request);
            if(fileResult.error){
                  render ([files:fileResult] as JSON)
            }else{
                  render(template: '/jobseeker/document',model:['document':fileResult.document,'jobseeker':params.jobseekerId])
            }
      }

      @RequiresPermissions(value=['jobseeker:view','jobseeker:create','jobseeker:delete','jobseeker:update'],logical=Logical.OR)
      def download(Long id){
            def  result=documentService.download(params);
            if(!result){
                  flash.error = g.message(code:'',default: 'File not found!')
                  redirect(controller: 'jobseeker',action: 'show',id:params.jobseekerId)
                  return;
            }
            response.setContentType("application/octet-stream")
            response.setHeader("Content-disposition", "filename=${result.name}")
            response.setHeader("Content-Length", "${result.file.size()}")
            response.outputStream << result.file.newInputStream()
            return

      }
      @RequiresPermissions(value=['jobseeker:view','jobseeker:create','jobseeker:delete','jobseeker:update'],logical=Logical.OR)
      def downloadAll(){
            def jobseeker=documentService.downloadAll(params);
            if(jobseeker){
                  ByteArrayOutputStream baos = new ByteArrayOutputStream()
                  ZipOutputStream zipFile = new ZipOutputStream(baos)
                  jobseeker.documents.each {Documents doc ->
                        File file = doc.getFile()
                        if(file){
                              zipFile.putNextEntry(new ZipEntry(doc.name+'_'+doc.fileName+"."+doc.extension))
                              file.withInputStream { i ->
                                    zipFile << i
                              }
                              zipFile.closeEntry()
                        }
                  }
                  zipFile.finish()
                  response.setHeader("Content-disposition", "filename=\"${jobseeker}_all_document.zip\"")
                  response.contentType = "application/zip"
                  response.outputStream << baos.toByteArray()
                  response.outputStream.flush()
            }else{
                  flash.error = g.message(code:'',default: 'Fail to download all document, Please try again!')
                  redirect(controller: 'jobseeker',action: 'show',id:params.jobseekerId)
                  return;
            }
      }
      @RequiresPermissions(value=['jobseeker:delete'])
      def delete(){
            def result=documentService.delete(params);
            if (request.xhr) {
                  render(result);
            }else{
                  flash.message = g.message(code:'',default:ServerCode.getMessage(result))
                  redirect(controller: 'jobseeker',action: 'show',id:params.jobseekerId)
            }
            return;
      }
      def bulkDelete(){
            def result=documentService.bulkDelete(params)
            render result as JSON
      }
}
