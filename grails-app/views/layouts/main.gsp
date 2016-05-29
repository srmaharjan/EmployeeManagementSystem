<%@ page import="com.ligontech.admin.ModuleDashBoard;  org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes" %>
<%
      List<ModuleDashBoard> allParent=[]
      ModuleDashBoard parentMenu;
      List<ModuleDashBoard> allSubMenu=[]
      ModuleDashBoard currentlySelectedMenu;
      if(controllerName!='login'){
            List<ModuleDashBoard> allMenu=ModuleDashBoard.list();
            allParent=allMenu.findAll {it.isParent}.sort{it.displayOrder}
            currentlySelectedMenu=allMenu.find{it.moduleController==controllerName && it.moduleAction==actionName};
          //  currentlySelectedMenu=ModuleDashBoard.findByModuleControllerAndModuleAction(controllerName,actionName);
            if(!currentlySelectedMenu){
                  currentlySelectedMenu=allMenu.find{it.moduleController==controllerName && it.moduleAction=='index'};
                 // currentlySelectedMenu=ModuleDashBoard.findByModuleControllerAndModuleAction(controllerName,'index');
            }
            if(!currentlySelectedMenu){
                  currentlySelectedMenu=allMenu.find{it.moduleController=='dashBoard' && it.moduleAction=='index'};
                  //currentlySelectedMenu=ModuleDashBoard.findByModuleControllerAndModuleAction('dashBoard','index');
            }
            parentMenu=currentlySelectedMenu.isParent?currentlySelectedMenu:currentlySelectedMenu.parent;
            allSubMenu=allMenu.findAll {it.parent==parentMenu};
      }
%>
<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
      <!-- Basic Page Needs
        ================================================== -->
      <meta charset="utf-8">
      <title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
      <meta name="description" content="Ligontech">
      <meta name="author" content="Ligontech">


      <!-- Favicons

            ================================================== -->
      <link rel="shortcut icon" href="images/favicon.ico" />
      <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
      <link rel="apple-touch-icon" sizes="72x72" href="images/apple-touch-icon-72x72.png">
      <link rel="apple-touch-icon" sizes="114x114" href="images/apple-touch-icon-114x114.png">

      <!-- CSS

        ================================================== -->

      <!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
      <r:require modules="application"/>

      <g:layoutHead/>
      <r:layoutResources/>
</head>

<body id="home" class="home">
<header id="header" class="clearfix">
      <div class="wrapper">
            <g:render template="/layouts/header" model="[allParent:allParent,parentMenu:parentMenu]"/>
      </div>
</header>
<section id="content" class="clearfix">
      <div class="wrapper">
            <sec:ifLoggedIn>
                  <g:render template="/layouts/sidemenu" model="[selectedMenu:currentlySelectedMenu,subMenu:allSubMenu]"/>
                  <div id="container">
                        <div class="entry">
                              <g:layoutBody/>
                        </div>
                  </div>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
                  <div id="container">
                        <div class="entry">
                              <g:layoutBody/>
                        </div>
                  </div>
            </sec:ifNotLoggedIn>
      </div>
</section>
<g:render template="/layouts/footer"/>


<!-- Enables advanced css selectors in IE, must be used with a JavaScript library -->

<!--[if lt IE 9]>
<script type="text/javascript" src="${resource(dir: 'js', file: 'selectivizr-min.js?v=1.0.1')}"/>
<![endif]-->

<!-- Prompt IE 6 users to install Chrome Frame -->

<!--[if lt IE 7 ]>
<script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
<script>window.attachEvent("onload",function(){CFInstall.check({mode:"overlay"})})</script>
<script> DD_belatedPNG.fix('img, .png-bg'); </script>
<![endif]-->
<r:layoutResources/>
</body>
</html>
