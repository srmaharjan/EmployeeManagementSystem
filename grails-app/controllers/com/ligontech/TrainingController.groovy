package com.ligontech

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['IS_AUTHENTICATED_FULLY'])
class TrainingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [trainingInstanceList: Training.list(params), trainingInstanceTotal: Training.count()]
    }

    def create() {
        [trainingInstance: new Training(params)]
    }

    def save() {
        def trainingInstance = new Training(params)
        if (!trainingInstance.save(flush: true)) {
            render(view: "create", model: [trainingInstance: trainingInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'training.label', default: 'Training'), trainingInstance.id])
        redirect(action: "show", id: trainingInstance.id)
    }

    def show(Long id) {
        def trainingInstance = Training.get(id)
        if (!trainingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'training.label', default: 'Training'), id])
            redirect(action: "list")
            return
        }

        [trainingInstance: trainingInstance]
    }

    def edit(Long id) {
        def trainingInstance = Training.get(id)
        if (!trainingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'training.label', default: 'Training'), id])
            redirect(action: "list")
            return
        }

        [trainingInstance: trainingInstance]
    }

    def update(Long id, Long version) {
        def trainingInstance = Training.get(id)
        if (!trainingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'training.label', default: 'Training'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (trainingInstance.version > version) {
                trainingInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'training.label', default: 'Training')] as Object[],
                        "Another user has updated this Training while you were editing")
                render(view: "edit", model: [trainingInstance: trainingInstance])
                return
            }
        }

        trainingInstance.properties = params

        if (!trainingInstance.save(flush: true)) {
            render(view: "edit", model: [trainingInstance: trainingInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'training.label', default: 'Training'), trainingInstance.id])
        redirect(action: "show", id: trainingInstance.id)
    }

    def delete(Long id) {
        def trainingInstance = Training.get(id)
        if (!trainingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'training.label', default: 'Training'), id])
            redirect(action: "list")
            return
        }

        try {
            trainingInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'training.label', default: 'Training'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'training.label', default: 'Training'), id])
            redirect(action: "show", id: id)
        }
    }
}
