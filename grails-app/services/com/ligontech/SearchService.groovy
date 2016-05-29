package com.ligontech

class SearchService {
	static String WILDCARD='*'
	def springSecurityService
	def compass
	public def search(domain,params,properties){
		def customer=springSecurityService.principal.customer;
		println "{customer.ltCode} = ${customer.ltCode}"
		def query="("+WILDCARD+params.query+WILDCARD+" AND customerCode:${customer.ltCode} AND isDeleted:${0L})"
//            if(customer.ltCode=='LT'){
//                  query="("+WILDCARD+params.query+WILDCARD+" AND isDeleted:${0L})"
//            }
		def result = domain.search(query,params,defaultOperator: "or",properties: properties)
		return result;
	}

	public def searchDemand(params){
		def customer=springSecurityService.principal.customer;
		// CompassSession session=compass.openSession();
		// CompassQueryBuilder queryBuilder =session.queryBuilder();
		def  query=""
		if(params.query){
			query="("+WILDCARD+params.query+WILDCARD+")";
		}
		def result=Demand.search {
			if(query)
				must(queryString(query))
			must(term("isDeleted",0L))
			if(customer.ltCode!='LT'){
				must(term("customerCode",customer.ltCode))
			}
			if(params['query_deadline'] && params['query_deadline-to']){
				must(between('deadline',params['query_deadline'],params['query_deadline-to'],true))
			}
			if(params['query_company']){
				must(term("companyId",params.query_company))
			}
			if(params['query_agent']){
				must(term("\$/Demand/agent/id",params.query_agent))
			}
			if(params['query_demandType']){
				println "{params['query_demandType']} = ${params['query_demandType']}"
				must(term("fixedValueId",params.query_demandType))
			}
		}
		return result;
//            def finalQueryString=queryBuilder.bool().addMust(queryBuilder.term("isDeleted", 0L))
//
//            if(customer.ltCode!='LT'){
//                  finalQueryString=finalQueryString.addMust(queryBuilder.term("customerCode", "${customer.ltCode}"))
//            }
//            if(params['deadline'] && params['deadline-to']){
//                  finalQueryString=finalQueryString.addMust(queryBuilder.between('deadline',params['deadline'].format('yyyyMMdd'),params['deadline-to'].format('yyyyMMdd')))
//            }
//            if(params['company']){
//                  finalQueryString=finalQueryString.addMust(queryBuilder.term("company.id",params.company))
//            }
//            if(params['agent']){
//                  finalQueryString=finalQueryString.addMust(queryBuilder.term("agent.id",params.agent))
//            }
//            if(params['demandType']){
//                  finalQueryString=finalQueryString.addMust(queryBuilder.term("demandType.id",params.demandType))
//            }
//            finalQueryString=finalQueryString.toQuery().hits();
//            println "finalQueryString = ${finalQueryString.toString()}"
//            def result = Demand.search(finalQueryString,params,defaultOperator: "or",properties: properties)
		// def result = Demand.search(query,params,defaultOperator: "or",properties: properties)

	}
	public def searchJobs(params){
		def customer=springSecurityService.principal.customer;
		def query="("+WILDCARD+params.query+WILDCARD+" AND customerCode:${customer.ltCode} AND isDeleted:${0L})"
		if(customer.ltCode=='LT'){
			query="("+WILDCARD+params.query+WILDCARD+" AND isDeleted:${0L})"
		}
		def result=Jobs.search {
			must(queryString(query))
			if(params['query_jobCategory']){
				must(term('jobCategoryId',params['query_jobCategory']))
			}
		}
		return result;
	}
	public def searchJobseeker(params){
		def customer=springSecurityService.principal.customer;

		def query="("+WILDCARD+params.query+WILDCARD+" AND customerCode:${customer.ltCode} AND isDeleted:${0L})"
		if(customer.ltCode=='LT'){
			query="("+WILDCARD+params.query+WILDCARD+" AND isDeleted:${0L})"
		}

		def result=Jobseeker.search {
			must(queryString(query))
			if(params['query_dob'] && params['query_dob-to']){
				must(between('dateOfBirth',params['query_dob'],params['query_dob-to'],true))
			}
			if(params['query_gender']){
				must(term("fixedValueId",params.query_gender))
			}
		}
		return result;
	}
	def searchApplicationProcess(params){
		def customer=springSecurityService.principal.customer;
		// CompassSession session=compass.openSession();
		// CompassQueryBuilder queryBuilder =session.queryBuilder();
		def  query=""
		if(params.query){
			query="("+WILDCARD+params.query+WILDCARD+")";
		}
		def result=Demand.search {
			if(query)
				must(queryString(query))
			must(term("isDeleted",0L))
			if(customer.ltCode!='LT'){
				must(term("customerCode",customer.ltCode))
			}
			if(params['date'] && params['date-to']){
				must(between('deadline',params['query_deadline'],params['query_deadline-to'],true))
			}
			if(params['process.id']){
				must(term("companyId",params['process.id']))
			}
			if(params['agent.id']){
				must(term("\$/Demand/agent/id",params['agent.id']))
			}
			if(params['demand.id']){
				must(term("fixedValueId",params['demand.id']))
			}
		}
		return result;
	}
	public def search(domain,params){
		def customer=springSecurityService.principal.customer;
		def query="("+WILDCARD+params.query+WILDCARD+" AND customerCode:$customer.ltCode AND isDeleted:${0L})"
		if(customer.ltCode=='LT'){
			query="("+WILDCARD+params.query+WILDCARD+")"
		}
		def result = domain.search(query,params,defaultOperator: "or")
		return result;
	}
}
