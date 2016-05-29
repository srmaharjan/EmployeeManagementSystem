<aside id="sidebar">
      <div class="side-menu gradient1" id="list1b">
            <div class="sa-sel sa-1">
                  <h3><a>There is one advantage:</a></h3>
                  <ul class="side-sub-menu">
                        <li><a href="#">Schedule</a></li>
                        <li><a href="#">Kick Off</a></li>
                        <li><a href="#">Teleconferences</a></li>
                        <li><a href="#">Face To Face</a></li>
                        <li><a href="#">Annual</a></li>
                        <li><a href="#">Workshops and Symposia</a></li>
                  </ul>
            </div>
            <g:set var="selected_index" value="${-1}"/>
            <g:each var="sub_menu" in="${subMenu.findAll{it.subParent==null}}" status="i">
                  <ltSec:hasPermission roles="SUPERMAN" permission="${sub_menu.permission}">
                        <g:set var="selected_index" value="${(selectedMenu?.subParent==sub_menu || selectedMenu==sub_menu)?i+2:selected_index}"/>
                        <div class="sa-sel sa-${i+2}">
                              %{--<h3><a >${sub_menu.displayName}</a></h3>--}%
                              <h3><g:link controller="${sub_menu.moduleController}" action="${sub_menu.moduleAction}">${sub_menu.displayName}</g:link></h3>
                              <ul class="side-sub-menu">
                                    <g:each var="sub_sub_menu" in="${subMenu.findAll{it.subParent==sub_menu}}">
                                          <g:set var="selected_index" value="${(selectedMenu==sub_sub_menu)?i+2:selected_index}"/>
                                          <li><g:link controller="${sub_sub_menu.moduleController}" action="${sub_sub_menu.moduleAction}">${sub_sub_menu.displayName}</g:link></li>
                                    </g:each>
                              </ul>
                        </div>
                  </ltSec:hasPermission>
            </g:each>
      %{--<div class="sa-sel sa-1">--}%
      %{--<h3><a>There is one advantage:</a></h3>--}%
      %{--<ul class="side-sub-menu">--}%
      %{--<li><a href="#">Schedule</a></li>--}%
      %{--<li><a href="#">Kick Off</a></li>--}%
      %{--<li><a href="#">Teleconferences</a></li>--}%
      %{--<li><a href="#">Face To Face</a></li>--}%
      %{--<li><a href="#">Annual</a></li>--}%
      %{--<li><a href="#">Workshops and Symposia</a></li>--}%
      %{--</ul>--}%
      %{--</div>--}%
      %{--<div class="sa-sel sa-2">--}%
      %{--<h3><a>There is one advantage:</a></h3>--}%
      %{--<div>--}%
      %{--<p>--}%
      %{--You've seen it coming!<br/>--}%
      %{--Buy now and get nothing for free!<br/>--}%
      %{--Well, at least no free beer. Perhaps a bear,<br/>--}%
      %{--if you can afford it.--}%
      %{--</p>--}%
      %{--</div>--}%
      %{--</div>--}%
      %{--<div class="sa-sel sa-3">--}%
      %{--<h3><a>There is one  advantage:</a></h3>--}%
      %{--<div>--}%
      %{--<p>--}%
      %{--You've seen it coming!<br/>--}%
      %{--Buy now and get nothing for free!<br/>--}%
      %{--Well, at least no free beer. Perhaps a bear,<br/>--}%
      %{--if you can afford it.--}%
      %{--</p>--}%
      %{--</div>--}%
      %{--</div>--}%
      </div>
</aside>
<script type="text/javascript">
      $(document).ready(function(){
            <g:if test="${selected_index!=-1}">
            $('#list1b').accordion("activate", ${selected_index-1});
            </g:if>
      });
      $("#list1b").on('click','h3',function(){
            $(this).find('a').trigger('click');
      })
</script>
