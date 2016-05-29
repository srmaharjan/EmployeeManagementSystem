package com.ligontech.annotations;

import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.aop.AuthorizingAnnotationHandler;
import org.apache.shiro.subject.Subject;

import java.lang.annotation.Annotation;

/**
 * Created with IntelliJ IDEA.
 * User: srmaharjan
 * Date: 11/30/13
 * Time: 11:29 AM
 * To change this template use File | Settings | File Templates.
 */
public class AuthAnnotationHandler extends AuthorizingAnnotationHandler {

      public AuthAnnotationHandler() {
            super(RequiresAuth.class);
      }

      protected String getAnnotationPermission(Annotation a){
            RequiresAuth rpAnnotation = (RequiresAuth) a;
            return rpAnnotation.permission();
      }
      protected String getAnnotationRole(Annotation a) {
            RequiresAuth rpAnnotation = (RequiresAuth) a;
            return rpAnnotation.role();
      }

      public void assertAuthorized(Annotation a) throws AuthorizationException {
            if (!(a instanceof RequiresAuth)) return;

            RequiresAuth rpAnnotation = (RequiresAuth) a;
            String perm = getAnnotationPermission(a);
            String role = getAnnotationRole(a);
            Subject subject = getSubject();

            if(perm!=null && role==null){
                  subject.checkPermission(perm);
                  return;
            }
            if(perm==null && role!=null){
                  subject.checkRole(role);
                  return;
            }
            if (role!=null && perm!=null && Logical.AND.equals(rpAnnotation.logical())) {
                  subject.checkPermission(perm);
                  subject.checkRole(role);
                  return;
            }
            if (role!=null && perm!=null && Logical.OR.equals(rpAnnotation.logical())) {
                  boolean hasAtLeastOnePermission = subject.isPermitted(perm);
                  if(!hasAtLeastOnePermission)
                        hasAtLeastOnePermission=subject.hasRole(role);
                  if(!hasAtLeastOnePermission){
                        subject.checkPermission(perm);
                  }
                  return;
            }
      }

}
