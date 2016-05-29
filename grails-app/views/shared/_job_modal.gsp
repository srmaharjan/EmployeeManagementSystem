<%@ page import="com.ligontech.FixedValue; com.ligontech.FieldType; com.ligontech.Jobs" %>
<div class="modal hide fade" id="jobs_modal" style=" width: 90%; /* desired relative width */
left: 5%; /* (100%-width)/2 */
/* place center */
margin-left:auto;
margin-right:auto; " xmlns="http://www.w3.org/1999/html">
<div class="modal-header" style="padding: 0px 15px;">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4>Job</h4>
</div>
<div class="modal-body">
    <div id="jobs_form_container" class="hide">
        <g:hiddenField name="jobs[{i}].id" id="jobs[{i}].id"/>
        <div class="row-fluid">
            <div class="span6">
                <div class="control-group fieldcontain required">
                    <div class="controls">
                        <label for="designation" >
                            <g:message code="jobs.designation.label" default="Designation" />
                            <span class="required-indicator">*</span>
                        </label>
                        <g:textField name="jobs[{i}].designation" id="jobs[{i}].designation" required="" value=""/>
                        <span class="help-inline"></span>
                    </div>
                </div>

                <div class="control-group fieldcontain  required">
                    <div class="controls">
                        <label for="jobCategory" >
                            <g:message code="jobs.jobCategory.label" default="Job Category" />
                            <span class="required-indicator">*</span>
                        </label>

                        <g:select id="jobs[{i}].jobCategory" name="jobs[{i}].jobCategory.id" from="${com.ligontech.JobCategory.listAll.list()}" optionKey="id" value="" class="many-to-one" noSelection="['': '--Select--']"/>
                        <span class="help-inline"></span>
                    </div>
                </div>
                <div class="control-group fieldcontain required">
                    <div class="controls">
                        <label for="numberOfPosition" ><g:message code="jobs.numberOfPosition.label" default="Number Of Position" /><span class="required-indicator">*</span></label>

                        <g:textField name="jobs[{i}].numberOfPosition" id="jobs[{i}].numberOfPosition" type="number" min="1" class="span2" value="" required=""/>
                        <span class="help-inline"></span>
                    </div>
                </div>

                <div class="control-group fieldcontain required">
                    <div class="controls">
                        <label for="basicSalary" ><g:message code="jobs.basicSalary.label" default="Basic Salary" /><span class="required-indicator">*</span></label>

                        <g:textField name="jobs[{i}].basicSalary" id="jobs[{i}].basicSalary" required="" value="" />
                        <span class="help-inline"></span>
                    </div>
                </div>

                <div class="control-group fieldcontain  ">
                    <div class="controls">
                        <label for="salaryInNepali" ><g:message code="jobs.salaryInNepali.label" default="Salary In Nepali" /></label>

                        <g:field name="jobs[{i}].salaryInNepali" id="jobs[{i}].salaryInNepali" type="number" min="1" value=""/>
                        <span class="help-inline"></span>
                    </div>
                </div>


                <div class="control-group fieldcontain ">
                    <div class="controls">
                        <label for="expenseToProcess" ><g:message code="jobs.expenseToProcess.label" default="Expense To Process" /></label>

                        <g:field name="jobs[{i}].expenseToProcess" id="jobs[{i}].expenseToProcess" type="number" min="1" value="${jobsInstance?.expenseToProcess}"/>
                        <span class="help-inline"></span>
                    </div>
                </div>
                <div class="control-group fieldcontain  ">
                    <div class="controls">
                        <label for="qualification" ><g:message code="jobs.qualification.label" default="Qualification" /></label>

                        <g:textArea rows="3" name="jobs[{i}].qualification" id="jobs[{i}].qualification"></g:textArea>
                        <span class="help-inline"></span>
                    </div>
                </div>
            </div>
            <div class="span6">
                <div class="control-group fieldcontain  ">
                    <div class="controls">
                        <label for="ageGroup" ><g:message code="jobs.ageGroup.label" default="Age Group" /></label>

                        <g:select id="jobs[{i}].ageGroup.id" name="jobs[{i}].ageGroup.id" from="${com.ligontech.FixedValue.findAllByFieldType(FieldType.AGEGROUP)}" optionKey="id" value="" class="many-to-one" noSelection="['': '--Select--']"/>
                        <span class="help-inline"></span>
                    </div>
                </div>

                <div class="control-group fieldcontain  required">
                    <div class="controls">
                        <label for="gender" ><g:message code="jobs.gender.label" default="Gender" /><span class="required-indicator">*</span></label>

                        <g:set var="allGender" value="${com.ligontech.FixedValue.findAllByFieldType(FieldType.GENDER)}"/>
                        <label class="radio inline"> <input type="radio" name="jobs[{i}].gender.id" checked="checked" value="" id="" > Any </label>
                        <g:radioGroup name="jobs[{i}].gender.id" id="jobs[{i}].gender.id"
                                      labels="${allGender.value}"
                                      values="${allGender.id}" value="">
                            <label class="radio inline"> ${it.radio} ${it.label} </label>
                        </g:radioGroup>
                        <span class="help-inline"></span>
                    </div>
                </div>

                <div class="control-group fieldcontain  required">
                    <div class="controls">
                        <label for="dailyWorkingHour" ><g:message code="jobs.dailyWorkingHour.label" default="Daily Working Hour" /><span class="required-indicator">*</span></label>

                        <g:textField class="span2" name="jobs[{i}].dailyWorkingHour" type="number" max="24" value="" required="" min="0"/>
                        <span class="help-inline"></span>
                    </div>
                </div>

                <div class="control-group fieldcontain  required">
                    <div class="controls">
                        <label for="weeklyWorkDays" ><g:message code="jobs.weeklyWorkDays.label" default="Weekly Work Days" /><span class="required-indicator">*</span></label>

                        <g:textField class="span2" name="jobs[{i}].weeklyWorkDays" id="jobs[{i}].weeklyWorkDays" type="number" max="7" value="" required="" min="0"/>
                        <span class="help-inline"></span>
                    </div>
                </div>

                <div class="control-group fieldcontain  required">
                    <div class="controls">
                        <label for="annualLeave" ><g:message code="jobs.annualLeave.label" default="Annual Leave" /><span class="required-indicator">*</span></label>

                        <g:textField class="span2" name="jobs[{i}].annualLeave" id="jobs[{i}].annualLeave" type="number" max="365" value="" required="" min="0"/>
                        <span class="help-inline"></span>
                    </div>
                </div>

                <div class="control-group fieldcontain  ">
                    <div class="controls">
                        <label for="experience" ><g:message code="jobs.experience.label" default="Experience" /></label>

                        <g:textArea rows="3" name="jobs[{i}].experience"></g:textArea>
                        <span class="help-inline"></span>
                    </div>
                </div>
            </div>
        </div>
        %{--<div class="control-group fieldcontain ">--}%
        %{--<div class="controls">--}%
        %{--<label class="checkbox inline" style="white-space: nowrap;">--}%
        %{--<g:checkBox name="housing" value="" />Housing--}%
        %{--</label>--}%
        %{--<label class="checkbox inline" style="white-space: nowrap;">--}%
        %{--<g:checkBox name="transportation" value="" />Transportation--}%
        %{--</label>--}%
        %{--<label class="checkbox inline" style="white-space: nowrap;">--}%
        %{--<g:checkBox name="fooding" value="" />Fooding--}%
        %{--</label>--}%
        %{--<label class="checkbox inline" style="white-space: nowrap;">--}%
        %{--<g:checkBox name="airTicket" value="" />Air Ticket--}%
        %{--</label>--}%
        %{--</div>--}%
        %{--</div>--}%

        <div class="control-group fieldcontain  ">
            <div class="controls">
                <label for="description" ><g:message code="jobs.description.label" default="Description" /></label>

                <g:textArea rows="3" name="jobs[{i}].description"></g:textArea>
                <span class="help-inline"></span>
            </div>
        </div>
        <%
            def facilityList=FixedValue.listAll.findAllWhere([fieldType: FieldType.FACILITY]);
            def facilityCount=facilityList.size()
            println facilityCount
            int rows=3
            int perRow=facilityCount/rows
        %>
        <div class="control-group">
        <div class="controls span3">
            <label for="" >Facility</label>
            <g:set var="count" value="${0}"></g:set>
            <g:set var="row" value="${1}"></g:set>
            <g:each in="${facilityList}" var="facility">
                <g:if test="${count==perRow && row<3}">
                    <g:set var="row" value="${row+1}"></g:set>
                    <g:set var="count" value="${0}"></g:set>
                    </div>
                    <div class="controls span3">
                <label for="" >&nbsp;</label>
                </g:if>
                <label class="checkbox">
                    <input type="checkbox" name="jobs[{i}].facility.id" value="${facility.id}"> ${facility}
                </label>
                <g:set var="count" value="${count+1}"></g:set>
            </g:each>
        </div>
        </div>

    </div>
    <form class="form-horizontal" id="jobs_form" >
    </form>
</div>

<div class="modal-footer">
    <button type="button" data-dismiss="modal" class="btn">Close</button>
    <button type="button" class="btn btn-primary" id="jobs_reset">Reset</button>
    <button type="button" class="btn btn-primary" id="jobs_save">Save</button>
    <button type="button" class="btn btn-primary" id="jobs_update">Update</button>
</div>
</div>
<script>
    $(document).ready(function() {
        $('#jobs_modal').on('hidden', function() {
            $('#jobs_modal #jobs_update').removeClass('hide');
            $('#jobs_modal #jobs_save').removeClass('hide');
            $('#jobs_modal form').html('');
        })
//        $('#job_modal').on('shown', function() {
//            var data2='{"designation":"fasdf","numberOfPosition":"","basicSalary":"fsadf","salaryInNepali":"","expenseToProcess":"","qualification":"sadf","ageGroup.id":"25","gender.id":"10","dailyWorkingHour":"fsdf","weeklyWorkDays":"fsadf","annualLeave":"sdf","experience":"sfd","_housing":"","housing":"on","_transportation":"","transportation":"on","_fooding":"","fooding":"on","_airTicket":"","airTicket":"on","description":""}'
//            var data='[{"name":"designation","value":"fasdf"},{"name":"numberOfPosition","value":""},{"name":"basicSalary","value":"fsadf"},{"name":"salaryInNepali","value":""},{"name":"expenseToProcess","value":""},{"name":"qualification","value":"sadf"},{"name":"ageGroup.id","value":"25"},{"name":"gender.id","value":"9"},{"name":"dailyWorkingHour","value":"fsdf"},{"name":"weeklyWorkDays","value":"fsadf"},{"name":"annualLeave","value":"sdf"},{"name":"experience","value":"sfd"},{"name":"_housing","value":""},{"name":"_transportation","value":""},{"name":"transportation","value":"on"},{"name":"_fooding","value":""},{"name":"_airTicket","value":""},{"name":"description","value":"fsdf"}]'
//            $('#job_modal form').deserialize($.parseJSON(data));
////            $form.deserialize(method, function() {
////                alert("done!");
////            });
//        })
    });
    //    function addJob(){
    //        $('#job_modal #job_update').addClass('hide');
    //        var data='[{"name":"designation","value":"fasf"},{"name":"numberOfPosition","value":"43"},{"name":"basicSalary","value":"4234"},{"name":"salaryInNepali","value":"4324"},{"name":"expenseToProcess","value":"4234"},{"name":"qualification","value":"423"},{"name":"ageGroup.id","value":"23"},{"name":"gender.id","value":"9"},{"name":"dailyWorkingHour","value":"8"},{"name":"weeklyWorkDays","value":"7"},{"name":"annualLeave","value":"3"},{"name":"experience","value":"dsfasdfsf"},{"name":"_housing","value":""},{"name":"housing","value":"on"},{"name":"_transportation","value":""},{"name":"_fooding","value":""},{"name":"fooding","value":"on"},{"name":"_airTicket","value":""},{"name":"description","value":"sdfsafsafd sdfasd asdfasf"}]';
    //        $('#jobs_form').deserialize($.parseJSON(data), function() {
    //            $('#job_modal').modal('show');
    //        });
    ////        $('#job_modal').modal('show');
    //    }
    //    function editJob(obj){
    //        sn=obj;
    //        $('#job_modal #job_save').addClass('hide');
    //        var txtId='job'+obj;
    //        console.log(txtId)
    //        var data=$('#'+txtId).val();
    //        console.log(data);
    //        $('#jobs_form').deserialize($.parseJSON(data), function() {
    //            $('#job_modal').modal('show');
    //        });
    //    }
    //    function deleteJob(obj){
    ////        bootbox.alert("Hello world!", function() {
    ////            Example.show("Hello world callback");
    ////        });
    //
    //        bootbox.confirm("Are you sure?", function(result) {
    //            if(result==true){
    //                $("#jobs_table table td").filter(function() {
    //                    return $(this).text() == obj;
    //                }).closest("tr").remove();
    //                $('#jobs_div #job'+obj).remove()
    //            }
    //        });
    //
    //    }
    //    $(document).on("click", "#job_modal #job_reset", function () {
    //        $("#job_modal form")[0].reset()
    //    });
    //    $(document).on("click", "#job_modal #job_update", function () {
    //        if(!$('#jobs_form').valid()  || sn==null){
    //            return;
    //        }
    //        var params = $("#job_modal form").serializeArray();
    //        $('#job'+sn).val(JSON.stringify(params))
    //        var tableRow = $("#jobs_table table td").filter(function() {
    //            return $(this).text() == sn;
    //        }).closest("tr");
    //        var tr=$('#jobs_template').clone();
    //        $(tableRow).find('td').each(function(){
    //            var id=$(this).prop('class');
    //            $(this).text($('#'+id).val());
    //        });
    //
    //        $('#job_modal').modal('hide');
    //    });
    //    $(document).on("click", "#job_modal #job_save", function () {
    //        if(!$('#jobs_form').valid()){
    //            return;
    //        }
    ////        var data={};
    ////            var id=$(this).attr('id');
    ////            var row={};
    ////            $('#job_modal form').find('input,select,textarea').each(function(){
    ////                row[$(this).attr('name')]=$(this).val();
    ////            });
    ////            data[id]=row;
    ////        console.log(JSON.stringify(data));
    //        var params = $("#job_modal form").serializeArray();
    //        $('<input>').attr({
    //            type: 'text',
    //            id: 'job'+(++count),
    //            name: 'jobs',
    //            value:JSON.stringify(params)
    //        }).appendTo('#jobs_div');
    //
    //        var tr=$('#jobs_template').clone();
    //        $(tr).find('td').each(function(){
    //            var id=$(this).prop('class');
    //            $(this).text($('#'+id).val());
    //        });
    //
    //        $(tr).find('td.jobs_sn').text(count)
    //        $(tr).removeClass('hide');
    //        $('#jobs_table table thead').append(tr);
    //        console.log(JSON.stringify(params))
    //        $('#job_modal').modal('hide');
    //    });
</script>
%{--<script type="text/javascript">--}%
    %{--$(function() {--}%
        %{--var myForm = $('#jobs_form');--}%
        %{--myForm.validate({--}%
            %{--onkeyup: false,--}%
            %{--errorClass: 'error',--}%
            %{--errorElement: 'label',--}%
            %{--validClass: 'valid',--}%
            %{--onsubmit: true,--}%

            %{--rules: {--}%
                %{--designation: { required: true },--}%
                %{--numberOfPosition: { 	custom: {--}%
                    %{--url: '/ligonEMS/JQueryRemoteValidator/validate',--}%
                    %{--type: 'post',--}%
                    %{--data: {--}%
                        %{--validatableClass: 'com.ligontech.Jobs',--}%
                        %{--property: 'numberOfPosition',--}%
                        %{--constraint: 'min'--}%
                    %{--}--}%
                %{--}, required: true },--}%
                %{--basicSalary: { required: true },--}%
                %{--salaryInNepali: { digits: true, min: 1 },--}%
                %{--qualification: { },--}%
                %{--experience: { },--}%
                %{--ageGroup: { },--}%
                %{--gender: { required: true },--}%
                %{--dailyWorkingHour: { 	custom: {--}%
                    %{--url: '/ligonEMS/JQueryRemoteValidator/validate',--}%
                    %{--type: 'post',--}%
                    %{--data: {--}%
                        %{--validatableClass: 'com.ligontech.Jobs',--}%
                        %{--property: 'dailyWorkingHour',--}%
                        %{--constraint: 'max'--}%
                    %{--}--}%
                %{--}, required: true },--}%
                %{--weeklyWorkDays: { 	custom: {--}%
                    %{--url: '/ligonEMS/JQueryRemoteValidator/validate',--}%
                    %{--type: 'post',--}%
                    %{--data: {--}%
                        %{--validatableClass: 'com.ligontech.Jobs',--}%
                        %{--property: 'weeklyWorkDays',--}%
                        %{--constraint: 'max'--}%
                    %{--}--}%
                %{--}, required: true },--}%
                %{--annualLeave: { 	custom: {--}%
                    %{--url: '/ligonEMS/JQueryRemoteValidator/validate',--}%
                    %{--type: 'post',--}%
                    %{--data: {--}%
                        %{--validatableClass: 'com.ligontech.Jobs',--}%
                        %{--property: 'annualLeave',--}%
                        %{--constraint: 'max'--}%
                    %{--}--}%
                %{--}, required: true },--}%
                %{--expenseToProcess: { digits: true, min: 1 },--}%
                %{--housing: { },--}%
                %{--transportation: { },--}%
                %{--fooding: { },--}%
                %{--airTicket: { },--}%
                %{--demand: { },--}%
                %{--description: { }--}%
            %{--},--}%
            %{--messages: {--}%
                %{--designation: { required: 'This field is required' },--}%
                %{--numberOfPosition: { required: 'This field is required' },--}%
                %{--basicSalary: { required: 'This field is required' },--}%
                %{--salaryInNepali: {--}%
                    %{--digits: 'Salary in Nepali must be a valid number',--}%
                    %{--min: function() {--}%
                        %{--return 'Must be postive number';--}%
                    %{--} },--}%
                %{--qualification: { },--}%
                %{--experience: { },--}%
                %{--ageGroup: { },--}%
                %{--gender: { required: 'This field is required' },--}%
                %{--dailyWorkingHour: { required: 'This field is required' },--}%
                %{--weeklyWorkDays: { required: 'This field is required' },--}%
                %{--annualLeave: { required: 'This field is required' },--}%
                %{--expenseToProcess: { digits: 'Must be a valid number', min: function() { return 'Must be positive number'; } },--}%
                %{--housing: { },--}%
                %{--transportation: { },--}%
                %{--fooding: { },--}%
                %{--airTicket: { },--}%
                %{--demand: { },--}%
                %{--description: { }--}%
            %{--}--}%
        %{--});--}%
    %{--});--}%
%{--</script>--}%

