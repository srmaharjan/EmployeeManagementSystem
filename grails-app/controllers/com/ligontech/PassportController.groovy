package com.ligontech

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['IS_AUTHENTICATED_FULLY'])
class PassportController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [passportInstanceList: Passport.list(params), passportInstanceTotal: Passport.count()]
    }

    def create() {
        [passportInstance: new Passport(params)]
    }

    def save() {
        def passportInstance = new Passport(params)
        if (!passportInstance.save(flush: true)) {
            render(view: "create", model: [passportInstance: passportInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'passport.label', default: 'Passport'), passportInstance.id])
        redirect(action: "show", id: passportInstance.id)
    }

    def show(Long id) {
        def passportInstance = Passport.get(id)
        if (!passportInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'passport.label', default: 'Passport'), id])
            redirect(action: "list")
            return
        }

        [passportInstance: passportInstance]
    }

    def edit(Long id) {
        def passportInstance = Passport.get(id)
        if (!passportInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'passport.label', default: 'Passport'), id])
            redirect(action: "list")
            return
        }

        [passportInstance: passportInstance]
    }

    def update(Long id, Long version) {
        def passportInstance = Passport.get(id)
        if (!passportInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'passport.label', default: 'Passport'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (passportInstance.version > version) {
                passportInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'passport.label', default: 'Passport')] as Object[],
                        "Another user has updated this Passport while you were editing")
                render(view: "edit", model: [passportInstance: passportInstance])
                return
            }
        }

        passportInstance.properties = params

        if (!passportInstance.save(flush: true)) {
            render(view: "edit", model: [passportInstance: passportInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'passport.label', default: 'Passport'), passportInstance.id])
        redirect(action: "show", id: passportInstance.id)
    }

    def delete(Long id) {
        def passportInstance = Passport.get(id)
        if (!passportInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'passport.label', default: 'Passport'), id])
            redirect(action: "list")
            return
        }

        try {
            passportInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'passport.label', default: 'Passport'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'passport.label', default: 'Passport'), id])
            redirect(action: "show", id: id)
        }
    }
}
