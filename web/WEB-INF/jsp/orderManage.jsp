<%--
  Created by IntelliJ IDEA.
  User: dxkj
  Date: 2016/11/25
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>


<!-- Mirrored from www.zi-han.net/theme/hplus/table_bootstrap.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:20:03 GMT -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="/static/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="/static/css/animate.min.css" rel="stylesheet">
    <link href="/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">


</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <!-- Panel Other -->
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>其他</h5>
            <div class="ibox-tools">
                <a class="collapse-link">
                    <i class="fa fa-chevron-up"></i>
                </a>
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-wrench"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#">选项1</a>
                    </li>
                    <li><a href="#">选项2</a>
                    </li>
                </ul>
                <a class="close-link">
                    <i class="fa fa-times"></i>
                </a>
            </div>
        </div>
        <div class="ibox-content">
            <div class="row row-lg">
                <div class="col-sm-12">
                    <!-- Example Events -->
                    <div class="example-wrap">
                        <div class="example">
                            <div class="alert alert-success" id="examplebtTableEventsResult" role="alert">
                                事件结果
                            </div>
                            <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">
                                <button type="button" class="btn  btn-success">
                                    <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                                </button>
                                <button type="button" class="btn  btn-warning">
                                    <i class="glyphicon glyphicon-heart" aria-hidden="true"></i>
                                </button>
                                <button type="button" class="btn  btn-default">
                                    <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                                </button>
                            </div>
                            <table id="exampleTableEvents" data-height="400" data-mobile-responsive="true">
                                <thead>
                                <tr>
                                    <th data-field="state" data-checkbox="true"></th>
                                    <th data-field="operateTime">操作时间</th>
                                    <th data-field="operatorName">操作人</th>
                                    <th data-field="operate_address">IP地址</th>
                                    <th data-field="operate_type">操作类型</th>
                                    <th data-field="operate_commnet">操作内容</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                    <!-- End Example Events -->
                </div>
            </div>
        </div>
    </div>
    <!-- End Panel Other -->
</div>
<script src="/static/js/jquery.min.js?v=2.1.4"></script>
<script src="/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/static/js/content.min.js?v=1.0.0"></script>
<script src="/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="/static/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

<script type="text/javascript" src="../rs/engine.js"></script>
<script type="text/javascript" src="../rs/util.js"></script>
<script type="text/javascript" src="../rs/interface/dataPushDevice.js"></script>
<script>
    $(document).ready(function () {
        $("#exampleTableEvents").bootstrapTable({
            url: "/orderController/getLogs",
            search: !0,
            pagination: !0,
            showRefresh: !0,
            sortable: true,
            sortOrder: "asc",
            clickToSelect: true,
            showToggle: !0,
            pageSize:40,
            height:document.body.clientHeight -230,
            striped:true,
            showColumns: !0,
            iconSize: "outline",
            toolbar: "#exampleTableEventsToolbar",
            icons: {refresh: "glyphicon-repeat", toggle: "glyphicon-list-alt", columns: "glyphicon-list"}

        });

        var e = $("#examplebtTableEventsResult");
        $("#exampleTableEvents").on("all.bs.table", function (e, t, o) {
            console.log("Event:", t, ", data:", o)
        }).on("click-row.bs.table", function () {
            e.text("Event: click-row.bs.table")
        }).on("dbl-click-row.bs.table", function () {
            e.text("Event: dbl-click-row.bs.table")
        }).on("sort.bs.table", function () {
            e.text("Event: sort.bs.table")
        }).on("check.bs.table", function () {
            e.text("Event: check.bs.table")
        }).on("uncheck.bs.table", function () {
            e.text("Event: uncheck.bs.table")
        }).on("check-all.bs.table", function () {
            e.text("Event: check-all.bs.table")
        }).on("uncheck-all.bs.table", function () {
            e.text("Event: uncheck-all.bs.table")
        }).on("load-success.bs.table", function () {
            e.text("Event: load-success.bs.table")
        }).on("load-error.bs.table", function () {
            e.text("Event: load-error.bs.table")
        }).on("column-switch.bs.table", function () {
            e.text("Event: column-switch.bs.table")
        }).on("page-change.bs.table", function () {
            e.text("Event: page-change.bs.table")
        }).on("search.bs.table", function () {
            e.text("Event: search.bs.table")
        })
    })
</script>
</body>
</html>

