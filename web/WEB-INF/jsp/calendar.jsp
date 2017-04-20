<%--
  Created by IntelliJ IDEA.
  User: dxkj
  Date: 2016/11/3
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="/static/css/plugins/colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
    <link href="/static/css/plugins/iCheck/custom.css" rel="stylesheet">

    <link href="/static/css/plugins/fullcalendar/fullcalendar.css" rel="stylesheet">
    <link href="/static/css/plugins/fullcalendar/fullcalendar.print.css" rel="stylesheet">

    <link href="/static/css/animate.min.css" rel="stylesheet">
    <link href="/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="/static/css/plugins/toastr/toastr.min.css" rel="stylesheet">

    <link href="/static/css/plugins/clockpicker/clockpicker.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row animated fadeInDown">
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>拖拽事件</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="calendar.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="calendar.html#">选项1</a>
                            </li>
                            <li><a href="calendar.html#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <div id='external-events'>
                        <c:forEach var="event" items="${allCalendarEvents}" step="1" varStatus="s">
                            <div class='external-event navy-bg' title='<c:out value="${event.color}"></c:out>' style='background-color:<c:out value="${event.color}"></c:out>' id='<c:out value="${event.id}"></c:out>'>
                                <c:out value="${event.description}"></c:out></div>
                        </c:forEach>
                    </div>
                    <p class="m-t">
                        <input type='checkbox' id='drop-remove' class="i-checks" checked/>
                        <label for='drop-remove'>移动后删除</label>
                    </p>
                </div>
                <div class="ibox-content">
                    <a class="btn btn-primary btn-rounded btn-block" href="javascript:void(0)" data-toggle="modal"
                       data-target="#myModal2">
                        <i class="fa fa-info-circle"></i>
                        新增事件
                    </a>
                </div>
                <div class="modal inmodal" id="myModal2" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content animated bounceInLeft">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span
                                        aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title">新建事件</h4>
                                <small class="font-bold">事件的长度建议不要超过10个字符。</small>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal" id="calendarForm">
                                    <div class="form-group">
                                        <input class="form-control" placeholder="事件描述" type="text" id="addCalendarEvent"
                                               name="description">
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group colorpicker-component demo demo-auto">
                                            <span class="input-group-addon"><i></i></span>
                                            <input type="text" name="color" class="form-control" readonly/>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-primary" id="saveCalendarEvent">保存</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-9">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>日历</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="calendar.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="calendar.html#">选项1</a>
                            </li>
                            <li><a href="calendar.html#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <div id="calendar"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="/static/js/jquery.min.js?v=2.1.4"></script>
<script src="/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/static/js/content.min.js?v=1.0.0"></script>
<script src="/static/js/jquery-ui.custom.min.js"></script>
<script src="/static/js/plugins/iCheck/icheck.min.js"></script>
<script src="/static/js/plugins/fullcalendar/fullcalendar.min.js"></script>
<script src="/static/js/plugins/toastr/toastr.min.js"></script>
<script src="/static/js/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="/static/js/plugins/clockpicker/clockpicker.js"></script>
<script src="/static/js/plugins/layer/layer.min.js"></script>
<script>
    $(document).ready(function () {
//
//        //示范一个公告层
//        layer.open({
//            type: 1
//            ,title: false //不显示标题栏
//            ,closeBtn: false
//            ,area: '300px;'
//            ,shade: 0.8
//            ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
//            ,resize: false
//            ,btn: ['收到', '取消']
//            ,btnAlign: 'c'
//            ,moveType: 1 //拖拽模式，0或者1
//            ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">我们此后的征途是星辰大海 ^_^</div>'
//            ,success: function(layero){
//                var btn = layero.find('.layui-layer-btn');
//                btn.find('.layui-layer-btn0').attr({
//                    href: 'http://www.layui.com/'
//                    ,target: '_blank'
//                });
//            }
//        });



        $(".demo-auto").colorpicker();
        toastr.options = {
            "closeButton": true,
            "debug": false,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "onclick": null,
            "showDuration": "5000",
            "hideDuration": "1000",
            "timeOut": "7000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
        $("#saveCalendarEvent").click(function () {
            var eventContent = $("#addCalendarEvent").val();
            if (eventContent == null || eventContent == "") {
                $("#addCalendarEvent").parent().addClass("has-error");
                return;
            }
            $.post("/calendarController/addEvent", $("#calendarForm").serialize(), function (data) {
                if (data.success) {
                    reloadEvents();
                } else {
                    toastr.error("文章发表失败");
                }
                $("#myModal2").modal("hide");
            });
            // console.log($("#calendar").fullCalendar("clientEvents",false));
        });
        $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",});
        $("#external-events div.external-event").each(function () {
            var d = {title: $.trim($(this).text())};
            var id = {id: $.trim($(this).attr("id")),color:$.trim($(this).attr("title"))};
            $(this).data("eventObject", d);
            $(this).data("eventObjectId", id);
            $(this).draggable({zIndex: 999, revert: true, revertDuration: 0})
        });

        var JSONstr = <c:out value="${calendarJSON.eventJSON}" escapeXml="false"></c:out>
                console.log(JSONstr);
        if(JSONstr==undefined||JSONstr==null||JSONstr==''){
            var obj=null;
        }else{
            var obj = JSONstr;
        }

        $("#calendar").fullCalendar({
            header: {left: "prev,next", center: "title", right: "month,agendaWeek,agendaDay"},
            editable: true,
            droppable: true,
            drop: function (g, h) {
                var f = $(this).data("eventObject");
                var id = $(this).data("eventObjectId");
                var d = $.extend({}, f);
                console.log(id);
                d.start = g;
                d.allDay = h;
                d.color=id.color;
                $("#calendar").fullCalendar("renderEvent", d, true);
                if ($("#drop-remove").is(":checked")) {
                    deleteEventFromDataBase(id.id);
                    $(this).remove();
                }
                updateUserEvent();
            },
            events: obj,
            editable: true,
            eventDrop: function (event, delta, revertFunc) {
                updateUserEvent();
            },
            eventClick:function(event, jsEvent, view){
                layer.confirm('确定删除这条事件吗？', {
                    btn: ['确定','取消'], //按钮
                    shade: false //不显示遮罩
                }, function(){
                    $("#calendar").fullCalendar("removeEvents",event._id);
                    updateUserEvent();
                    layer.msg('已删除', {icon: 1});
                }, function(){
                });

            }
        })
    });
    function reloadEvents() {
        $.post("/calendarController/reloadEvents", null, function (data) {
            $("#external-events").empty();
            var str = '';
            for (var i = 0; i < data.length; i++) {
                str += ' <div class="external-event navy-bg" title="'+data[i].color+'" style="background-color: '+data[i].color+'" id="' + data[i].id + '">' + data[i].description + '</div>';
            }
            $("#external-events").append(str);
            $("#external-events div.external-event").each(function () {
                var d = {title: $.trim($(this).text())};
                var id = {id: $.trim($(this).attr("id")),color:$.trim($(this).attr("title"))};
                $(this).data("eventObject", d);
                $(this).data("eventObjectId", id);
                $(this).draggable({zIndex: 999, revert: true, revertDuration: 0})
            });
        });
    }
    function deleteEventFromDataBase(id) {
        $.post("/calendarController/deleteEvent/" + id, null, function (data) {
        });
    }
    function logTheEvents() {
        var arr = $("#calendar").fullCalendar("clientEvents", false);
        var str = '[';
        for (var i = 0; i < arr.length; i++) {
            str += "{";
            if (arr[i].allDay == null || arr[i].allDay == "null") {
                arr[i].allDay = false;
            }
            if (arr[i].id == undefined) {
            } else {
                str += '"id":' + arr[i].id + ',';
            }
            if (arr[i].color == null || arr[i].color == "null") {
            }else{
                str += '"color":"' + arr[i].color + '",';
            }

            str += '"title":"' + arr[i].title + '","start":"' + arr[i].start + '","allDay":' + arr[i].allDay;
            if (arr[i].end != null && arr[i].end != 'null') {
                str += ',"end":"' + arr[i].end + '"';
            }
            str += '},';
        }
        str = str.substring(0, str.length - 1);
        str += ']';
        console.log(str.trim());
        return str.trim();
    }
    function updateUserEvent() {
        $.post("/calendarController/updateEvent", {
            eventJSON: logTheEvents()
        }, function (data) {
            if (data.success) {
                toastr.info(data.message)
            } else {
                toastr.warning(data.message)
            }
        });
    }
</script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>


<!-- Mirrored from www.zi-han.net/theme/hplus/calendar.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:19:45 GMT -->
</html>

