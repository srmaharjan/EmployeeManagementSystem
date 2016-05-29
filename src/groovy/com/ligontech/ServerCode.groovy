package com.ligontech

/**
 * Created with IntelliJ IDEA.
 * User: srmaharjan
 * Date: 12/29/13
 * Time: 2:17 PM
 * To change this template use File | Settings | File Templates.
 */
class ServerCode {
      public static final int SUCCESS=200;
      public static final int ERROR=500;
      public static final int NOT_FOUND=404;

      public static String getMessage(int code){
            switch (code){
                  case SUCCESS:
                        return 'Success';
                        break;
                  case ERROR:
                        return 'Internal Server Error';
                        break;
                  case NOT_FOUND:
                        return 'Not Found';
                        break;
            }
      }
}
