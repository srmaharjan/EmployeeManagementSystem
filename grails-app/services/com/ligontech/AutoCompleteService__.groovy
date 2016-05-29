package com.ligontech

import grails.converters.JSON
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

class AutoCompleteService__ {
      def grailsApplication
      def springSecurityService;
      def autoComplete (params,max) {
            def fieldType=FieldType.valueOf(params.fieldType)
            def results = FixedValue.createCriteria().list {
                  ilike('value', params.query + '%')
                  and {
                        eq('fieldType' , fieldType)
                        eq('isDeleted',0L)
                        eq('customer.id',springSecurityService.getCurrentUser().userCustomerCode)
                  }
                  maxResults(max)
            }
            if (results.size()< 5){
                  results = FixedValue.createCriteria().list {
                        ilike('value', "%${params.query}%")
                        and {
                              eq('fieldType' , fieldType)
                              eq('isDeleted',0L)
                              eq('customer.id',springSecurityService.getCurrentUser().userCustomerCode)
                        }
                        maxResults(max)
                  }
            }
            results = results.collect {
                  def data=it
                  def json
                  JSON.use("deep") {
                        def converter = data as JSON
                        converter.prettyPrint = true
                        json = converter.toString()
                  }
                  return [data:json,value:it.value]
            }.unique()
            return [suggestions:results] as JSON
      }

      /**
       * {'domain':'com.ligontech.Jobs','query:'xy',searchField:['value','description'],parent:12,parentClass:'Demand'}
       * @param params
       * @param max
       * @return
       */
      def autoCompleteAction (GrailsParameterMap params,max) {
            def domainClass = grailsApplication.getDomainClass(params.domain).clazz
            if(!AutoComplete.class.isAssignableFrom(domainClass)){
                  return [suggestions:[:]] as JSON
            }
            def searchField=domainClass.getSearchFieldList()
            if(!searchField){
                  return [suggestions:[:]] as JSON
            }
            def parentDomain=domainClass.getParent()
            // println "{domainClass.extraQuery1} = ${domainClass.extraQuery1}"
            //create whole criteria query into string and conver it using GroovyShell
            def results = domainClass.createCriteria().list(createCriteriaQuery(searchField,domainClass,params,parentDomain,max))
            results = results.collect {
                  return [data:it.toJson(),value:it.toQueryString()]
            }.unique()
            return [suggestions:results] as JSON
      }
      public def getQuery(builder){
            builder.ge 'deadline', new Date()
           // return {and{ge('deadline',new Date())}}
      }
      private def createCriteriaQuery(searchField,domainClass,params,parentDomain,max){
            def resultString='{\n';
            resultString+="or{\n"
            searchField.each{
                  resultString+=createComplexQuery(params.query,it)+'\n'
            }
            resultString+="}"+'\n'
           // resultString+=domainClass.extraQuery()+'\n';
            resultString+="and{"+'\n'
            if(params.parent && parentDomain){
                  parentDomain.each{
                        resultString+=createComplexQuery(params.parent,it)+'\n'
                  }
            }
            resultString+="eq('isDeleted',0L)"+'\n'
            resultString+="eq('customer.id','"+springSecurityService.getCurrentUser().userCustomerCode+"')"+'\n'
            resultString+="}"+'\n'
            resultString+="maxResults("+max+")" +'\n'+
                  "}"
            println "resultString = $resultString"
           return (new GroovyShell().evaluate("return " + resultString))
      }

      private def createQuery(query,operator){
            switch(operator){
                  case 'ilike':
                        return "%${query}%";
                        break;
                  default:
                        return query;
            }
      }

      private def createComplexQuery(query,obj){
            def split = obj.key.toString().split('\\.') as List
            if(split.size() ==1) {
                  return "$obj.value('$obj.key','"+createQuery(query,obj.value)+"')"
            }
            def items = []
            split.each{
                  if(it == split.last()){
                      //  items << "{"
                        items << "$obj.value('$it','"+createQuery(query,obj.value)+"')"
                        split.indexOf(it-1).times{items.push("}")}
                  } else if(it==split.first()){
                        items << "'$it'{"
                  }else{
                        items << "'$it'{"
                  }
            }
            println "items = ${items.join()}"
            return items.join();
            //new GroovyShell().evaluate("return " + items.join())

      }
}
