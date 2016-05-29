<table class="table table-hover form-inline" id="language_list">
    <thead>
    <tr>
        <th class="span2">Language<span class="required-indicator">*</span></th>
        <th class="span3">Reading</th>
        <th class="span3">Writing</th>
        <th class="span3">Speaking</th>
        <th class="span1">Actions</th>
    </tr>
    </thead>
    <tbody>

    <g:each var="language" in="${jobseekerInstance?.languages}" status="i">
        <g:render template='language' model="['language':language,'i':i,'hidden':false,languageList:languageList]"/>
    </g:each>
    </tbody>
</table>
<input type="button" value="Add language" onclick="addlanguage();" />

<script type="text/javascript">
    var languageCount = ${jobseekerInstance?.languages?.size()} + 0;
    function addlanguage(){
        var tableRow=$("#languages_template").clone()
        var htmlId = 'languages['+languageCount+']';
        var allInputs=tableRow.find('[name^="languages[_template]"]')
        $.each(allInputs,function(){
            var name=$(this).prop('name').replace('languages[_template]','')
            $(this).prop('id',htmlId+name)
                    .prop('name',htmlId+name)
        });
        tableRow.prop('id','languages'+languageCount);
        tableRow.data('index',languageCount)
        $("#language_list tbody").append(tableRow);
        tableRow.show();
        languageCount++;
    }

    //bind click event on delete buttons using jquery live
    $(document).on('click','.del-languages',function() {
        var prnt = $(this).parents(".languages-tr");
        var delInput = prnt.find("input[id$=deleted]");
        var newValue = prnt.find("input[id$=new]").attr('value');
        if(newValue == 'true'){
            var index=prnt.data('index')
            prnt.remove();
            reArrangeLanguage(index)
        }else{
            delInput.attr('value','true');
            prnt.hide();
        }
    });
    function reArrangeLanguage(index){
        var new_index=index++;
        var totalCount=languageCount
        for(index;index<=totalCount;index++){
            var tableRow=$('#languages'+index);
            var allInputs=tableRow.find('[name^="languages['+index+']"]')
            var newName='languages['+new_index+']'
            $.each(allInputs,function(){
                var name=$(this).prop('name').replace('languages['+index+']','')
                $(this).prop('id','languages['+new_index+']'+name)
                        .prop('name','languages['+new_index+']'+name)
            });
            tableRow.prop('id','languages'+new_index);
            tableRow.data('index',new_index)
            new_index++;
        }
        languageCount--;
    }

</script>