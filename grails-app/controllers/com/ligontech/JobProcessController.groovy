package com.ligontech

import org.springframework.dao.DataIntegrityViolationException

class JobProcessController {

      static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

      def index() {
            redirect(action: "list", params: params)
      }

      def list(Integer max) {
            params.max = Math.min(max ?: 10, 100)
            [jobProcessInstanceList: JobProcess.list(params), jobProcessInstanceTotal: JobProcess.count()]
      }

      def create() {
            [jobProcessInstance: new JobProcess(params)]
      }

      def save() {
            def jobProcessInstance = new JobProcess(params)
            if (!jobProcessInstance.save(flush: true)) {
                  render(view: "create", model: [jobProcessInstance: jobProcessInstance])
                  return
            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'jobProcess.label', default: 'JobProcess'), jobProcessInstance.id])
            redirect(action: "show", id: jobProcessInstance.id)
      }

      def show(Long id) {
            def jobProcessInstance = JobProcess.get(id)
            if (!jobProcessInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'jobProcess.label', default: 'JobProcess'), id])
                  redirect(action: "list")
                  return
            }

            [jobProcessInstance: jobProcessInstance]
      }

      def edit(Long id) {
            def jobProcessInstance = JobProcess.get(id)
            if (!jobProcessInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'jobProcess.label', default: 'JobProcess'), id])
                  redirect(action: "list")
                  return
            }

            [jobProcessInstance: jobProcessInstance]
      }

      def update(Long id, Long version) {
            def jobProcessInstance = JobProcess.get(id)
            if (!jobProcessInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'jobProcess.label', default: 'JobProcess'), id])
                  redirect(action: "list")
                  return
            }

            if (version != null) {
                  if (jobProcessInstance.version > version) {
                        jobProcessInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                              [message(code: 'jobProcess.label', default: 'JobProcess')] as Object[],
                              "Another user has updated this JobProcess while you were editing")
                        render(view: "edit", model: [jobProcessInstance: jobProcessInstance])
                        return
                  }
            }

            jobProcessInstance.properties = params

            if (!jobProcessInstance.save(flush: true)) {
                  render(view: "edit", model: [jobProcessInstance: jobProcessInstance])
                  return
            }

            flash.message = message(code: 'default.updated.message', args: [message(code: 'jobProcess.label', default: 'JobProcess'), jobProcessInstance.id])
            redirect(action: "show", id: jobProcessInstance.id)
      }

      def delete(Long id) {
            def jobProcessInstance = JobProcess.get(id)
            if (!jobProcessInstance) {
                  flash.message = message(code: 'default.not.found.message', args: [message(code: 'jobProcess.label', default: 'JobProcess'), id])
                  redirect(action: "list")
                  return
            }

            try {
                  jobProcessInstance.delete(flush: true)
                  flash.message = message(code: 'default.deleted.message', args: [message(code: 'jobProcess.label', default: 'JobProcess'), id])
                  redirect(action: "list")
            }
            catch (DataIntegrityViolationException e) {
                  flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'jobProcess.label', default: 'JobProcess'), id])
                  redirect(action: "show", id: id)
            }
      }
}
