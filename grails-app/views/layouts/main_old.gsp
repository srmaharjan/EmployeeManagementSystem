<%@ page import=" org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
    <meta name="description" content="">
    <meta name="author" content="">

    <meta name="viewport" content="initial-scale = 1.0">

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

    <r:require modules="scaffolding"/>
    <r:require modules="application"/>
    <r:require modules="bootbox"/>
    <r:require modules="iconpack"/>

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="${resource(dir: 'css', file: 'favicon.ico')}" type="image/x-icon">

    <g:layoutHead/>
    <r:layoutResources/>
</head>

<body>

<nav class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">

            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>

            <a class="brand" style="padding: 0 0 0 0 " href="${createLink(uri: '/')}">
                <img class="brand" style="height:40px;padding: 0 0 0 0;margin-left: 0px;" src="${resource(dir: 'images', file: 'ligontech_logo.jpg')}"/>
            </a>

            <div class="nav-collapse">
                <ul class="nav">
                %{--<sec:ifLoggedIn>--}%
                %{--<li <%= controllerName == "employee" ? ' class="active"' : '' %>><g:link controller="employee" action="index">Employee</g:link> </li>--}%
                %{--<li <%= controllerName == "payRoll" ? ' class="active"' : '' %>><g:link controller="payRoll" action="index">Payroll</g:link> </li>--}%
                %{--<li <%= controllerName == "payRollDetail" ? ' class="active"' : '' %>><g:link controller="payRollDetail" action="index">Payroll Details</g:link> </li>--}%
                %{--<li <%= controllerName == "salaryConfiguration" ? ' class="active"' : '' %>><g:link controller="salaryConfiguration" action="index">Settings</g:link> </li>--}%
                %{--<sec:ifAllGranted roles="ROLE_ADMIN">--}%
                %{--<li <%= controllerName == "dssUser" ? ' class="active"' : '' %>><g:link controller="dssUser" action="index">User</g:link> </li>--}%
                %{--</sec:ifAllGranted>--}%
                %{--</sec:ifLoggedIn>--}%
                    <g:if test="${!layout_nomainmenu}">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                                    <li<%= c.logicalPropertyName == controllerName ? ' class="active"' : '' %>><g:link controller="${c.logicalPropertyName}">${c.naturalName}</g:link></li>
                                </g:each>
                            </ul>
                        </li>
                    </g:if>
                %{--<li<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>><a href="${createLink(uri: '/')}">Home</a></li>--}%
                %{--<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">--}%
                %{--<li<%= c.logicalPropertyName == controllerName ? ' class="active"' : '' %>><g:link controller="${c.logicalPropertyName}">${c.naturalName}</g:link></li>--}%
                %{--</g:each>--}%
                </ul>
                <div id="login">
                    %{--<div><sec:ifLoggedIn>--}%
                    %{--<g:link controller="generalSettings" action="changePassword" class="welcomeuser" style="margin-right:5px;">--}%
                    <a href="#changePasswordModel"  class="welcomeuser" style="margin-right:10px;" role="button" data-toggle="modal" title="Change password">
                        <sec:username/>
                    </a>
                    %{--</g:link>--}%
                    <g:link controller="logout"><img src="<g:resource file='images/logout.png' />">
                        Log Out </g:link>
                %{--</sec:ifLoggedIn>--}%
                </div>
            </div>
        </div>
    </div>
</div>
</nav>

<div class="container-fluid">
    <g:layoutBody/>


    <footer>
    <hr>
        <p>&copy; </p>
    </footer>
</div>

<r:layoutResources/>

</body>
</html>