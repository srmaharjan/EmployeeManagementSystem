package com.ligontech

import grails.plugin.springsecurity.annotation.Secured


@Secured(['IS_AUTHENTICATED_FULLY'])
class AutoCompleteController {
    def autoCompleteService

    def autoComplete(){
        println "params = $params"
        int max=params.max?:10;
        render autoCompleteService.autoComplete(params,max)
    }
    def autoCompleteAction() {
        if(params.list('searchField[]')){
            params.searchField=params.list('searchField[]')
        }
        int max=params.max?:10;
        render autoCompleteService.autoCompleteAction(params,max)
    }
}
