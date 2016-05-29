<div class="logo alignleft">
      <sec:ifLoggedIn>
            <a href="index.html">
                  <img src="${resource(dir: 'upload/logo', file: 'logo.png')}" alt="Ligontech" title="Ligontech" />
            </a>
      </sec:ifLoggedIn>
      <sec:ifNotLoggedIn>
            <img src="${resource(dir: 'upload/logo', file: 'logo.png')}" alt="Ligontech" title="Ligontech" />
      </sec:ifNotLoggedIn>
</div>
<sec:ifLoggedIn>
      <div class="log-info alignright">
            <span>Welcome! <strong><sec:loggedInUserInfo field="username"/></strong> </span>
            <g:link controller="logout">%{--<img src="<g:resource file='images/logout.png' />">--}%
                  Logout </g:link>
      </div>
      <nav id="primary-menu" class="clearfix">
            <ul class="main-nav">
                  <g:each var="item" in="${allParent}">
                        <ltSec:hasPermission permission="${item.permission}" roles="SUPERMAN">
                              <li class="${parentMenu==item?'current-menu-item':''}"><g:link controller="${item.moduleController}" action="${item.moduleAction}">${item.displayName}</g:link></li>
                        </ltSec:hasPermission>
                  </g:each>
            </ul>
      </nav>
</sec:ifLoggedIn>
%{--<nav id="primary-menu" class="clearfix">--}%
%{--<ul class="main-nav">--}%
%{--<li class="current-menu-item"><a href="index.html">Home</a></li>--}%
%{--<li><a href="#">Item One</a></li>--}%
%{--<li><a href="#">Item Two</a></li>--}%
%{--<li><a href="#">Item Three</a></li>--}%
%{--<li><a href="#">Item Four</a></li>--}%
%{--<li><a href="#">Item Five</a></li>--}%
%{--</ul>--}%
%{--</nav>--}%