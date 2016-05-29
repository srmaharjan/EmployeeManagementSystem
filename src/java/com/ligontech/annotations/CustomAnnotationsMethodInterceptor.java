package com.ligontech.annotations;

import org.apache.shiro.authz.aop.AnnotationsAuthorizingMethodInterceptor;

/**
 * Created with IntelliJ IDEA.
 * User: srmaharjan
 * Date: 11/30/13
 * Time: 12:37 PM
 * To change this template use File | Settings | File Templates.
 */
public class CustomAnnotationsMethodInterceptor extends AnnotationsAuthorizingMethodInterceptor {

      /**
       * Default no-argument constructor that defaults the
       * {@link #methodInterceptors methodInterceptors} attribute to contain two interceptors by default - the
       * {@link org.apache.shiro.authz.aop.RoleAnnotationMethodInterceptor RoleAnnotationMethodInterceptor} and the
       * {@link org.apache.shiro.authz.aop.PermissionAnnotationMethodInterceptor PermissionAnnotationMethodInterceptor} to
       * support role and permission annotations.
       */
      public CustomAnnotationsMethodInterceptor() {
            methodInterceptors.add(new AuthAnnotationMethodInterceptor());
      }
}
