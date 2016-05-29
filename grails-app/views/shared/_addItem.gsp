<r:require module="notify" />
<div id="addItem_dialog_${item}" title="${title}">
      <div class="modal-body">
            <form class="form-horizontal style1" id="${item}_form">
                  <div class="hide">
                        <g:select name="fieldType" id="${item}_fieldType" from="${com.ligontech.FieldType?.values()}"
                                  keys="${com.ligontech.FieldType.values()*.name()}" required=""/>
                  </div>
                  <div class="control-group">
                        <label class="control-label" for="${item}_value">Value</label>
                        <div class="controls">
                              <input type="text" name="value" id="${item}_value" placeholder="Value">
                        </div>
                  </div>
                  <div class="control-group">
                        <label class="control-label" for="${item}_description">Description</label>
                        <div class="controls">
                              <g:textArea name="description" id="${item}_description"></g:textArea>
                        </div>
                  </div>
            </form>
      </div>
      <div class="modal-footer">
            <button type="button" data-dismiss="modal" class="btn">Close</button>
            <button type="button" class="btn btn-primary" id="${item}_save">Save</button>
      </div>
</div>
<script>
      $(document).ready(function() {
            $('#${item}_modal').on('hidden', function() {
                  $('#${item}_form')[0].reset()
            })
            $('#${item}_save').on('click', function(e){
                  var $url = '<g:createLink controller="fixedValue" action="ajaxSave"/>';
                  var $data= $('#${item}_form').serialize()
                  var fieldType=$('#${item}_form select option:selected').text()
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
                                    $('#${item}_modal').modal('hide');
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
