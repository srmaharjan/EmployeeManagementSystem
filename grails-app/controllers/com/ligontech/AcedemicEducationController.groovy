package com.ligontech

import grails.plugin.springsecurity.annotation.Secured
import org.apache.shiro.authz.annotation.Logical
import org.apache.shiro.authz.annotation.RequiresPermissions
import org.springframework.dao.DataIntegrityViolationException

@Secured(['IS_AUTHENTICATED_FULLY'])
class AcedemicEducationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
//      @RequiresPermissions(value=[test.toString(), 'action:kick'], logical=Logical.OR)
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [acedemicEducationInstanceList: AcedemicEducation.list(params), acedemicEducationInstanceTotal: AcedemicEducation.count()]
    }

    def create() {
        [acedemicEducationInstance: new AcedemicEducation(params)]
    }

    def save() {
        def acedemicEducationInstance = new AcedemicEducation(params)
        if (!acedemicEducationInstance.save(flush: true)) {
            render(view: "create", model: [acedemicEducationInstance: acedemicEducationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'acedemicEducation.label', default: 'AcedemicEducation'), acedemicEducationInstance.id])
        redirect(action: "show", id: acedemicEducationInstance.id)
    }

    def show(Long id) {
        def acedemicEducationInstance = AcedemicEducation.get(id)
        if (!acedemicEducationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'acedemicEducation.label', default: 'AcedemicEducation'), id])
            redirect(action: "list")
            return
        }

        [acedemicEducationInstance: acedemicEducationInstance]
    }

    def edit(Long id) {
        def acedemicEducationInstance = AcedemicEducation.get(id)
        if (!acedemicEducationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'acedemicEducation.label', default: 'AcedemicEducation'), id])
            redirect(action: "list")
            return
        }

        [acedemicEducationInstance: acedemicEducationInstance]
    }

    def update(Long id, Long version) {
        def acedemicEducationInstance = AcedemicEducation.get(id)
        if (!acedemicEducationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'acedemicEducation.label', default: 'AcedemicEducation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (acedemicEducationInstance.version > version) {
                acedemicEducationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'acedemicEducation.label', default: 'AcedemicEducation')] as Object[],
                        "Another user has updated this AcedemicEducation while you were editing")
                render(view: "edit", model: [acedemicEducationInstance: acedemicEducationInstance])
                return
            }
        }

        acedemicEducationInstance.properties = params

        if (!acedemicEducationInstance.save(flush: true)) {
            render(view: "edit", model: [acedemicEducationInstance: acedemicEducationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'acedemicEducation.label', default: 'AcedemicEducation'), acedemicEducationInstance.id])
        redirect(action: "show", id: acedemicEducationInstance.id)
    }

    def delete(Long id) {
        def acedemicEducationInstance = AcedemicEducation.get(id)
        if (!acedemicEducationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'acedemicEducation.label', default: 'AcedemicEducation'), id])
            redirect(action: "list")
            return
        }

        try {
            acedemicEducationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'acedemicEducation.label', default: 'AcedemicEducation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'acedemicEducation.label', default: 'AcedemicEducation'), id])
            redirect(action: "show", id: id)
        }
    }
}
