<div class="modal hide fade" id="webcam" style="width:700px;margin-left: -350px; display:none;">
      <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h3>Snap Picture</h3>
      </div>
      <div class="modal-body">
            <div class="row-fluid">
                  <div class="span6">
                        <div id="webcam_div"></div>
                  </div>
                  <div class="span6">
                        <canvas id="webcam_canvas" style="width: 320px;height: 240px;"></canvas>
                        <canvas id='blank' style='display:none'></canvas>
                  </div>
            </div>
      </div>
      <div class="modal-footer">
            <button type="button" data-dismiss="modal" class="btn">Close</button>
            <button type="button" class="btn btn-primary" id="webcam_preview">Preview</button>
            <button type="button" class="btn btn-primary" id="webcam_save">Save</button>
      </div>
</div>
<script>
      $(document).ready(function(){
            var pos = 0, ctx = null, saveCB, image = [];
            var canvas = document.getElementById("webcam_canvas");
            canvas.setAttribute('width', 320);
            canvas.setAttribute('height', 240);
            if (canvas.toDataURL) {
                  ctx = canvas.getContext("2d");
                  image = ctx.getImageData(0, 0, 320, 240);

                  saveCB = function(data) {

                        var col = data.split(";");
                        var img = image;

                        for(var i = 0; i < 320; i++) {
                              var tmp = parseInt(col[i]);
                              img.data[pos + 0] = (tmp >> 16) & 0xff;
                              img.data[pos + 1] = (tmp >> 8) & 0xff;
                              img.data[pos + 2] = tmp & 0xff;
                              img.data[pos + 3] = 0xff;
                              pos+= 4;
                        }

                        if (pos >= 4 * 320 * 240) {
                              ctx.putImageData(img, 0, 0);
                              //Canvas2Image.saveAsPNG(canvas);
//                    $('#canvasFile').val(ctx.getImageData())
//                    var x = canvas.toDataURL("image/png");
//                    x = x.substr(x.indexOf(',') + 1).toString();
//                    $('#canvasImg').val(x)

//                    Canvas2Image.saveAsPNG(canvas);
                              // window.open(canvas.toDataURL());
                              // $.twFile.save("/home/",canvas.toDataURL("image/png"));
//                            $.post("/upload.php", {type: "data", image: canvas.toDataURL("image/png")});
                              pos = 0;
                        }
                  };

            }
            $("#webcam_div").webcam({
                  width: 320,
                  height: 240,
                  mode: "callback",
                  swffile: "${resource(dir: 'js/webcam',file: 'jscam.swf')}",
                  onTick: function() {},
                  onSave:saveCB,
                  onCapture: function() {
                        var location=webcam.save();
                        console.log(location);

                  },
                  debug: function() {},
                  onLoad: function() {}
            });

      });
      $(document).on('click','#webcam_preview',function(){
            webcam.capture();
            return false;
      });
      $(document).on('click','#webcam_save',function(){

            var canvas  = document.getElementById('webcam_canvas');
            if(canvas.toDataURL() == document.getElementById('blank').toDataURL())
                  webcam.capture();

            Canvas2Image.saveAsPNG(canvas);
            $('#webcam').modal('hide');
            return false;
      });
</script>

