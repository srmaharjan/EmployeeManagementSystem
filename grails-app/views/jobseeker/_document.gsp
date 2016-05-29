<tr id="document_${document.id}">
      <td><input type="checkbox" id="checkbox_${document.id}" name="document" class="child_document" data-id="${document.id}" data-filename="${document.fileName}" data-jobseeker="${jobseeker}"/></td>
      <td><g:link controller="document" action="download" params="[id:document.id,name:document.fileName,jobseekerId:jobseeker]" >${document?.name?.encodeAsHTML()}</g:link></td>
      <td><a href="javascript:void(0);" onclick="deleteDocument(${document.id},'${document.fileName}',${jobseeker});">Delete</a> </td>
</tr>