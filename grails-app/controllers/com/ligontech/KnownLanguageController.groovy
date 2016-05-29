package com.ligontech

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException


@Secured(['IS_AUTHENTICATED_FULLY'])
class KnownLanguageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [knownLanguageInstanceList: KnownLanguage.list(params), knownLanguageInstanceTotal: KnownLanguage.count()]
    }

    def create() {
        [knownLanguageInstance: new KnownLanguage(params)]
    }

    def save() {
        def knownLanguageInstance = new KnownLanguage(params)
        if (!knownLanguageInstance.save(flush: true)) {
            render(view: "create", model: [knownLanguageInstance: knownLanguageInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'knownLanguage.label', default: 'KnownLanguage'), knownLanguageInstance.id])
        redirect(action: "show", id: knownLanguageInstance.id)
    }

    def show(Long id) {
        def knownLanguageInstance = KnownLanguage.get(id)
        if (!knownLanguageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'knownLanguage.label', default: 'KnownLanguage'), id])
            redirect(action: "list")
            return
        }

        [knownLanguageInstance: knownLanguageInstance]
    }

    def edit(Long id) {
        def knownLanguageInstance = KnownLanguage.get(id)
        if (!knownLanguageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'knownLanguage.label', default: 'KnownLanguage'), id])
            redirect(action: "list")
            return
        }

        [knownLanguageInstance: knownLanguageInstance]
    }

    def update(Long id, Long version) {
        def knownLanguageInstance = KnownLanguage.get(id)
        if (!knownLanguageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'knownLanguage.label', default: 'KnownLanguage'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (knownLanguageInstance.version > version) {
                knownLanguageInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'knownLanguage.label', default: 'KnownLanguage')] as Object[],
                        "Another user has updated this KnownLanguage while you were editing")
                render(view: "edit", model: [knownLanguageInstance: knownLanguageInstance])
                return
            }
        }

        knownLanguageInstance.properties = params

        if (!knownLanguageInstance.save(flush: true)) {
            render(view: "edit", model: [knownLanguageInstance: knownLanguageInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'knownLanguage.label', default: 'KnownLanguage'), knownLanguageInstance.id])
        redirect(action: "show", id: knownLanguageInstance.id)
    }

    def delete(Long id) {
        def knownLanguageInstance = KnownLanguage.get(id)
        if (!knownLanguageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'knownLanguage.label', default: 'KnownLanguage'), id])
            redirect(action: "list")
            return
        }

        try {
            knownLanguageInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'knownLanguage.label', default: 'KnownLanguage'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'knownLanguage.label', default: 'KnownLanguage'), id])
            redirect(action: "show", id: id)
        }
    }
}
