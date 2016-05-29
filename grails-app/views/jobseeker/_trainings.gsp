<table class="table table-hover form-inline" id="training_list">
    <thead>
    <tr>
        <th class="span2">Topic<span class="required-indicator">*</span></th>
        <th class="span3">Training Objective</th>
        <th class="span3">Duration</th>
        <th class="span3">Training Center</th>
        <th class="span1">Actions</th>
    </tr>
    </thead>
    <tbody>
    <g:each var="training" in="${jobseekerInstance?.trainings}" status="i">
        <g:render template='training' model="['training':training,'i':i,'hidden':false]"/>
    </g:each>
    </tbody>
</table>
<input type="button" value="Add Training" onclick="addTraining();" />

<script type="text/javascript">
    var trainingCount = ${jobseekerInstance?.trainings?.size()} + 0;
    function addTraining(){
        var tableRow=$("#trainings_template").clone()
        var htmlId = 'trainings['+trainingCount+']';
        var allInputs=tableRow.find('[name^="trainings[_template]"]')
        $.each(allInputs,function(){
            var name=$(this).prop('name').replace('trainings[_template]','')
            $(this).prop('id',htmlId+name)
                    .prop('name',htmlId+name)
        });
        tableRow.prop('id','trainings'+trainingCount);
        tableRow.data('index',trainingCount)
        $("#training_list tbody").append(tableRow);
        tableRow.show();
        trainingCount++;
    }

    //bind click event on delete buttons using jquery live
    $(document).on('click','.del-trainings',function() {
        var prnt = $(this).parents(".trainings-tr");
        var delInput = prnt.find("input[id$=deleted]");
        var newValue = prnt.find("input[id$=new]").attr('value');
        if(newValue == 'true'){
            var index=prnt.data('index')
            prnt.remove();
            reArrangeTraining(index)
        }else{
            delInput.attr('value','true');
            prnt.hide();
        }
    });
    function reArrangeTraining(index){
        var new_index=index++;
        var totalCount=trainingCount
        for(index;index<=totalCount;index++){
            var tableRow=$('#trainings'+index);
            var allInputs=tableRow.find('[name^="trainings['+index+']"]')
            var newName='trainings['+new_index+']'
            $.each(allInputs,function(){
                var name=$(this).prop('name').replace('trainings['+index+']','')
                $(this).prop('id','trainings['+new_index+']'+name)
                        .prop('name','trainings['+new_index+']'+name)
            });
            tableRow.prop('id','trainings'+new_index);
            tableRow.data('index',new_index)
            new_index++;
        }
        trainingCount--;
    }

</script>