import org.apache.shiro.authz.AuthorizationException
import org.springframework.security.access.AccessDeniedException

class UrlMappings {

    static mappings = {
        "/"(controller:"DashBoard",action:"index")
        "/$controller/$action?/$id?"{
            constraints {
                controller(matches:/^((?!(api|mobile|web)).*)$/)
            }
        }

        "403"	(view:'/_errors/403')
        "404"	(view:'/_errors/404')
        "405"	(view:'/_errors/404')
        "500"	(view:'/_errors/error')
        "503"	(view:'/_errors/503')
        "500"(view:'/_errors/error',
                exception: AccessDeniedException)
        "500"(view:'/_errors/error',
                exception: AuthorizationException)
    }
}
