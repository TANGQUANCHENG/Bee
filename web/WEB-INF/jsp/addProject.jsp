<%--
  Created by IntelliJ IDEA.
  User: dxkj
  Date: 2016/11/16
  Time: 14:35
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
    <link href="/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="/static/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/static/css/plugins/chosen/chosen.css" rel="stylesheet">
    <link href="/static/css/plugins/steps/jquery.steps.css" rel="stylesheet">
    <link href="/static/css/animate.min.css" rel="stylesheet">
    <link href="/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <style>
        .wizard-big.wizard > .content {
            position: unset;
        }
        .content{
            min-height: 400px;
        }
    </style>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox">
                <div class="ibox-title">
                    <h5>创建新的项目</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="form_wizard.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="javascript:void(0)">选项1</a>
                            </li>
                            <li><a href="javascript:void(0)">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <input type="hidden" id="projectId">
                    <form id="form" action="#" class="wizard-big">
                        <h1>编辑项目基础信息</h1>
                        <fieldset style="min-height: 400px;">
                            <h2>基础信息</h2>
                            <div class="row">
                                <div class="col-sm-8">
                                    <div class="form-group">
                                        <label>项目名称 *</label>
                                        <input id="projectName" name="userName" type="text" class="form-control required">
                                    </div>
                                    <div class="form-group">
                                        <label>初始版本号 *</label>
                                        <input id="projectVersion" name="password" type="text" class="form-control required">
                                    </div>
                                    <div class="form-group">
                                        <label>客户 *</label>
                                        <div class="input-group">
                                            <select data-placeholder="选择客户"
                                                    class="chosen-select form-control required col-sm-8">

                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="text-center">
                                        <div style="margin-top: 20px">
                                           <a class="btn btn-default" id="saveBasicInfo">保存</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </fieldset>
                        <h1>编辑项目描述</h1>
                        <fieldset>
                            <div class="row">
                                <div class="col-sm-9">
                                    <div class="form-group">
                                        <textarea id="projectDescription" name="description" type="text"
                                                  class="form-control required"></textarea>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <a class="btn btn-default" id="updateDescription">保存</a>

                                </div>
                            </div>
                        </fieldset>

                        <h1>上传相关资料</h1>
                        <fieldset>
                            <div class="text-center" style="margin-top: 60px">
                                <a class="btn btn-success " href="javascript:void(0)" id="uploadFile">
                                    <i class="fa fa-upload"></i>
                                    <span class="bold">上传</span>
                                </a>
                            </div>
                        </fieldset>

                        <h1>管理参与人员</h1>
                        <fieldset>
                            <h2>条款</h2>
                            <input id="acceptTerms" name="acceptTerms" type="checkbox" class="required">
                            <label for="acceptTerms">我同意注册条款</label>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
<script src="/static/js/jquery.min.js?v=2.1.4"></script>
<script src="/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/static/js/plugins/chosen/chosen.jquery.js"></script>
<script src="/static/js/content.min.js?v=1.0.0"></script>
<script src="/static/js/plugins/staps/jquery.steps.min.js"></script>
<script src="/static/js/plugins/validate/jquery.validate.min.js"></script>
<script src="/static/js/plugins/validate/messages_zh.min.js"></script>
<script type="text/javascript"
        src="/static/kindeditor-4.1.10/kindeditor.js"></script>
<script type="text/javascript"
        src="/static/kindeditor-4.1.10/lang/zh_CN.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#form").steps({
            bodyTag: "fieldset", onStepChanging: function (event, currentIndex, newIndex) {
                if (currentIndex > newIndex) {
                    return true
                }
                if (newIndex === 3 && Number($("#age").val()) < 18) {
                    return false
                }
                var form = $(this);
                if (currentIndex < newIndex) {
                    $(".body:eq(" + newIndex + ") label.error", form).remove();
                    $(".body:eq(" + newIndex + ") .error", form).removeClass("error")
                }
                form.validate().settings.ignore = ":disabled,:hidden";
                return form.valid()
            }, onStepChanged: function (event, currentIndex, priorIndex) {
                if (currentIndex === 2 && Number($("#age").val()) >= 18) {
                    $(this).steps("next")
                }
                if (currentIndex === 2 && priorIndex === 3) {
                    $(this).steps("previous")
                }
            }, onFinishing: function (event, currentIndex) {
                var form = $(this);
                form.validate().settings.ignore = ":disabled";
                return form.valid()
            }, onFinished: function (event, currentIndex) {
                var form = $(this);
                form.submit()
            }
        }).validate({
            errorPlacement: function (error, element) {
                element.before(error)
            }, rules: {confirm: {equalTo: "#password"}}
        })
        loadAllCustomers();

        $("#saveBasicInfo").click(function () {
            $.post("/projectController/addProject",{
                "projectName":$("#projectName").val(),
                "version":$("#projectVersion").val(),
                "customerId":chose_get_value('.chosen-select')
            },function (data) {
                if(data.success){
                    $("#saveBasicInfo").hide();
                    $("#projectId").val(data.bean);
                    parent.toastr.success("新建项目成功");
                }else{
                    parent.toastr.error("新建项目失败");
                }

            });
        });

        $("#updateDescription").click(function () {
            var projectId=$("#projectId").val();
            if(projectId==null||projectId==''){
                parent.toastr.error("项目基础信息未提交！");
            }else{
                editor.sync();
                $.post("/projectController/updateDescription",{
                    "id":projectId,
                    "description":$("#projectDescription").val()
                },function (data) {
                    if(data.success){
                        $("#updateDescription").hide();
                        $("#projectId").val(data.bean);
                        parent.toastr.success("项目描述成功");
                    }else{
                        parent.toastr.error("服务器发生错误，描述失败");
                    }

                });
            }
        });
    });
    var editor;
    var editor1;
    var options = {
        cssPath: '/static/kindeditor-4.1.10/plugins/code/prettify.css',
        filterMode: true,
        uploadJson: '<%=basePath%>kindeditor/file-upload.do?sessionid=1',
        fileManagerJson: '<%=basePath%>kindeditor/file-manager.do',
        allowFileManager: true,
        allowImageUpload: true,
        width: '80%',
        height: 260,
        items: [
            'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
            'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
            'insertunorderedlist', '|', 'emoticons', 'image', 'link']
    };
    KindEditor
            .ready(function (K) {
                editor = K.create('#projectDescription', options);
                editor1 = K.editor({
                    filterMode: true,
                    allowFileManager: false,
                    cssPath: '/static/kindeditor-4.1.10/plugins/code/prettify.css',
                    uploadJson: '<%=basePath%>kindeditor/file-upload.do?sessionid=1',
                    fileManagerJson: '<%=basePath%>kindeditor/file-manager.do',
                    allowImageUpload: true
                });
                K("#uploadFile").click(function () {
                    editor1.loadPlugin('insertfile', function () {
                        editor1.plugin.fileDialog({
                            clickFn: function (url, title) {
                                console.log(title);
                                console.log(url)
                                editor1.hideDialog();
                            }
                        });
                    });
                });
            });
    function loadAllCustomers() {
        $.post("/customerController/getAllCustomers", null, function (data) {
            if (data != null && data.length > 0) {
                var str = ''
                for (var i = 0; i < data.length; i++) {
                    str += '<option value="' + data[i].id + '" hassubinfo="true">' + data[i].customerName + '</option>';
                }
                $(".chosen-select").append(str);
                $(".chosen-select").chosen();
            }
        })


    }
    //单选select value获取
    function chose_get_value(select){
        return $(select).val();
    }
</script>
</body>
</html>

