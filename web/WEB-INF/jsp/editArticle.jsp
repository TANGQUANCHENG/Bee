<%--
  Created by IntelliJ IDEA.
  User: dxkj
  Date: 2016/10/29
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>H+ 后台主题UI框架 - 富文本编辑器</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="/static/css/animate.min.css" rel="stylesheet">
    <link href="/static/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="/static/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <link href="/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="/static/css/plugins/toastr/toastr.min.css" rel="stylesheet">

</head>
<body class="gray-bg">
<div class="row">
    <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>编辑文章
                            <small>标题长度建议不要超过30字</small>
                        </h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form method="get" class="form-horizontal" id="articleForm">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">请输入标题</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="articleTitle" name="title">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">请输入副标题</label>
                                <div class="col-sm-10">
                                    <textarea type="text" class="form-control" id="articleSubTitle"
                                              name="subtitle"></textarea>
                                </div>
                            </div>
                            <%--  <input type="hidden" name="content" id="articleContent">--%>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">请输入内容</label>
                                <div class="col-sm-10">
                                    <textarea type="text" class="form-control" id="articleContentEditor"
                                              name="content"></textarea>
                                </div>
                            </div>

                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-info" type="button" onclick="preview()">预览</button>
                                    <%--   <button class="btn btn-primary" type="submit">保存内容</button>--%>
                                    <button class="btn btn-white" type="submit">取消</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal inmodal fade" id="myModal5" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="width: 1200px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="articleTitlePre">窗口标题</h4>
                <small class="font-bold" id="articleSubTitlePre">这里可以显示副标题。</small>
            </div>
            <div class="modal-body" id="articleContentPre">
                <p><strong>H+</strong>
                    是一个完全响应式，基于Bootstrap3.3.6最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术，她提供了诸多的强大的可以重新组合的UI组件，并集成了最新的jQuery版本(v2.1.1)，当然，也集成了很多功能强大，用途广泛的jQuery插件，她可以用于所有的Web应用程序，如网站管理后台，网站会员中心，CMS，CRM，OA等等，当然，您也可以对她进行深度定制，以做出更强系统。
                </p>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="saveArticle()">保存</button>
            </div>
        </div>
    </div>
</div>
<script src="/static/js/jquery.min.js?v=2.1.4"></script>
<script src="/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/static/js/content.min.js?v=1.0.0"></script>
<script src="/static/js/plugins/summernote/summernote.min.js"></script>
<script src="/static/js/plugins/summernote/summernote-zh-CN.js"></script>
<script src="/static/js/plugins/toastr/toastr.min.js"></script>
<script type="text/javascript"
        src="/static/kindeditor-4.1.10/kindeditor.js"></script>
<script type="text/javascript"
        src="/static/kindeditor-4.1.10/lang/zh_CN.js"></script>
<script type="text/javascript">
    KindEditor
            .ready(function (K) {
                window.editor = K
                        .create(
                                '#articleContentEditor',
                                {
                                    cssPath: '/static/kindeditor-4.1.10/plugins/code/prettify.css',
                                    uploadJson: '<%=basePath%>kindeditor/file-upload.do?sessionid=1',
                                    fileManagerJson: '<%=basePath%>kindeditor/file-manager.do',
                                    allowFileManager: true,
                                    allowImageUpload: true,
                                    imageSizeLimit: '10MB', //批量上传图片单张最大容量
                                    imageUploadLimit: 100,//批量上传图片同时上传最多个数
                                    afterCreate: function () {
                                    }
                                });
            });
</script>
<script>
    $(document).ready(function () {
        toastr.options = {
            "closeButton": true,
            "debug": false,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "onclick": null,
            "showDuration": "400",
            "hideDuration": "1000",
            "timeOut": "7000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
    });
    var preview = function () {
        editor.sync();
        $("#articleTitlePre").text($("#articleTitle").val());
        $("#articleSubTitlePre").text($("#articleSubTitle").val());
        $("#articleContentPre").empty();
        $("#articleContentPre").append($("#articleContentEditor").val());

        $("#myModal5").modal("show");
    }
    var saveArticle = function () {
        $.post("/articleController/addArticle", $("#articleForm").serialize(), function (data) {
            if (data.success) {
                toastr.success("文章发表成功");
            } else {
                toastr.error("文章发表失败");
            }
            $("#myModal5").modal("hide");
        })
    }
</script>
</body>
</html>

