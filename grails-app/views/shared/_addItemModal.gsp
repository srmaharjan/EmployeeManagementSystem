<r:require module="notify" />
<div class="modal hide fade" id="addItem_modal">
    <div class="modal-body">
        <form class="form-horizontal" id="addItem_form">
            <div class="hide">
                <g:select name="fieldType" id="addItem_fieldType" from="${com.ligontech.FieldType?.values()}"
                          keys="${com.ligontech.FieldType.values()*.name()}" required=""/>
            </div>
            <div class="control-group">
                <label class="control-label" for="addItem_value">Value</label>
                <div class="controls">
                    <input type="text" name="value" id="addItem_value" placeholder="Value">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="addItem_description">Description</label>
                <div class="controls">
                    <g:textArea name="description" id="addItem_description"></g:textArea>
                </div>
            </div>
        </form>
    </div>
    <div class="modal-footer">
        <button type="button" data-dismiss="modal" class="btn">Close</button>
        <button type="button" class="btn btn-primary" id="addItem_save">Save</button>
    </div>
</div>
<script>
    $(document).ready(function() {
        $('#addItem_modal').on('hidden', function() {
            $('#addItem_form')[0].reset()
        })
        $('#addItem_save').on('click', function(e){
            var $url = '<g:createLink controller="fixedValue" action="ajaxSave"/>';
            var $data= $('#addItem_form').serialize()
            var fieldType=$('#addItem_form select option:selected').text()
            $.ajax({
                type: 'post',
                url: $url,
                data: $data
            }).done(function(data) {
                        if(data.id!=''){
                            $.pnotify({
                                title: 'Success',
                                text: fieldType+' successfully saved!',
                                type: 'success'
                            });
                            $('#addItem_modal').modal('hide');
                        }else{
                            $.pnotify({
                                title: 'Error!',
                                text: data.error,
                                type: 'error'
                            });
                        }
                    }).fail(function() {
                        $.pnotify({
                            title: 'Error!',
                            text: 'Error occured while saving '+fieldType,
                            type: 'error'
                        });
                    }).always(function() {

                    });
            event.preventDefault();
        });
    });
</script>
