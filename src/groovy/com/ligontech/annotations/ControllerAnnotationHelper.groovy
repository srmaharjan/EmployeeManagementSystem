package com.ligontech.annotations

import com.ligontech.annotations.RequiresAjax
import com.ligontech.annotations.RequiresPost
import org.apache.commons.lang.WordUtils
import org.codehaus.groovy.grails.commons.ApplicationHolder as AH

/**
 * Created with IntelliJ IDEA.
 * User: srmaharjan
 * Date: 12/1/13
 * Time: 3:22 PM
 * To change this template use File | Settings | File Templates.
 */
class ControllerAnnotationHelper {

      private static Map<String, Map<String, List<Class>>> _actionMap = [:]
      private static Map<String, Class> _controllerAnnotationMap = [:]

      /**
       * Find controller annotation information. Called by BootStrap.init().
       */
      static void init() {

            AH.application.controllerClasses.each { controllerClass ->
                  def clazz = controllerClass.clazz
                  String controllerName = WordUtils.uncapitalize(controllerClass.name)
                  mapClassAnnotation clazz, RequiresAjax, controllerName
                  mapClassAnnotation clazz, RequiresPost, controllerName

                  Map<String, List<Class>> annotatedClosures = findAnnotatedClosures(
                        clazz, RequiresAjax, RequiresPost)
                  if (annotatedClosures) {
                        _actionMap[controllerName] = annotatedClosures
                  }
            }
      }

      // for testing
      static void reset() {
            _actionMap.clear()
            _controllerAnnotationMap.clear()
      }

      // for testing
      static Map<String, Map<String, List<Class>>> getActionMap() {
            return _actionMap
      }

      // for testing
      static Map<String, Class> getControllerAnnotationMap() {
            return _controllerAnnotationMap
      }

      private static void mapClassAnnotation(clazz, annotationClass, controllerName) {
            if (clazz.isAnnotationPresent(annotationClass)) {
                  def list = _controllerAnnotationMap[controllerName] ?: []
                  list << annotationClass
                  _controllerAnnotationMap[controllerName] = list
            }
      }

      /**
       * Check if the specified controller action requires Ajax.
       * @param controllerName  the controller name
       * @param actionName  the action name (closure name)
       */
      static boolean requiresAjax(String controllerName, String actionName) {
            return requiresAnnotation(RequiresAjax, controllerName, actionName)
      }

      /**
       * Check if the specified controller action requires POST.
       * @param controllerName  the controller name
       * @param actionName  the action name (closure name)
       */
      static boolean requiresPost(String controllerName, String actionName) {
            return requiresAnnotation(RequiresPost, controllerName, actionName)
      }

      private static boolean requiresAnnotation(Class annotationClass,
                                                String controllerName, String actionName) {

            // see if the controller has the annotation
            def annotations = _controllerAnnotationMap[controllerName]
            if (annotations && annotations.contains(annotationClass)) {
                  return true
            }

            // otherwise check the action
            Map<String, List<Class>> controllerClosureAnnotations =
                  _actionMap[controllerName] ?: [:]
            List<Class> annotationClasses = controllerClosureAnnotations[actionName]
            return annotationClasses && annotationClasses.contains(annotationClass)
      }

      private static Map<String, List<Class>> findAnnotatedClosures(
            Class clazz, Class... annotationClasses) {

            // since action closures are defined as "def foo = ..." they're
            // fields, but they end up private
            def map = [:]
            for (field in clazz.declaredFields) {
                  def fieldAnnotations = []
                  for (annotationClass in annotationClasses) {
                        if (field.isAnnotationPresent(annotationClass)) {
                              fieldAnnotations << annotationClass
                        }
                  }
                  if (fieldAnnotations) {
                        map[field.name] = fieldAnnotations
                  }
            }

            return map
      }
}