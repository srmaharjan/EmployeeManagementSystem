package com.ligontech

import grails.plugin.springsecurity.annotation.Secured
import org.apache.shiro.authz.annotation.Logical
import org.apache.shiro.authz.annotation.RequiresPermissions

import java.text.SimpleDateFormat


@Secured(['IS_AUTHENTICATED_FULLY'])
class JobseekerController {

      def jobseekerService;
      def springSecurityService

      static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
      @RequiresPermissions(value=['jobseeker:view','jobseeker:create','jobseeker:delete','jobseeker:update'],logical=Logical.OR)
      def search() {
            def result = jobseekerService.search(params)
            def model=jobseekerService.requiredResources();
            if(result.error) {
                  flash.message = g.message(code: result.error?.code, args: result.error?.args)
                  model=model+[jobseekerInstanceList: [], jobseekerInstanceTotal:0]
                  render(view: "list", model: model)
            }
            model=model+[jobseekerInstanceList: result?.results, jobseekerInstanceTotal: result?.total]
            render(view: "list", model: model)
      }
      @RequiresPermissions(value=['jobseeker:view','jobseeker:create','jobseeker:delete','jobseeker:update'],logical=Logical.OR)
      def index() {
            redirect(action: "list", params: params)
      }

      @RequiresPermissions(value=['jobseeker:view','jobseeker:create','jobseeker:delete','jobseeker:update'],logical=Logical.OR)
      def list(Integer max) {
            def result = jobseekerService.list(params)
            def model=jobseekerService.requiredResources();
            if(!result.error) {
                  model=model+[jobseekerInstanceList: result?.results, jobseekerInstanceTotal: result?.total]
                  render(view: "list", model: model)
                  return;
            }
            flash.message = g.message(code: result.error.code, args: result.error.args)
            model=model+[jobseekerInstanceList: [], jobseekerInstanceTotal:0]
            render(view: "list", model: model)
      }

      def create() {
            jobseekerService.requiredResources();
      }

      @RequiresPermissions('jobseeker:create')
      def save() {
            def result=jobseekerService.create(params)
            if(!result.error) {
                  flash.message = message(code: 'default.created.message', args: [message(code: 'jobseeker.label', default: 'Jobseeker'), result?.jobseeker.id])
                  redirect(action: "show", id: result?.jobseeker.id)
                  return
            }
            def model=jobseekerService.requiredResources();
            render(view: "create", model: [jobseekerInstance: result?.jobseeker]+model)
      }


      @RequiresPermissions(value=['jobseeker:view','jobseeker:create','jobseeker:delete','jobseeker:update'],logical=Logical.OR)
      def show(Integer id) {
            def jobseekerInstance = jobseekerService.findById(id);
            if (!jobseekerInstance) {
                  def model=jobseekerService.requiredResources();
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'jobseeker.label', default: 'FixedValue'), id])
                  redirect(action: "list",model:model)
                  return
            }
            [jobseekerInstance: jobseekerInstance]
      }

      @RequiresPermissions('jobseeker:update')
      def edit(Integer id) {
            def jobseekerInstance =jobseekerService.findById(id);
            def model=jobseekerService.requiredResources();
            if (!jobseekerInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'jobseeker.label', default: 'FixedValue'), id])
                  redirect(action: "list",model:model)
                  return
            }
            [jobseekerInstance: jobseekerInstance]+model
      }

      @RequiresPermissions('jobseeker:update')
      def update(Integer id, Long version) {
            def result=jobseekerService.update(params)
            if(!result.error) {
                  flash.message = message(code: 'default.updated.message', args: [message(code: 'jobseeker.label', default: 'FixedValue'), result?.jobseeker.id])
                  redirect(action: "show", id: result?.jobseeker.id)
                  return
            }
            def model=jobseekerService.requiredResources();
            if(result.error.code == "default.not.found") {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'jobseeker.label', default: 'FixedValue'), id])
                  redirect(action: "list",model:model)
                  return
            }
            render(view: "edit", model: [jobseekerInstance: result.jobseeker.attach()]+model)
      }

      @RequiresPermissions('jobseeker:delete')
      def delete(Integer id) {
            def jobseekerInstance = jobseekerService.findById(id)
            def model=jobseekerService.requiredResources();
            if (!jobseekerInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'jobseeker.label', default: 'FixedValue'), id])
                  redirect(action: "list",model:model)
                  return
            }
            def result=jobseekerService.delete(jobseekerInstance)
            if(!result.error) {
                  flash.message = message(code: 'default.deleted.message', args: [message(code: 'jobseeker.label', default: 'FixedValue'), id])
                  redirect(action: "list",model:model);
                  return
            }
            if(result.error.code == "default.not.found") {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'jobseeker.label', default: 'FixedValue'), id])
                  redirect(action: "list",model:model)
                  return
            }
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'jobseeker.label', default: 'FixedValue'), id])
            redirect(action: "show", id: id)
      }

      private Jobseeker createMockJobseeker(){
            SimpleDateFormat sdf=new SimpleDateFormat('yyy-MM-dd')
            def education=new AcedemicEducation([nameOfDegree: 'Compluter Science',board: 'TU',college_school: 'school',degree:FixedValue.findById(15),graduationYear: 'Running'])
            def training=new Training([trainingCenter: 'Ligon tech',trainingObjective: 'Basic java',topic: 'Java',duration: '3 month'])
            def passport=new Passport([remarks: 'passport remark',number: 'passport number',issuedAddress: 'kathmandu',issuedDate: sdf.parse('2009-10-01'),issuedBy: 'issuedby',expiryDate:  sdf.parse('2019-10-01')])
            def currentAddress=new NepAddress([muncipalityOrVdc: 'kathmandu',zone: FixedValue.findById(32),country: [id: 1],district:FixedValue.findById(90),blockNumber: '39/13',street: 'kilako galli',wardNumber: 18])
            def permanentAddress=new NepAddress([muncipalityOrVdc: 'kathmandu',zone:FixedValue.findById(32),country: [id: 1],district: FixedValue.findById(90),blockNumber: '39/13',street: 'kilako galli',wardNumber: 18])
            def jobseeker=new Jobseeker([contactNumber:79879872,otherDescription:'yahoo',gender:FixedValue.findById(9),height:1.3,nominee:'nominee',nomineeAddress:'nominee Address',middleName:'middle name',lastName:'last name',nationality:FixedValue.findById(28),relation:'wife',religion:FixedValue.findById(1),dateOfBirth: sdf.parse('2013-10-01'),weight:80,localAgent:[id:1],firstName:'first name',jobCategory:JobCategory.findById(1),nomineeContactNumber:5876887,complexion:'white',workExperience:'experience',mobileNumber:42342234])
//        def jobseeker=new Jobseeker([contactNumber:79879872,otherDescription:'yahoo',gender:FixedValue.findById(9),height:1.3,nominee:'nominee',nomineeAddress:'nominee Address',middleName:'middle name',lastName:'last name',nationality:FixedValue.findById(42),relation:'wife',religion:FixedValue.findById(1),dateOfBirth: sdf.parse('2013-10-01'),weight:80,localAgent:[id:1],firstName:'first name',jobCategory:JobCategory.findById(1),nomineeContactNumber:5876887,complexion:'white',workExperience:'experience',mobileNumber:42342234])
            jobseeker.educations.add(education)
            jobseeker.trainings.add(training)
            jobseeker.passport=passport
            jobseeker.currentAddress=currentAddress
            jobseeker.permanentAddress=permanentAddress
            jobseeker.localAgent=Agent.findById(1)

            return jobseeker;
      }
}
