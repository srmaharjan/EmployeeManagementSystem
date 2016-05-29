package com.ligontech

import grails.converters.JSON

/**
 * Created with IntelliJ IDEA.
 * User: srmaharjan
 * Date: 11/17/13
 * Time: 1:18 PM
 * To change this template use File | Settings | File Templates.
 */
abstract class AutoComplete {
      public abstract def autoCompleteQuery(query, fixedQuery)
      public static def fixedQuery(customerCode){
            return "(customerCode:${customerCode} AND isDeleted:${0L})"
      }
      public String toJson(){
            def json='{}';
            JSON.use("deep") {
                  def converter = this as JSON
                  converter.prettyPrint = true
                  json = converter.toString()
            }
            return json;
      }
}
