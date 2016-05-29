<table class="table table-hover form-inline" id="education_list">
    <thead>
    <tr>
        <th class="span2">Degree<span class="required-indicator">*</span></th>
        <th class="span3">Name of Degree</th>
        <th class="span3">Colleg / School</th>
        <th class="span3">Board</th>
        <th class="span2">Passing Year</th>
        <th class="span1">Percent</th>
        <th class="span1">Actions</th>
    </tr>
    </thead>
    <tbody>
    <g:each var="education" in="${jobseekerInstance?.educations}" status="i">
        <g:render template='/jobseeker/education' model="['education':education,'i':i,'hidden':false]"/>
    </g:each>
    </tbody>
</table>
<input type="button" value="Add Education" onclick="addEducation();" />

<script type="text/javascript">
    var educationCount = ${jobseekerInstance?.educations?.size()} + 0;
    function addEducation(){
        var tableRow=$("#educations_template").clone()
        var htmlId = 'educations['+educationCount+']';
        var allInputs=tableRow.find('[name^="educations[_template]"]')
        $.each(allInputs,function(){
            var name=$(this).prop('name').replace('educations[_template]','')
            $(this).prop('id',htmlId+name)
                    .prop('name',htmlId+name)
        });
        tableRow.prop('id','educations'+educationCount);
        tableRow.data('index',educationCount)
        $("#education_list tbody").append(tableRow);
        tableRow.show();
        educationCount++;
    }

    //bind click event on delete buttons using jquery live
    $(document).on('click','.del-educations',function() {
        var prnt = $(this).parents(".educations-tr");
        var delInput = prnt.find("input[id$=deleted]");
        var newValue = prnt.find("input[id$=new]").attr('value');
        if(newValue == 'true'){
            var index=prnt.data('index')
            prnt.remove();
            reArrangeEducation(index)
        }else{
            delInput.attr('value','true');
            prnt.hide();
        }
    });
    function reArrangeEducation(index){
        var new_index=index++;
        var totalCount=educationCount
        for(index;index<=totalCount;index++){
            var tableRow=$('#educations'+index);
            var allInputs=tableRow.find('[name^="educations['+index+']"]')
            var newName='educations['+new_index+']'
            $.each(allInputs,function(){
                var name=$(this).prop('name').replace('educations['+index+']','')
                $(this).prop('id','educations['+new_index+']'+name)
                        .prop('name','educations['+new_index+']'+name)
            });
            tableRow.prop('id','educations'+new_index);
            tableRow.data('index',new_index)
            new_index++;
        }
        educationCount--;
    }

</script>