<%@page import="com.deerwalk.DataTable; com.deerwalk.HelperService" %>
<%def frontEndService = grailsApplication.mainContext.frontEndService%>
<%def controllerMap = frontEndService.getAllControllers(session.client)%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
%{--<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9" />--}%
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><g:layoutTitle default="Makalu" /></title>
<link type="image/x-icon" href="<r:resource file="${session.clientFav?.getAt('favfile')}" dir="${session.clientFav?.getAt('path')}"/>" rel="shortcut icon"/>
<link rel="stylesheet" href='<r:resource file="custom.css" dir="${session.clientTheme}"/>'/>
<r:require module="mainLayout"/>
<r:layoutResources/>
<!--[if lt IE 9]>
	<link rel="stylesheet" type="text/css" href='/css/IeHack.css'>
<![endif]-->

%{--	<jqui:resources themeCss="${resource(dir:session.clientTheme,file:'custom.css')}"/>--}%
<script type="text/javascript">
      function poleSessionStatus(){
            jQuery.ajax({
                  type:'POST',
                  data:'',
                  url:'<g:createLink action="ajaxCheckSession" controller="dashBoard"/>',
                  success:function(data,textStatus){
                  },
                  error:function(XMLHttpRequest,textStatus,errorThrown){
                        $('#LoggedoutMessage').show();
                        logout();
                  },
                  complete:function(XMLHttpRequest,textStatus){
                        $.unblockUI();
                  }});
      }
      var change=false;
      $(document).ready(function() {
            var list = ['repPeriodFrm_month','repPeriodTo_month','repPeriodTo_year','repPeriodFrm_year','comPeriodFrm_month','comPeriodTo_month','comPeriodFrm_year','comPeriodTo_year','repPaidThrough_year','repPaidThrough_month','comPaidThrough_year','comPaidThrough_month'];
            $.each(list, function(index, value) {
                  $('#'+value).live('change', function(e) {
                        changeValue('#'+value);
                  });
            });

            $(".themeButton").button();
            if($.blockUI){
                  $.blockUI.defaults = {
                        message:  '<h1>Please wait...</h1>',
                        baseZ: 5000,
                        fadeIn:  300,
                        fadeOut:  600,
                        showOverlay: true,
                        overlayCSS:  {
                              backgroundColor: '#000',
                              opacity:         0.6
                        },
                        css: {
                              padding: '5px',
                              margin:         0,
                              width:          '30%',
                              top:            '40%',
                              left:           '35%',
                              textAlign:      'center',
                              color: '#fff',
                              border: 'none',
                              backgroundColor: '#000',
                              opacity: .5,
                              cursor:         'wait',
                              height:'50px'
                        }
                  }
            }
            $( "#dynamic_Report" ).dialog({
                  autoOpen: false,
                  show: "fade",
                  hide: "fade",
                  modal: true,
                  resizable: false,
                  draggable: true,
                  zIndex: 1000,
                  width:510,
                  title:"<span style='font-size:13px;'>Care Analytics</span><span class='popupID'>CA102</span>"//
            });


            alertNotify();
            checkReportsForm();
            $(document).ajaxStart(setLatestPoleTime);
            resetLoggedOutFLag();
            setLatestPoleTime();
            setCheckSessionTimer();
            toggleExtraNavTabs();
            $(window).resize(function() {
                  toggleExtraNavTabs()
            });

      });

      function ajaxFailed(){
            window.location = "<g:createLink action='index' controller='dashBoard'/>";
            notify('Error','Could not complete your request. Please Try again.','error');
      }

      function checkReportsForm(){
            if(${controllerMap.moduleController.contains('dynamicReport')}){
                  updateDynamicReportForm();
            }
      }

      function updateDynamicReportForm(){
            if($("#dynamic_Report_sidemenu").length==0){ //don't make another popup when in dynamic report module
                  jQuery.ajax({
                        type:'POST',
                        url:'<g:createLink controller="dashBoard" action="ajaxUpdateDynamicReportForm"/>',
                        success:function(data,textStatus){
                              $('#dynamicPopUp_screen').html(data);
                              $( "#dynamic_Report" ).dialog({ position: "center" });
                        },
                        error:function(XMLHttpRequest,textStatus,errorThrown){
                        },
                        complete:function(XMLHttpRequest,textStatus){
                              $('.themeButton').button();
                        }});
            }
      }

      function updateLoaForm(eventSource,uniqueKey,preventDateUpdate){
            uniqueKey = uniqueKey ? uniqueKey: "" ;
            var activeLevelId = $(eventSource).attr("id");
            var activeValue = $(eventSource).val();
            if(activeValue=="" && $(eventSource).length>0){
                  var activeLevel = 0;
                  if($(eventSource).data('level')){
                        activeLevel = $(eventSource).data('level');
                  }
                  var childLevel = activeLevel + 1;
                  var childEle = $('#'+uniqueKey+'level'+childLevel+'Value');
                  childEle.val('');
            }
            var level1Value = $('#'+uniqueKey+'level1Value').val();
            var level2Value = $('#'+uniqueKey+'level2Value').val();
            var level3Value = $('#'+uniqueKey+'level3Value').val();
            var level4Value = $('#'+uniqueKey+'level4Value').val();
            var level5Value = $('#'+uniqueKey+'level5Value').val();
            var level6Value = $('#'+uniqueKey+'level6Value').val();

            $('#loadingIndicator').show();
            $.blockUI();
            jQuery.ajax({
                  type:'post',data:{isAjax:'true','level1Value':level1Value,'level2Value':level2Value,'level3Value':level3Value,'level4Value':level4Value,'level5Value':level5Value,'level6Value':level6Value, 'uniqueKey':uniqueKey},
                  url:'<g:createLink action="loaForm" controller="dashBoard" />',
                  success:function(data,textStatus){
                        var newElements =  $(data);
                        var elementId = "";
                        for(var i=1;i<=6;i++){
                              elementId = uniqueKey+"level"+i+"Value";
                              if(elementId!=activeLevelId || activeValue == ""){
                                    var newEle = newElements.find("#"+elementId);
                                    $("#"+elementId).replaceWith(newEle);
                              }
                        }
                        if(!preventDateUpdate){
                              var rdates = newElements.find("#reportingDatesSelector");
                              var cdates = newElements.find("#comparisonDatesSelector");
                              if(rdates.length>0){
                                    $("#reportingDatesSelector").html(rdates.html());
                              }

                              if(cdates.length>0){
                                    $("#comparisonDatesSelector").html(cdates.html());
                              }
                        }

                        //  $("#loaHolder").html(XMLHttpRequest.responseText);
                        $('#loadingIndicator').hide();
                        $.unblockUI();
                  },
                  error:function(XMLHttpRequest,textStatus,errorThrown){$.unblockUI();},
                  complete:function(XMLHttpRequest,textStatus){
                        $.unblockUI();
                  }});
            return false;
      }

      function resetBusinessLevels(uniqueKey){
            uniqueKey = uniqueKey ? uniqueKey: "" ;
            $('#'+uniqueKey+'level1Value').val('');
            $('#'+uniqueKey+'level2Value').val('');
            $('#'+uniqueKey+'level3Value').val('');
            $('#'+uniqueKey+'level4Value').val('');
            $('#'+uniqueKey+'level5Value').val('');
            $('#'+uniqueKey+'level6Value').val('');
            updateLoaForm(null,uniqueKey);
      }

      //TODO use js variables instead of inline groovy
      function checkValidation(){
            var message='Reporting/Comparison date is outside of cycle period (${session.group?.cycleStartDate?.format('MMMM yyyy')} to ${session.group?.cycleEndDate.format('MMMM yyyy')}).';
            var validation = true;
            var repToMonth =  parseInt($('#repPeriodTo_month').val());
            var repToYear = parseInt($('#repPeriodTo_year').val());
            var repFromMonth = parseInt($('#repPeriodFrm_month').val());
            var repFromYear = parseInt($('#repPeriodFrm_year').val());
            var comToMonth = parseInt($('#comPeriodTo_month').val());
            var comToYear = parseInt($('#comPeriodTo_year').val());
            var comFromMonth = parseInt($('#comPeriodFrm_month').val());
            var comFromYear = parseInt($('#comPeriodFrm_year').val());

            if((repToYear==${session.group?.cycleEndDate?.format('yyyy')} && repToMonth>${session.group?.cycleEndDate?.format('MM')}) || (repToYear==${session.group?.cycleStartDate?.format('yyyy')} && repToMonth<${session.group?.cycleStartDate?.format('MM')})){
                  validation = false;
            }
            if((repFromYear==${session.group?.cycleEndDate?.format('yyyy')} && repFromMonth>${session.group?.cycleEndDate?.format('MM')}) || (repFromYear==${session.group?.cycleStartDate?.format('yyyy')} && repFromMonth<${session.group?.cycleStartDate?.format('MM')})){
                  validation = false;
            }
            if((comToYear==${session.group?.cycleEndDate?.format('yyyy')} && comToMonth>${session.group?.cycleEndDate?.format('MM')}) || (comToYear==${session.group?.cycleStartDate?.format('yyyy')} && comToMonth<${session.group?.cycleStartDate?.format('MM')})){
                  validation = false;
            }
            if((comFromYear==${session.group?.cycleEndDate?.format('yyyy')} && comFromMonth>${session.group?.cycleEndDate?.format('MM')}) || (comFromYear==${session.group?.cycleStartDate?.format('yyyy')} && comFromMonth<${session.group?.cycleStartDate?.format('MM')})){
                  validation = false;
            }
            if((repFromYear>repToYear) || (repFromYear==repToYear && repFromMonth>repToMonth)){
                  validation = false;
                  message='Reporting end date cannot be smaller than reporting start date.';
            }
            if((comFromYear>comToYear) || (comFromYear==comToYear && comFromMonth>comToMonth)){
                  validation = false;
                  message='Comparison end date cannot be smaller than comparison start date.';
            }
            if(!validation){
                  alert(message);
                  //$("#dynamicErrorMessage").html(message);
                  //$('#dynamicPopupMessage').show();
            }
            return validation;
      }


      function changeFromTo(){
            if(change){
                  change=false;
                  $('.lockunLinkd').show();
                  $('.lockLinkd').hide();
            }else{
                  change=true;
                  $('.lockunLinkd').hide();
                  $('.lockLinkd').show();
            }
      }

      function changeValue(id){
            var value;
            var monthMap = {'#repPeriodFrm_month':'#comPeriodFrm_month','#repPeriodTo_month':'#comPeriodTo_month','#comPeriodFrm_month':'#repPeriodFrm_month','#comPeriodTo_month':'#repPeriodTo_month','#repPaidThrough_month':'#comPaidThrough_month','#comPaidThrough_month':'#repPaidThrough_month'};
            var yearMap = {'#repPeriodFrm_year':'#comPeriodFrm_year','#repPeriodTo_year':'#comPeriodTo_year','#comPeriodTo_year':'#repPeriodTo_year','#comPeriodFrm_year':'#repPeriodFrm_year','#repPaidThrough_year':'#comPaidThrough_year','#comPaidThrough_year':'#repPaidThrough_year'};
            if(change){
                  var newKey;
                  var monthKeys = $.map( monthMap, function( value, key ) {
                        return key;
                  });
                  var keyIndex = jQuery.inArray(id,monthKeys);
                  if(keyIndex!=-1){
                        value=$(id).val();
                        newKey = monthMap[id];
                        $(newKey).val(value);
                  }

                  if(id=='#repPeriodFrm_year' || id=='#repPeriodTo_year' || id=='#repPaidThrough_year'){
                        value=$(id).val()-0;
                        newKey = yearMap[id];
                        $(newKey).val(value-1);
                  }

                  if(id=='#comPeriodFrm_year' || id=='#comPeriodTo_year' || id=='#comPaidThrough_year'){
                        value=$(id).val()-0;
                        newKey = yearMap[id];
                        if(value==${session.client?.cycleEndDate?.format('yyyy')}){
                              $(newKey).val(value);
                        }else{
                              $(newKey).val(value+1);
                        }
                  }
            }
      }

      function applyProgramType(className){
            $('.dynamicReportProgramType').remove();
            var program=0;
            var programType=0;
            $("."+className).each(function(index) {
                  if(this.checked){
                        $('#dynamicPopUp_screen').append('<input name="'+$(this).attr('name')+'" class="dynamicReportProgramType" type="hidden" value="'+$(this).attr('id')+'">');
                        if($(this).attr('name')=='programType'){programType++}
                        if($(this).attr('name')=='program'){program++}
                  }
            });
            if(program==0 && programType==0){
                  $('#link_programType').html('Select');
            }else{
                  $('#link_programType').html(programType+' program type and '+program+' program selected');
            }
            $('#programType_div').dialog('close');
      }

      function selectParent(className,selected){
            if(selected){
                  $('.class_'+className).attr('checked','checked');
            }
      }

      function resetProgramTypePopUp(){
            $('#programType_div').remove();
            /*$(".programTypeMultiSelect").each(function(){
             $(this).removeAttr('checked')
             });*/
      }
</script>
%{--	<script type="text/javascript">
			var pkBaseURL = (("https:" == document.location.protocol) ? "https://piwik.deerwalk.com/" : "http://piwik.deerwalk.com/");
			document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
		</script><script type="text/javascript">
		try {
			var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 3);
			piwikTracker.trackPageView();
			piwikTracker.enableLinkTracking();
		} catch( err ) {}
	</script><noscript><p><img src="http://piwik.deerwalk.com/piwik.php?idsite=3" style="border:0" alt="" /></p></noscript>--}%
<g:layoutHead />
</head>
<body>
<div id="header">
      <div class="banner">
            <g:if test="${session.client?.logoFileName}">
                  <div class="logo coBackground">
                        <g:link controller="dashBoard" action="index" class="logo_link"><r:img uri="/${session.clientLogo?.getAt('path')}/${session.clientLogo?.getAt('logoName')}" width="145px" height="45px"/></g:link>
                  </div>
            </g:if><g:else>
            <div class="logo">
                  <g:link controller="dashBoard" action="index" class="logo_link"><r:img uri="/${session.clientLogo?.getAt('path')}/${session.clientLogo?.getAt('logoName')}"/></g:link>
            </div>
            </g:else>

            <ul class="menu" id="menu">

                  <%def controllers = ['dashBoard','dynamicReport','qualityOfCare','dataSearch','memberSearch','riskAnalysis']%>

                  <g:each in="${controllerMap}" var="control">
                        <%def checkOtherController=control.otherController
                        def finalOtherControllerList=[]
                        if(checkOtherController!=null){
                              finalOtherControllerList=checkOtherController.split(':')
                        }
                        def status = false
                        finalOtherControllerList.each{
                              if(params.controller == it){
                                    status=true
                              }
                        }
                        %>
                        <g:if test="${params.controller==control.moduleController || status}">
                              <li class="cur-tab navTab" id="${control.moduleController}">
                                    <span>
                                          <r:img uri="/images/${control.imagePath}"/>
                                    </span>
                                    <g:if test="${control.customModule}">
                                          <a class="menulink pop plan tooltipP cur" onclick='${control.moduleAction}'>${control.displayName}</a>
                                    </g:if>
                                    <g:else>
                                          <g:link action="${control.moduleAction}" controller="${control.moduleController}" class="menulink cur">${control.displayName}</g:link>
                                    </g:else>
                              </li>
                        </g:if>
                        <g:else>

                                    <g:if test="${control.customModule}">
                                        <li class="navTab" id="${control.moduleController}">
                                        <span>
                                            <r:img uri="/images/${control.imagePath}"/>
                                        </span>
                                        <a class="menulink pop plan tooltipP" onclick='${control.moduleAction}'>${control.displayName}</a>
                                        </li>
                                    </g:if>
                                    <g:else>
                                        <g:if test="${control.moduleController=='targetPatient' || control.moduleController=='targetPatientSearch'}">
                                            <sec:access url="/targetPatient/**">
                                                <li class="navTab" id="${control.moduleController}">
                                                <span>
                                                    <r:img uri="/images/${control.imagePath}"/>
                                                </span><g:link action="${control.moduleAction}" controller="${control.moduleController}" class="menulink">  ${control.displayName}</g:link>
                                                </li>
                                            </sec:access>
                                        </g:if>
                                        <g:else>
                                            <li class="navTab" id="${control.moduleController}">
                                            <span>
                                                <r:img uri="/images/${control.imagePath}"/>
                                            </span>
                                            <g:link action="${control.moduleAction}" controller="${control.moduleController}" class="menulink"> ${control.displayName}</g:link>
                                            </li>
                                        </g:else>

                                    </g:else>

                        </g:else>
                  </g:each>

                  <g:if test="${!controllers.contains(params.controller)}">
                        <g:if test="${session.customReport}">
                              <li class="navTab cur-tab" id="NavCustRep"><span><r:img uri="/images/navi_image/new/customreport.png"/></span><g:link controller="${session.customReport}" action="index" class="pop menulink customR tooltip cur">Custom Reports</g:link></li>
                        </g:if>
                  </g:if>
                  <g:else>
                        <g:if test="${session.customReport}">
                              <li class="navTab" id="NavCustRep"><span><r:img uri="/images/navi_image/new/customreport.png"/></span><g:link controller="${session.customReport}" action="index" class="pop menulink customR tooltip ">Custom Reports</g:link></li>
                        </g:if>
                  </g:else>

                <li style="display: none;" class="navMenu">
                    <a id="moreMainMenuItemLink" onclick="$('.navMenuDropdown').toggle();" >More<span class=bgDropDown></span></a>
                    <ul class="navMenuDropdown" style="display: none;">
                        <g:each in="${controllerMap}" var="control">
                            <li class="navMenuItem" id="menu${control.moduleController}" style="display: none;">
                                <g:if test="${control.customModule}">
                                    <a onclick='${control.moduleAction}'>more${control.displayName}</a>
                                </g:if><g:else>

                            <g:if test="${control.moduleController=='targetPatient' || control.moduleController=='targetPatientSearch'}">
                                <sec:access url="/targetPatient/**">
                                    <g:link controller="${control.moduleController}" action="${control.moduleAction}">${control.displayName}</g:link>
                                </sec:access>
                            </g:if>
                            <g:else>
                                   <g:link controller="${control.moduleController}" action="${control.moduleAction}">${control.displayName}</g:link>
                            </g:else>

                            </g:else>
                            </li>
                        </g:each>
                    %{--<li class="navMenuItem" id="menuNavMemSearch" style="display: none;"><g:link controller="memberSearch" action="index">Member Search</g:link></li>
             <li class="navMenuItem" id="menuNavRiskAna" style="display: none;"><g:link controller="riskAnalysis" action="index">Risk Analysis</g:link></li>--}%
                        <g:if test="${session.customReport}">
                            <li class="navMenuItem" id="menuNavCustRep" style="display: none;"><g:link controller="${session.customReport}" action="index">Custom Reports</g:link></li>
                        </g:if>
                    </ul>
                </li>
            </ul>
            <sec:ifLoggedIn>
                  <div id="login">
                        <ul>
                              <li class="welcomeuser"><g:link controller="preference" action="index">${session.user?.firstname} ${session.user?.middlename} ${session.user?.lastname}</g:link></li>
                              <li class="logoff"><g:link controller="logout" action="index" onclick="logout();">Logout</g:link></li>
                        </ul>
                  </div>
            </sec:ifLoggedIn>
      </div>
</div>
<div style="height: 55px;"></div>
<div id="mainWrapper">
      <g:layoutBody />
</div>

<table cellpadding="0" cellspacing="0" width="100%" id="footer" style="display: none;">
      <tr>
            <td class="footer"><div class="wrapperDashboard">
                  <div class="foot">
                        <div class=footNav>
                              |
                              <g:each in="${controllerMap}" var="control">
                                    <g:if test="${control.customModule}">
                                          <a href="javascript:void(0);" onclick='${control.moduleAction}'>${control.displayName}</a>
                                        |
                                    </g:if>
                                    <g:else>
                                        <g:if test="${control.moduleController=='targetPatient' || control.moduleController=='targetPatientSearch'}">
                                            <sec:access url="/targetPatient/**">

                                                    <g:link action="${control.moduleAction}" controller="${control.moduleController}" class="menulink">  ${control.displayName}</g:link>
                                                |
                                            </sec:access>
                                        </g:if>
                                        <g:else>

                                                <g:link action="${control.moduleAction}" controller="${control.moduleController}" class="menulink"> ${control.displayName}</g:link>
                                            |
                                        </g:else>

                                    </g:else>

                              </g:each>
                              <g:if test="${session.customReport}">
                                    <g:link controller="${session.customReport}" action="index">Custom Reports</g:link> |
                              </g:if>
                        </div>

                        <div>
                              <g:if test="${session.client.copyRightMessage && session.client.copyRightMessage!=''}">
                                    <span>${session.client.copyRightMessage?.replaceAll(':CURRENT-YEAR:',(new Date().format('yyyy')).toString())}</span><br/>
                              </g:if><g:else>
                              <span>Copyright &copy; ${new Date().format('yyyy')} Deerwalk Inc - Makalu Ver. 2.0.0</span><br/>
                        </g:else></div>
                        <span id="cptFooter"></span>
                  </div>

                <g:if test="${session.client.showQAVerified==true}">
                    <div style="position: absolute;top: 0;right: 0;"><g:link controller="dashBoard" action="info"><r:img uri="/images/Qa_Verified_logo.png" width="60" /> </g:link> </div>
                </g:if>
            </div></td>
      </tr>
</table>
<div style="display:none;">
      <div id="dynamic_Report" class="data_search popup" style="margin:0;">
            <g:form id="dynamicReportForm" controller="dynamicReport" action="index" method="post" name="popupForm" onSubmit="return checkValidation();">
                  <div class="message" id="dynamicPopupMessage" style="display:none;">
                        <ul class="mesg" style="width:480px;margin:5px 0 0 10px;">
                              <li class="ui-state-error"><span id="dynamicErrorMessage"></span><a class="message_but" onclick=" $('#dynamicPopupMessage').hide();">Hide</a></li>
                        </ul>
                  </div>
                  <div id="dynamicPopUp_screen">
                  </div>
                  <input id="caTransitThroughIndexAction" type="hidden" name="redirectAction" value="">
                  <input id="caTransitThroughIndexController" type="hidden" name="redirectControl" value="">
            </g:form>
      </div>
</div>

<div style="display:none;">
      <g:each in="${controllerMap}" var="mod">
            <g:if test="${mod.customModule && mod.popupTemplate && mod.popupTemplate!=''}" >
                  <g:render template="${mod.popupTemplate}"/>
            </g:if>
      </g:each>
</div>


<div id="LoggedoutMessage" class="logout-popup" style="display: none;">
      <div id="login_box" class="logout-popup-innerwrap">
            <div id="login_title">
                  <h1>You have been logged out.</h1>
            </div>
            <div id="reLogin">
                  <p>Please login to continue.</p>
                  <g:link controller="dashBoard" class="login-popupbtn" action="index" target="_blank" onclick="logout();">Login</g:link>
            </div>
      </div>
</div>
<g:render template="/sharedTemplates/cohort/cohortCollection" model="[dataTable:DataTable.MemberSearch]"/>
<r:layoutResources/>
</body>
</html>