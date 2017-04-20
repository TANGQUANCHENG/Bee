<%--
  Created by IntelliJ IDEA.
  User: dxkj
  Date: 2016/10/27
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>H+ 后台主题UI框架 - 联系人</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    <link href="/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

    <link href="/static/css/animate.min.css" rel="stylesheet">
    <link href="/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
<style>
    .editUser{
        width: 133px;
        height: 133px;
    }
</style>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox-content m-b-sm border-bottom">
        <div class="text-left">
            <button title="Create new cluster" class="btn btn-primary btn-sm " id="toAddUser"><i class="fa fa-plus"></i> <span class="bold">新增用户</span>
            </button>
        </div>
    </div>
    <div class="row">
        <c:forEach var="user" items="${allUsers}"  step="1" varStatus="s">
            <div class="col-sm-4">
                <div class="contact-box">
                        <div class="col-sm-4">
                            <div class="text-center">
                                <img alt="image" class="img-circle m-t-xs img-responsive editUser"
                                     title="<c:out value="${user.user_id}"></c:out>"
                                     src="<c:out value="${user.avatar}"></c:out>">
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <h3><strong><c:out value="${user.userName}"></c:out></strong></h3>
                            <p><i class="fa fa-map-marker"></i> <c:out value="${user.province}"></c:out>·<c:out value="${user.city}"></c:out></p>
                            <address>
                                <strong>Baidu, Inc.</strong><br>
                                E-mail:<c:out value="${user.email}"></c:out><br>
                                当前状态:<span class="label label-primary">在线</span><br>
                                <abbr title="Phone">Tel:</abbr> <c:out value="${user.phoneNumber}"></c:out>
                            </address>
                        </div>
                        <div class="clearfix"></div>
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="modal inmodal" id="myModal2" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content animated fadeInLeftBig">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                            class="sr-only">Close</span></button>
                    <h4 class="modal-title">编辑用户</h4>
                    <small class="font-bold">编辑用户信息。</small>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal m-t" id="commentForm" action="/userinfo/updateUser"
                          method="post">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">姓名：</label>
                                    <div class="col-sm-8">
                                        <input type="hidden" name="user_id" id="userId">
                                        <input id="cname" name="userName" minlength="2" type="text"
                                               class="form-control"
                                               required="" aria-required="true">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">密码：</label>
                                    <div class="col-sm-8">
                                        <input id="userPassword" name="password" minlength="2" type="text"
                                               class="form-control"
                                               required="" aria-required="true">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">电话：</label>
                                    <div class="col-sm-8">
                                        <input id="phone" type="text" class="form-control" name="phoneNumber"
                                               required=""
                                               aria-required="true">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">邮箱：</label>
                                    <div class="col-sm-8">
                                        <input id="cemail" type="email" class="form-control" name="email"
                                               required=""
                                               aria-required="true">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <input type="hidden" name="avatar" id="hideAvatar">
                                    <label class="col-sm-2 control-label">头像：</label>
                                    <div class="text-center col-sm-8" style="width: 125px">
                                        <img alt="image" class="img-circle-4 m-t-xs img-responsive"
                                             id="userAvatar"
                                             src="/static/img/avatar_big.png">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">省：</label>
                                    <div class="col-sm-2">
                                        <input id="userProvince" name="province" class="form-control" />
                                    </div>
                                    <label class="col-sm-1 control-label">市：</label>
                                    <div class="col-sm-2">
                                        <input id="userCity" name="city" class="form-control" />
                                    </div>
                                    <label class="col-sm-1 control-label">地址：</label>
                                    <div class="col-sm-5">
                                        <input id="userAddress" type="text" class="form-control" name="address">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">简介：</label>
                                    <div class="col-sm-11">
                                    <textarea id="ccomment" name="remark" class="form-control" required=""
                                              aria-required="true"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="formSub">保存</button>
                </div>
            </div>
        </div>
    </div>
<%--新增用户--%>
    <div class="modal inmodal" id="myModal5" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content animated fadeInLeftBig">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                            class="sr-only">Close</span></button>
                    <h4 class="modal-title">新增用户</h4>
                    <small class="font-bold">编辑用户信息。</small>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal m-t" id="addForm" action="/userinfo/addUser"
                          method="post">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">姓名：</label>
                                    <div class="col-sm-8">
                                        <input id="addName" name="userName" minlength="2" type="text"
                                               class="form-control"
                                               required="" aria-required="true">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">密码：</label>
                                    <div class="col-sm-8">
                                        <input id="addPassword" name="password" minlength="2" type="text"
                                               class="form-control"
                                               required="" aria-required="true">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">电话：</label>
                                    <div class="col-sm-8">
                                        <input id="addPhone" type="text" class="form-control" name="phoneNumber"
                                               required=""
                                               aria-required="true">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">邮箱：</label>
                                    <div class="col-sm-8">
                                        <input id="addemail" type="email" class="form-control" name="email"
                                               required=""
                                               aria-required="true">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <input type="hidden" name="avatar" id="addHideAvatar">
                                    <label class="col-sm-2 control-label">头像：</label>
                                    <div class="text-center col-sm-8" style="width: 125px">
                                        <img alt="image" class="img-circle-4 m-t-xs img-responsive"
                                             id="addUserAvatar"
                                             src="/static/img/avatar_big.png">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">省：</label>
                                    <div class="col-sm-2">
                                        <%--<select id="addUserProvince" name="province" class="form-control" ></select>--%>
                                            <input id="addUserProvince" name="province" class="form-control" />
                                    </div>
                                    <label class="col-sm-1 control-label">市：</label>
                                    <div class="col-sm-2">
                                        <%--<select id="addUserCity" name="province" class="form-control" ></select>--%>
                                            <input id="addUserCity" name="city" class="form-control"/>
                                    </div>
                                    <label class="col-sm-1 control-label">地址：</label>
                                    <div class="col-sm-5">
                                        <input id="addUserAddress" type="text" class="form-control" name="address">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">简介：</label>
                                    <div class="col-sm-11">
                                    <textarea id="addCcomment" name="remark" class="form-control" required=""
                                              aria-required="true"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="addSub">保存</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/static/js/jquery.min.js?v=2.1.4"></script>
<script src="/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/static/js/content.min.js?v=1.0.0"></script>
<script src="/static/js/plugins/validate/jquery.validate.min.js"></script>
<script src="/static/js/province.js"></script>
<script type="text/javascript"
        src="/static/kindeditor-4.1.10/kindeditor.js"></script>
<script type="text/javascript"
        src="/static/kindeditor-4.1.10/lang/zh_CN.js"></script>
<script>

    var editor;
    var editor1;
    var options = {
        cssPath: '/static/kindeditor-4.1.10/plugins/code/prettify.css',
        filterMode: true,
        allowFileManager: true,
        uploadJson: '<%=basePath%>kindeditor/file-upload.do?sessionid=1',
        fileManagerJson: '<%=basePath%>kindeditor/file-manager.do',
        allowFileManager: true,
        allowImageUpload: true,
        width: '100%',
        items: [
            'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
            'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
            'insertunorderedlist', '|', 'emoticons', 'image', 'link']
    };
    $(document).ready(function () {
        $("#addForm").validate();
        $("#commentForm").validate();
        _init_area();
        $(".contact-box").each(function () {
            animationHover(this, "pulse")
        })

        $("#formSub").click(function () {
            editor.sync();
            var ava = $("#editHideAvatar").val();
            if (ava == null || ava == '') {
                $("#editHideAvatar").val('/static/img/avatar.png');
            }
            $("#commentForm").submit();
        });
        $("#addSub").click(function () {
            editor1.sync();
            var ava = $("#addHideAvatar").val();
            if (ava == null || ava == '') {
                $("#addHideAvatar").val('/static/img/avatar.png');
            }
            $("#addForm").submit();
        });

    });
    KindEditor
            .ready(function (K) {

                $(".editUser").click(function () {
                    var userId =$(this).attr("title");
                    $.post("/userinfo/"+userId,null,function (data) {
                        console.log(data);
                        if(data!=null){
                            $("#userId").val(data.user_id);
                            $("#cname").val(data.userName);
                            $("#userPassword").val(data.password);
                            $("#phone").val(data.phoneNumber);
                            $("#cemail").val(data.email);
                            $("#hideAvatar").val(data.avatar);
                            if(data.avatar==undefined||data.avatar==null||data.avatar.length<2){
                                $("#userAvatar").attr("src","/static/img/avatar_big.png");
                            }else{
                                $("#userAvatar").attr("src",data.avatar);
                            }
                            $("#userProvince").val(data.province);
                            $("#userCity").val(data.city);
                            $("#userAddress").val(data.address);
                            editor.html(data.remark);
                        }
                    });

                    $("#myModal2").modal("show");
                    editor = K.create('#ccomment', options);
                });


                K('#userAvatar').click(
                        function () {
                            editor.loadPlugin('image', function () {
                                editor.plugin.imageDialog({
                                    imageUrl: "img/",
                                    clickFn: function (url, title, width,
                                                       height, border, align) {
                                        K('#userAvatar').attr("src", url);
                                        K("#hideAvatar").val(url);
                                        editor.hideDialog();
                                    }
                                });
                            });
                        });


                $("#toAddUser").click(function () {
                    $("#myModal5").modal("show");
                    editor1 = K.create('#addCcomment', options);
                });

                K('#addUserAvatar').click(
                        function () {
                            editor1.loadPlugin('image', function () {
                                editor1.plugin.imageDialog({
                                    imageUrl: "img/",
                                    clickFn: function (url, title, width,
                                                       height, border, align) {
                                        K('#addUserAvatar').attr("src", url);
                                        K("#addHideAvatar").val(url);
                                        editor1.hideDialog();
                                    }
                                });
                            });
                        });
            });
</script>
</body>
</html>

