<%--
  Created by IntelliJ IDEA.
  User: dxkj
  Date: 2016/11/12
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="/static/css/animate.min.css" rel="stylesheet">
    <link href="/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <style>
        #tab-1 table tr td .label {
            cursor: pointer;
        }
        #showDescription img{
           max-width:100%;
        }
    </style>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-sm-8">
            <div class="ibox">
                <div class="ibox-content">
                    <span class="text-muted small pull-right">最后更新：<i class="fa fa-clock-o"></i> 2015-09-01 12:00</span><br/>

                    <div class="hr-line-dashed"></div>
                    <div class="input-group col-lg-12">
                        <input type="text" placeholder="查找客户" class="input form-control " id="testDwr">
                        <span class="input-group-btn">
                                        <button type="button" class="btn btn btn-primary"> <i class="fa fa-search"></i> 搜索</button>
                             <button type="button" class="btn btn btn-warning" id="addNewCustomer"> <i
                                     class="fa fa-cloud"></i> 新增客户</button>
                        </span>

                    </div>
                    <div class="clients-list">
                        <ul class="nav nav-tabs">
                            <span class="pull-right small text-muted">1406 个客户</span>
                            <li class="active"><a data-toggle="tab" href="#tab-1"><i class="fa fa-user"></i> 联系人</a>
                            </li>
                            <li class=""><a data-toggle="tab" href="#tab-2"><i class="fa fa-briefcase"></i> 公司</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div id="tab-1" class="tab-pane active">
                                <div class="full-height-scroll">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-hover">
                                            <tbody>

                                            <c:forEach var="customer" items="${allCustomers}" step="1" varStatus="s">
                                                <tr title="<c:out value="${customer.id}"></c:out>">
                                                    <td class="client-avatar"><img alt="image"
                                                                                   src="<c:out value="${customer.avatar}"></c:out>">
                                                    </td>
                                                    <td><a data-toggle="tab" href="#contact-1" class="client-link">
                                                        <c:out value="${customer.customerName}"></c:out></a>
                                                    </td>
                                                    <td><c:out value="${customer.companyName}"></c:out></td>
                                                    <td class="contact-type"><i class="fa fa-envelope"> </i>
                                                    </td>
                                                    <td>
                                                        <c:out value="${customer.email}"></c:out>
                                                    </td>
                                                    <td class="client-status">
                                                        <c:if test="${customer.status==0}">
                                                            <span class="label label-warning"
                                                                  title="<c:out value="${customer.id}"></c:out>"
                                                                  id="customerStatus_<c:out value="${customer.id}"></c:out>">等待验证</span>
                                                        </c:if>
                                                        <c:if test="${customer.status==1}">
                                                            <span class="label label-primary"
                                                                  title="<c:out value="${customer.id}"></c:out>"
                                                                  id="customerStatus_<c:out value="${customer.id}"></c:out>">已验证</span>
                                                        </c:if>
                                                        <c:if test="${customer.status==-1}">
                                                            <span class="label label-danger"
                                                                  title="<c:out value="${customer.id}"></c:out>"
                                                                  id="customerStatus_<c:out value="${customer.id}"></c:out>">已删除</span>
                                                        </c:if>
                                                    </td>

                                                    <td style="width: 30px">
                                                        <span class="label label-default editCustomer"
                                                              title="<c:out value="${customer.id}"></c:out>"><i
                                                                class="fa fa-pencil"></i></span>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div id="tab-2" class="tab-pane">
                                <div class="full-height-scroll">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-hover">
                                            <tbody>
                                            <tr>
                                                <td><a data-toggle="tab" href="#company-1" class="client-link">瑞安市海诚机械有限公司</a>
                                                </td>
                                                <td>广州</td>
                                                <td><i class="fa fa-flag"></i> 中国</td>
                                                <td class="client-status"><span class="label label-primary">已验证</span>
                                                </td>
                                            </tr>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="modal inmodal" id="myModal2" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content animated fadeInLeftBig">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                                class="sr-only">Close</span></button>
                        <h4 class="modal-title">新建客户</h4>
                        <small class="font-bold">编辑客户信息。</small>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal m-t" id="commentForm" action="/customerController/addCustomer"
                              method="post">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">姓名：</label>
                                        <div class="col-sm-8">
                                            <input id="cname" name="customerName" minlength="2" type="text"
                                                   class="form-control"
                                                   required="" aria-required="true">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">单位：</label>
                                        <div class="col-sm-8">
                                            <input id="companyName" name="companyName" minlength="2" type="text"
                                                   class="form-control"
                                                   required="" aria-required="true">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">电话：</label>
                                        <div class="col-sm-8">
                                            <input id="phone" type="text" class="form-control" name="phoneNo"
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
                                                 id="customerAvatar"
                                                 src="/static/img/avatar.png">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">备注：</label>
                                        <div class="col-sm-11">
                                            <input id="cremark" type="text" class="form-control" name="remark">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">简介：</label>
                                        <div class="col-sm-11">
                                    <textarea id="ccomment" name="description" class="form-control" required=""
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


        <div class="modal inmodal" id="myModal8" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content animated fadeInLeftBig">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                                class="sr-only">Close</span></button>
                        <h4 class="modal-title">修改客户</h4>
                        <small class="font-bold">编辑客户信息。</small>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal m-t" id="editCommentForm"
                              action="/customerController/updateCustomer" method="post">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input type="hidden" name="id" id="editId">
                                        <label class="col-sm-2 control-label">姓名：</label>
                                        <div class="col-sm-8">
                                            <input id="editCname" name="customerName" minlength="2" type="text"
                                                   class="form-control"
                                                   required="" aria-required="true">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">单位：</label>
                                        <div class="col-sm-8">
                                            <input id="editCompanyName" name="companyName" minlength="2" type="text"
                                                   class="form-control"
                                                   required="" aria-required="true">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">电话：</label>
                                        <div class="col-sm-8">
                                            <input id="editPhone" type="text" class="form-control" name="phoneNo"
                                                   required=""
                                                   aria-required="true">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">邮箱：</label>
                                        <div class="col-sm-8">
                                            <input id="editCemail" type="email" class="form-control" name="email"
                                                   required=""
                                                   aria-required="true">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input type="hidden" name="avatar" id="editHideAvatar">
                                        <label class="col-sm-2 control-label">头像：</label>
                                        <div class="text-center col-sm-8" style="width: 125px">
                                            <img alt="image" class="img-circle-4 m-t-xs img-responsive"
                                                 id="editCustomerAvatar"
                                                 src="/static/img/a2.jpg">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">备注：</label>
                                        <div class="col-sm-11">
                                            <input id="editCremark" type="text" class="form-control" name="remark">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">简介：</label>
                                        <div class="col-sm-11">
                                    <textarea id="editCcomment" name="description" class="form-control" required=""
                                              aria-required="true"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="editFormSub">保存</button>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal inmodal fade" id="myModal6" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                                class="sr-only">Close</span></button>
                        <h4 class="modal-title">修改客户状态</h4>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" id="customerId">
                        <select class="form-control m-b" name="account" id="newStatus">
                            <option value="1">已验证</option>
                            <option value="-1">已删除</option>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="updateCustomerStatus">保存</button>
                    </div>
                </div>
            </div>
        </div>


        <div class="col-sm-4">
            <div class="ibox ">

                <div class="ibox-content">
                    <div class="tab-content">
                        <div id="contact-1" class="tab-pane active">
                            <div class="row m-b-lg">
                                <div class="col-lg-4 text-center">
                                    <h2 id="showName">张有为</h2>

                                    <div class="m-b-sm">
                                        <img alt="image" class="img-circle" src="/static/img/a2.jpg"
                                             style="width: 62px ;height: 62px" id="showAvatar">
                                    </div>
                                </div>
                                <div class="col-lg-8">
                                    <h3>
                                        个人简介
                                    </h3>
                                    <div id="showDescription" class="row col-lg-12"></div>
                                    <br>
                                    <button type="button" class="btn btn-primary btn-sm btn-block"><i
                                            class="fa fa-envelope"></i> 发送消息
                                    </button>
                                </div>
                            </div>
                            <div class="client-detail">
                                <div class="full-height-scroll">

                                    <%--      <strong>当前动态</strong>

                                        <ul class="list-group clear-list">
                                             <li class="list-group-item fist-item">
                                                 <span class="pull-right"> 09:00</span> 请联系我
                                             </li>
                                             <li class="list-group-item">
                                                 <span class="pull-right"> 10:16 </span> 签合同
                                             </li>
                                             <li class="list-group-item">
                                                 <span class="pull-right"> 08:22 </span> 开新公司
                                             </li>
                                             <li class="list-group-item">
                                                 <span class="pull-right"> 11:06 </span> 打电话给李四
                                             </li>
                                         </ul>--%>
                                    <strong>备注</strong>
                                    <p id="showRemark">
                                    </p>
                                    <hr/>
                                    <strong>时间轴</strong>
                                    <div id="vertical-timeline" class="vertical-container light-timeline">
                                        <div class="vertical-timeline-block">
                                            <div class="vertical-timeline-icon navy-bg">
                                                <i class="fa fa-briefcase"></i>
                                            </div>

                                            <div class="vertical-timeline-content">
                                                <h2>会议</h2>
                                                <p>上一年的销售业绩发布会。总结产品营销和销售趋势及销售的现状。
                                                </p>
                                                <a href="#" class="btn btn-sm btn-primary"> 更多信息</a>
                                                <span class="vertical-date">
                                        今天 <br>
                                        <small>2月3日</small>
                                    </span>
                                            </div>
                                        </div>

                                        <div class="vertical-timeline-block">
                                            <div class="vertical-timeline-icon blue-bg">
                                                <i class="fa fa-file-text"></i>
                                            </div>

                                            <div class="vertical-timeline-content">
                                                <h2>给张三发送文档</h2>
                                                <p>发送上年度《销售业绩报告》</p>
                                                <a href="#" class="btn btn-sm btn-success"> 下载文档 </a>
                                                <span class="vertical-date">
                                        今天 <br>
                                        <small>2月3日</small>
                                    </span>
                                            </div>
                                        </div>

                                        <div class="vertical-timeline-block">
                                            <div class="vertical-timeline-icon lazur-bg">
                                                <i class="fa fa-coffee"></i>
                                            </div>

                                            <div class="vertical-timeline-content">
                                                <h2>喝咖啡休息</h2>
                                                <p>喝咖啡啦，啦啦啦~~</p>
                                                <a href="#" class="btn btn-sm btn-info">更多</a>
                                                <span class="vertical-date"> 昨天 <br><small>2月2日</small></span>
                                            </div>
                                        </div>

                                        <div class="vertical-timeline-block">
                                            <div class="vertical-timeline-icon yellow-bg">
                                                <i class="fa fa-phone"></i>
                                            </div>

                                            <div class="vertical-timeline-content">
                                                <h2>给李四打电话</h2>
                                                <p>给李四打电话分配本月工作任务</p>
                                                <span class="vertical-date">昨天 <br><small>2月2日</small></span>
                                            </div>
                                        </div>

                                        <div class="vertical-timeline-block">
                                            <div class="vertical-timeline-icon lazur-bg">
                                                <i class="fa fa-user-md"></i>
                                            </div>

                                            <div class="vertical-timeline-content">
                                                <h2>公司年会</h2>
                                                <p>发年终奖啦，啦啦啦~~</p>
                                                <span class="vertical-date">前天 <br><small>2月1日</small></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/static/js/jquery.min.js?v=2.1.4"></script>
<script src="/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/static/js/content.min.js?v=1.0.0"></script>
<script src="/static/js/plugins/validate/jquery.validate.min.js"></script>
<script src="/static/js/plugins/validate/messages_zh.min.js"></script>
<script type="text/javascript"
        src="/static/kindeditor-4.1.10/kindeditor.js"></script>
<script type="text/javascript"
        src="/static/kindeditor-4.1.10/lang/zh_CN.js"></script>
<script type="text/javascript" src="../rs/engine.js"></script>
<script type="text/javascript" src="../rs/util.js"></script>
<script type="text/javascript" src="../rs/interface/svDevice.js"></script>
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
        setCustomerInfo(12);
        $(".full-height-scroll").slimScroll({height: "100%"});
        $("#commentForm").validate();
        $("#editCommentForm").validate();
        $("#formSub").click(function () {
            editor.sync();
            var ava = $("#hideAvatar").val();
            if (ava == null || ava == '') {
                $("#hideAvatar").val('/static/img/avatar.png');
            }
            $("#commentForm").submit();
        });
        $("#editFormSub").click(function () {
            editor1.sync();
            var ava = $("#editHideAvatar").val();
            if (ava == null || ava == '') {
                $("#editHideAvatar").val('/static/img/avatar.png');
            }
            $("#editCommentForm").submit();
        });


        $(".client-status span").click(function () {
            $("#customerId").val($(this).attr("title"));
            $("#myModal6").modal("show");
        });
        $("#updateCustomerStatus").click(function () {
            console.log($("#customerId").val());
            console.log($("#newStatus option:selected").val());
            svDevice.updateCustomerStatus($("#customerId").val(),$("#newStatus option:selected").val());
            $("#myModal6").modal("hide");
        });
        $(".deleteCustomer").click(function () {
        });
        $("#tab-1 table tr").click(function () {
            setCustomerInfo($(this).attr("title"));
        });
    });
    function setCustomerInfo(id) {
        $.post("/customerController/findCustomer/" + id, null, function (data) {
            console.log(data);
            if (data != null) {
                $("#showName").text(data.customerName);
                $("#showDescription").empty();
                $("#showDescription").append(data.description);
                $("#showRemark").text(data.remark);
                $("#showAvatar").attr("src", data.avatar);
            }
        })
    }
    KindEditor
            .ready(function (K) {
                $('#myModal2').on('hidden.bs.modal', function () {
                    // 关闭Dialog前移除编辑器
                    KindEditor.remove('#ccomment');
                });
                $("#addNewCustomer").click(function () {
                    $('#myModal2').modal("show");
                    editor = K.create('#ccomment', options);
                });

                K('#customerAvatar').click(
                        function () {
                            editor.loadPlugin('image', function () {
                                editor.plugin.imageDialog({
                                    imageUrl: "img/",
                                    clickFn: function (url, title, width,
                                                       height, border, align) {
                                        K('#customerAvatar').attr("src", url);
                                        K("#hideAvatar").val(url);
                                        editor.hideDialog();
                                    }
                                });
                            });
                        });
                K('#editCustomerAvatar').click(
                        function () {
                            editor1.loadPlugin('image', function () {
                                editor1.plugin.imageDialog({
                                    imageUrl: "img/",
                                    clickFn: function (url, title, width,
                                                       height, border, align) {
                                        K('#editCustomerAvatar').attr("src", url);
                                        K("#editHideAvatar").val(url);
                                        editor1.hideDialog();
                                    }
                                });
                            });
                        });

                $(".editCustomer").click(function () {
                    editor1 = K.create('#editCcomment', options);
                    $.post("/customerController/findCustomer/" + $(this).attr("title"), null, function (data) {
                        console.log(data);
                        if (data != null) {
                            $("#editId").val(data.id);
                            $("#editCname").val(data.customerName);
                            $("#editCompanyName").val(data.companyName);
                            $("#editPhone").val(data.phoneNo);
                            $("#editCemail").val(data.email);
                            $("#editHideAvatar").val(data.avatar);
                            $("#editCremark").val(data.remark);
                            $("#editCustomerAvatar").attr("src", data.avatar);
                            editor1.html(data.description);
                        }
                    })
                    $('#myModal8').modal("show");
                });
                $('#myModal8').on('hidden.bs.modal', function () {
                    // 关闭Dialog前移除编辑器
                    KindEditor.remove('#editCcomment');
                });

            });

</script>
</body>
</html>

