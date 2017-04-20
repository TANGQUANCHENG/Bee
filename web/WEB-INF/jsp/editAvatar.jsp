<%--
  Created by IntelliJ IDEA.
  User: dxkj
  Date: 2016/11/10
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

    <link href="/static/css/animate.min.css" rel="stylesheet">
    <link href="/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">

    <link href="/static/css/plugins/cropper/cropper.min.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">

            <div class="ibox float-e-margins">
                <div class="ibox-title  back-change">
                    <h5>图片裁剪 <small>http://fengyuanchen.github.io/cropper/</small></h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#">选项 01</a>
                            </li>
                            <li><a href="#">选项 02</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <p>
                        一款简单的jQuery图片裁剪插件
                    </p>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="image-crop">
                                <img src="/static/img/a3.jpg">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h4>图片预览：</h4>
                            <div class="img-preview img-preview-sm"></div>
                            <h4>说明：</h4>
                            <p>
                                你可以选择新图片上传，然后下载裁剪后的图片
                            </p>
                            <div class="btn-group">
                                <label title="上传图片" for="inputImage" class="btn btn-primary">
                                    <input type="file"  name="file" id="inputImage" class="hide"> 上传新图片
                                </label>
                                <label title="下载图片" id="download" class="btn btn-primary">下载</label>
                                <label title="下载图片" id="getCroppedCanvas" class="btn btn-primary">查看</label>
                            </div>
                            <h4>其他说明：</h4>
                            <p>
                                你可以使用<code>$({image}).cropper(options)</code>来配置插件
                            </p>
                            <div class="btn-group">
                                <button class="btn btn-white" id="zoomIn" type="button">放大</button>
                                <button class="btn btn-white" id="zoomOut" type="button">缩小</button>
                                <button class="btn btn-white" id="rotateLeft" type="button">左旋转</button>
                                <button class="btn btn-white" id="rotateRight" type="button">右旋转</button>
                                <button class="btn btn-warning" id="setDrag" type="button">裁剪</button>
                            </div>
                            <div class="btn-group">
                                <button class="btn btn-white" id="16cut" type="button">16:9</button>
                                <button class="btn btn-white" id="4cut" type="button">4:3</button>
                                <button class="btn btn-white" id="1cut" type="button">1:1</button>
                                <button class="btn btn-white" id="2cut" type="button">2:3</button>
                                <button class="btn btn-warning" id="getData" type="button">数据</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Show the cropped image in modal -->
                <div class="modal fade docs-cropped" id="getCroppedCanvasModal" aria-hidden="true" aria-labelledby="getCroppedCanvasTitle" role="dialog" tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button class="close" data-dismiss="modal" type="button" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="getCroppedCanvasTitle">Cropped</h4>
                            </div>
                            <div class="modal-body">

                            </div>
                            <!-- <div class="modal-footer">
                              <button class="btn btn-primary" data-dismiss="modal" type="button">Close</button>
                            </div> -->
                        </div>
                    </div>
                </div><!-- /.modal -->
            </div>

        </div>
    </div>
</div>
<script src="/static/js/jquery.min.js?v=2.1.4"></script>
<script src="/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/static/js/content.min.js?v=1.0.0"></script>
<script src="/static/js/plugins/cropper/cropper.min.js"></script>
<script>
    $(document).ready(function () {
        var o = $(".image-crop > img");
        $(o).cropper({
            aspectRatio: 1.618, preview: ".img-preview", done: function () {
            }
        });
        var r = $("#inputImage");
        window.FileReader ? r.change(function () {
            var e, i = new FileReader, t = this.files;
            t.length && (e = t[0], /^image\/\w+$/.test(e.type) ? (i.readAsDataURL(e), i.onload = function () {
                r.val(""), o.cropper("reset", !0).cropper("replace", this.result)
            }) : showMessage("请选择图片文件"))
        }) : r.addClass("hide"), $("#download").click(function () {
            window.open(o.cropper("getDataURL"))
        }), $("#zoomIn").click(function () {
            o.cropper("zoom", .1)
        }), $("#zoomOut").click(function () {
            o.cropper("zoom", -.1)
        }), $("#rotateLeft").click(function () {
            o.cropper("rotate", 45)
        }), $("#rotateRight").click(function () {
            o.cropper("rotate", -45)
        }), $("#setDrag").click(function () {
            o.cropper("setDragMode", "crop")
        }), $("#getCroppedCanvas").click(function () {
            var result= o.cropper("getCroppedCanvas");
            console.log(result);
            $('#getCroppedCanvasModal').modal().find('.modal-body').html(result);
        }), $("#16cut").click(function () {
            o.cropper("setAspectRatio", 16/9);
            $(".img-preview").css({
                width:200,
                height:112.5
            })
        }), $("#4cut").click(function () {
            o.cropper("setAspectRatio",4/3);
            $(".img-preview").css({
                width:200,
                height:150
            })
        }), $("#1cut").click(function () {
            o.cropper("setAspectRatio", 1/1);
            $(".img-preview").css({
                width:200,
                height:200
            })
        }),$("#2cut").click(function () {
            o.cropper("setAspectRatio", 2/3);
            $(".img-preview").css({
                width:200,
                height:300
            })
        }),$("#getData").click(function () {
            var obj = o.cropper("getCroppedCanvas",{
                width: 160,
                height: 90});//找死了
$("#getCroppedCanvasModal").find(".modal-body").append(obj);
            $("#getCroppedCanvasModal").modal("show");
           console.log(obj);
        })
    });
</script>
</body>


<!-- Mirrored from www.zi-han.net/theme/hplus/empty_page.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:19:52 GMT -->
</html>



