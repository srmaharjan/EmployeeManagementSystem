package com.ligontech.annotations;

import java.lang.annotation.*;

/**
 * Created with IntelliJ IDEA.
 * User: srmaharjan
 * Date: 12/1/13
 * Time: 3:20 PM
 * To change this template use File | Settings | File Templates.
 */
@Target({ElementType.FIELD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface RequiresPost {

      /**
       * Whether to display an error or be silent (default).
       * @return  <code>true</code> if an error should be shown
       */
      boolean error() default false;
}
