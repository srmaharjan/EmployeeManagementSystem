package com.ligontech

import grails.converters.JSON
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

class AutoCompleteService {
	def grailsApplication
	def springSecurityService;

	def autoComplete(params, max) {
		def fieldType = FieldType.valueOf(params.fieldType)
		def results = FixedValue.createCriteria().list {
			ilike('value', params.query + '%')
			and {
				eq('fieldType', fieldType)
				eq('isDeleted', 0L)
				eq('customer.id', springSecurityService.getCurrentUser().userCustomerCode)
			}
			maxResults(max)
		}
		if (results.size() < 5) {
			results = FixedValue.createCriteria().list {
				ilike('value', "%${params.query}%")
				and {
					eq('fieldType', fieldType)
					eq('isDeleted', 0L)
					eq('customer.id', springSecurityService.getCurrentUser().userCustomerCode)
				}
				maxResults(max)
			}
		}
		results = results.collect {
			def data = it
			def json
			JSON.use("deep") {
				def converter = data as JSON
				converter.prettyPrint = true
				json = converter.toString()
			}
			return [data: json, value: it.value]
		}.unique()
		return [suggestions: results] as JSON
	}

	/**
	 *{'domain':'com.ligontech.Jobs','query:'xy',searchField:['value','description'],parent:12,parentClass:'Demand'}* @param params
	 * @param max
	 * @return
	 */
	def autoCompleteAction(GrailsParameterMap params, max) {
		def domainClass = grailsApplication.getDomainClass(params.domain).clazz
		if (!AutoComplete.class.isAssignableFrom(domainClass)) {
			return [suggestions: [:]] as JSON
		}
		def results = autoComplete(domainClass, params, max)
		def domainList = results.results;
		domainList = domainList.collect {
			return [data: it.toJson(), value: it.toString()]
		}.unique()
		return [suggestions: domainList] as JSON
	}
//      public def search(domain,params,properties){
//            def customer=springSecurityService.principal.customer;
//            def query="(*"+params.query+"* AND customerCode:${customer.ltCode} AND isDeleted:${0L} AND deadline:[${new Date().format('yyyyMMdd')} TO *])"
//            def result = domain.search(query,params,defaultOperator: "or",properties: properties)
//            return result;
//      }
	public def autoComplete(domain, params, max) {
		def customer = springSecurityService.principal.customer;
		def fixedQuery = domain.fixedQuery(customer.ltCode);
		def searchQuery = domain.autoCompleteQuery(params.query, fixedQuery);
		def result = domain.search((searchQuery), max: max)
		return result;
	}

}
