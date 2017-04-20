<%--
  Created by IntelliJ IDEA.
  User: dxkj
  Date: 2016/11/15
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <link rel="shortcut icon" href="favicon.ico">
    <link href="/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

    <link href="/static/css/animate.min.css" rel="stylesheet">
    <link href="/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="/static/css/plugins/ionRangeSlider/ion.rangeSlider.css" rel="stylesheet">
    <link href="/static/css/plugins/ionRangeSlider/ion.rangeSlider.skinFlat.css" rel="stylesheet">
    <style>
        .connectList li {
            float: left;
            margin-left: 2px;
        }

        .agile-list li {
            padding: 0;
        }
        #addProjectCrew span{
            background-color: orange;
        }
        #editProjectCrew span{
            background-color: orange;
        }
        #dropManager span{
            background-color: royalblue;
        }
        #editDropManager span{
            background-color: royalblue;
        }
        .sortable-list{
            padding: 6px 0;
        }
    </style>
</head>

<body class="gray-bg">

<div class="wrapper wrapper-content animated fadeInUp">
    <div class="row">
        <div class="col-sm-12">

            <div class="ibox">
                <div class="ibox-title">
                    <h5>所有项目</h5>
                    <div class="ibox-tools">
                        <a href="javascript:void(0)" class="btn btn-primary btn-xs" id="addNewProject">创建新项目</a>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="row m-b-sm m-t-sm">
                        <div class="col-md-1">
                            <button type="button" id="loading-example-btn" class="btn btn-white btn-sm"><i
                                    class="fa fa-refresh"></i> 刷新
                            </button>
                        </div>
                        <div class="col-md-11">
                            <div class="input-group">
                                <input type="text" placeholder="请输入项目名称" class="input-sm form-control"> <span
                                    class="input-group-btn">
                                        <button type="button" class="btn btn-sm btn-primary"> 搜索</button> </span>
                            </div>
                        </div>
                    </div>

                    <div class="project-list">

                        <table class="table table-hoverproject">
                            <tbody>
                            <c:forEach var="project" items="${allProjects}" step="1" varStatus="s">
                                <tr>
                                    <td class="project-status">

                                        <c:if test="${project.status==0}">
                                            <span class="label label-primary">进行中</span>
                                        </c:if>
                                        <c:if test="${project.status==1}">
                                            <span class="label label-danger">已暂停</span>
                                        </c:if>
                                        <c:if test="${project.status==2}">
                                            <span class="label label-default">已终止</span>
                                        </c:if>
                                    </td>
                                    <td class="project-title">
                                        <a href="project_detail.html"><c:out value="${project.projectName}"></c:out></a>
                                        <br/>
                                        <small>创建于 <f:formatDate pattern="yyyy-MM-dd hh:mm:ss"
                                                                 value="${project.createTime}"/></small>
                                    </td>
                                    <td class="project-completion">
                                        <small>当前进度： <c:out value="${project.done}"></c:out>%</small>
                                        <div class="progress progress-mini">

                                            <c:choose>
                                                <c:when test="${project.done >= 80}">
                                                    <div style="width: <c:out value="${project.done}"></c:out>%;"
                                                         class="progress-bar progress-bar-danger"></div>
                                                </c:when>
                                                <c:when test="${project.done >=50&&project.done <80}">
                                                    <div style="width: <c:out value="${project.done}"></c:out>%;"
                                                         class="progress-bar progress-bar-warning"></div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div style="width: <c:out value="${project.done}"></c:out>%;"
                                                         class="progress-bar"></div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </td>
                                    <td class="project-people">
                                        <a href="projects.html"><img alt="image" class="img-circle"
                                                                     src="/static/img/a3.jpg"></a>
                                        <a href="projects.html"><img alt="image" class="img-circle"
                                                                     src="/static/img/a1.jpg"></a>
                                        <a href="projects.html"><img alt="image" class="img-circle"
                                                                     src="/static/img/a2.jpg"></a>
                                        <a href="projects.html"><img alt="image" class="img-circle"
                                                                     src="/static/img/a4.jpg"></a>
                                        <a href="projects.html"><img alt="image" class="img-circle"
                                                                     src="/static/img/a5.jpg"></a>
                                    </td>
                                    <td class="project-actions">
                                        <a href="javascript:void(0)" class="btn btn-white btn-sm projectDetail"
                                           title="<c:out value="${project.id}"></c:out>"><i
                                                class="fa fa-folder"></i>
                                            查看 </a>
                                        <a href="javascript:void(0)" class="btn btn-white btn-sm toEditProject"
                                           title="<c:out value="${project.id}"></c:out>"><i
                                                class="fa fa-pencil"></i>
                                            编辑 </a>
                                    </td>
                                </tr>

                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <div class="modal inmodal" id="myModal8" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content animated fadeInLeftBig">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span
                                            aria-hidden="true">&times;</span><span
                                            class="sr-only">Close</span></button>
                                    <h4 class="modal-title">修改项目</h4>
                                    <small class="font-bold">编辑项目信息。</small>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal m-t" id="editCommentForm"
                                          action="/projectController/updateBasicInfo" method="post">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <input type="hidden" name="id" id="editId">
                                                    <label class="col-sm-2 control-label">名称：</label>
                                                    <div class="col-sm-8">
                                                        <input id="editCname" name="projectName" minlength="2"
                                                               type="text"
                                                               class="form-control"
                                                               required="" aria-required="true">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">版本：</label>
                                                    <div class="col-sm-8">
                                                        <input id="editVersion" name="version" minlength="2"
                                                               type="text"
                                                               class="form-control"
                                                               required="" aria-required="true">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">预算：</label>
                                                    <div class="col-sm-8">
                                                        <div class="input-group m-b">
                                                            <span class="input-group-addon">¥</span>
                                                            <input id="editBudget" name="budget" minlength="2"
                                                                   type="text"
                                                                   class="form-control"
                                                                   required="" aria-required="true">
                                                            <span class="input-group-addon">.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">进度：</label>
                                                    <div class="col-sm-8">
                                                        <div id="slider"></div>
                                                        <input type="hidden" id="hideProjectDone" name="done">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">状态：</label>
                                                    <div class="col-sm-8">
                                                        <select class="form-control m-b" name="status" id="editStatus">
                                                            <option value="0">正常</option>
                                                            <option value="1">暂停</option>
                                                            <option value="2">终止</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group" id="editManager">
                                                    <input type="hidden" name="avatar" id="editHideAvatar">
                                                    <label class="col-sm-3 control-label">管理员：</label>
                                                    <div class="text-center col-sm-9" style="width: 85px">
                                                        <ul class="sortable-list connectList agile-list" id="editDropManager"
                                                            style="height:30px;">
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="form-group project-people">
                                                    <label class="col-sm-3 control-label">组&emsp;员：</label>
                                                    <div class="text-left col-sm-9" id="editProjectCrew">
                                                        <ul class="sortable-list connectList agile-list"
                                                            style="max-height:300px;min-height:50px;overflow: auto ">
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div class="ibox form-group">
                                                    <div class="ibox-content" style="max-height:500px;overflow: auto ">
                                                        <ul class="sortable-list connectList agile-list" id="editAllCrew">
                                                            <li>
                                                                <span class="label label-primary">Tom</span>
                                                            </li>
                                                            <li>
                                                                <span class="label label-primary">Lucy</span>

                                                            </li>
                                                            <li>
                                                                <span class="label label-primary">Jhon</span>
                                                            </li>
                                                            <li>
                                                                <span class="label label-primary">Mark</span>
                                                            </li>
                                                            <li>
                                                                <span class="label label-primary">Todo</span>
                                                            </li>
                                                            <li>
                                                                <span class="label label-primary">Tom</span>
                                                            </li>
                                                            <li>
                                                                <span class="label label-primary">Elizabeth</span>
                                                            </li>
                                                            <li>
                                                                <span class="label label-primary">Niclos</span>
                                                            </li>
                                                            <li>
                                                                <span class="label label-primary">Mark</span>
                                                            </li>
                                                            <li>
                                                                <span class="label label-primary">Todo</span>
                                                            </li>

                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-12">

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


                    <div class="modal inmodal" id="myModal6" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content animated fadeInLeftBig">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span
                                            aria-hidden="true">&times;</span><span
                                            class="sr-only">Close</span></button>
                                    <h4 class="modal-title">创建项目</h4>
                                    <small class="font-bold">编辑项目信息。</small>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" id="addForm">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">名称：</label>
                                                    <div class="col-sm-8">
                                                        <input id="addName" name="projectName" minlength="2"
                                                               type="text"
                                                               class="form-control"
                                                               required="" aria-required="true">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">版本：</label>
                                                    <div class="col-sm-8">
                                                        <input id="addVersion" name="version" minlength="2"
                                                               type="text"
                                                               class="form-control"
                                                               required="" aria-required="true">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">预算：</label>
                                                    <div class="col-sm-8">
                                                        <div class="input-group m-b">
                                                            <span class="input-group-addon">¥</span>
                                                            <input id="addBudget" name="budget" minlength="2"
                                                                   type="text"
                                                                   class="form-control"
                                                                   required="" aria-required="true">
                                                            <span class="input-group-addon">.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">进度：</label>
                                                    <div class="col-sm-8">
                                                        <div id="addSlider"></div>
                                                        <input type="hidden" id="addHideProjectDone" name="done">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">状态：</label>
                                                    <div class="col-sm-8">
                                                        <select class="form-control m-b" name="status" id="addStatus">
                                                            <option value="0">正常</option>
                                                            <option value="1">暂停</option>
                                                            <option value="2">终止</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group" id="addManager">
                                                    <input type="hidden" name="managerId" id="addHideManagerId">
                                                    <label class="col-sm-3 control-label">管理员：</label>
                                                    <div class="text-center col-sm-9" style="width: 85px">
                                                        <ul class="sortable-list connectList agile-list" id="dropManager"
                                                            style="height:30px;">
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="form-group project-people">
                                                    <input type="hidden" name="crews" id="addHideCrews">
                                                    <label class="col-sm-3 control-label">组&emsp;员：</label>
                                                    <div class="text-left col-sm-9" id="addProjectCrew">
                                                        <ul class="sortable-list connectList agile-list"
                                                            style="max-height:300px;min-height:50px;overflow: auto ">
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div class="ibox form-group">
                                                    <div class="ibox-content" style="height:200px;overflow: hidden " id="crewBox">
                                                        <ul class="sortable-list connectList agile-list" id="allCrew">
                                                            <c:forEach var="user" items="${allUsers}" step="1" varStatus="s">
                                                                <li data-field="<c:out value="${user.user_id}"></c:out>">
                                                                    <span class="label label-primary"><c:out value="${user.userName}"></c:out></span>
                                                                </li>
                                                            </c:forEach>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-12">

                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label">简介：</label>
                                                    <div class="col-sm-11">
                                    <textarea id="addCcomment" name="description" class="form-control" required=""
                                              aria-required="true"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                    <button type="button" class="btn btn-primary" id="addFormSub">保存</button>
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
<script src="/static/js/content.min.js?v=1.0.0"></script>
<script src="/static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/static/js/conttab_child.js"></script>
<script src="/static/js/jquery-ui-1.10.4.min.js"></script>
<script src="/static/js/plugins/ionRangeSlider/ion.rangeSlider.min.js"></script>
<script type="text/javascript"
        src="/static/kindeditor-4.1.10/kindeditor.js"></script>
<script type="text/javascript"
        src="/static/kindeditor-4.1.10/lang/zh_CN.js"></script>
<script>

    $(document).ready(function () {

        $('#crewBox').slimscroll({

            height: '200px',
            color:'red'

        });


        $(".sortable-list").sortable({connectWith: ".connectList"}).disableSelection();

        $("#dropManager").droppable({
            drop: function( event, ui ) {
                var child=$("#dropManager").children();
                if(child.length>0){
                    console.log(event);
                    $("#dropManager").droppable("disable");
                    $("#dropManager").sortable("disable");
                }
            }
        });
        $("#dropManager").click(function () {
            $("#allCrew").append($(this).find("li"));
            $(this).empty();
            $("#dropManager").sortable("enable");
            $("#dropManager").droppable("enable");
        })

        $("#editDropManager").droppable({
            drop: function( event, ui ) {
                var child=$("#editDropManager").children();
                if(child.length>0){
                    console.log(event);
                    $("#editDropManager").droppable("disable");
                    $("#editDropManager").sortable("disable");
                }
            }
        });
        $("#editDropManager").click(function () {
            $("#editAllCrew").append($(this).find("li"));
            $(this).empty();
            $("#editDropManager").sortable("enable");
            $("#editDropManager").droppable("enable");
        })


        $("#loading-example-btn").click(function () {
            btn = $(this);
            simpleLoad(btn, true);
            simpleLoad(btn, false)
        });

        $(".projectDetail").click(function () {
            var pid = $(this).attr("title");
            addTab("/projectController/projectDetail/" + pid, "123", "查看项目");
        });


        $("#editFormSub").click(function () {
            editor1.sync();
            var budget = $("#editBudget").val();
            if (budget == null || budget == "") {
                $("#editBudget").val(0);
            }
            $("#editCommentForm").submit();
        });

        $("#projectCrew a").click(function () {
            var obj = $(this);
            var data = obj.attr("data-field");
            parent.layer.confirm("确定将此员工从本项目中排除吗？", function (r) {
                if (r) {
                    console.log(data);
                    obj.html("");
                    parent.layer.closeAll();
                }
            })

        });


        $("#addFormSub").click(function () {

            editor.sync();
            var managerId=$("#dropManager li").attr("data-field");
           $("#addHideManagerId").val(managerId);

           var proCrews=$("#addProjectCrew ul").find("li");
           var crewArray=[];
           if(proCrews!=null&&proCrews.length>0){
               for(var i=0;i<proCrews.length;i++){
                   crewArray.push($(proCrews[i]).attr("data-field"));
               }
           }
            $("#addHideCrews").val(crewArray);
            var param=$("#addForm").serialize();
            console.log(param);

            $.post("/projectController/addProject",param,function (data) {
                if(data.success){
                    window.location.href="/projectController/projectList"
                }else{
                    parent.layer.error(data.message);
                }
            });

        });


    });
    function simpleLoad(btn, state) {
        if (state) {
            btn.children().addClass("fa-spin");
            btn.contents().last().replaceWith(" Loading")
        } else {
            setTimeout(function () {
                btn.children().removeClass("fa-spin");
                btn.contents().last().replaceWith(" Refresh")
            }, 2000)
        }
    }

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
    KindEditor
        .ready(function (K) {
            $('#myModal8').on('hidden.bs.modal', function () {
                // 关闭Dialog前移除编辑器
                KindEditor.remove('#editCcomment');
            });
            $('#myModal6').on('hidden.bs.modal', function () {
                // 关闭Dialog前移除编辑器
                KindEditor.remove('#addCcomment');
            });
            $("#slider").ionRangeSlider({
                min: 0,
                max: 100,
                from: 0,
                postfix: "%",
                onFinish: function (data) {
                    $("#hideProjectDone").val(data.fromNumber);
                }
            })

            $("#addSlider").ionRangeSlider({
                min: 0,
                max: 100,
                from: 0,
                postfix: "%",
                onFinish: function (data) {
                    $("#addHideProjectDone").val(data.fromNumber);
                }
            })
            $("#addNewProject").click(function () {
                editor = K.create('#addCcomment', options);
                $("#myModal6").modal("show");
            });

            $(".toEditProject").click(function () {

                editor1 = K.create('#editCcomment', options);
                $.post("/projectController/projectInfo/" + $(this).attr("title"), null, function (data) {
                    console.log(data);
                    if (data != null) {
                        $("#editId").val(data.id);
                        $("#editCname").val(data.projectName);
                        $("#editVersion").val(data.version);
                        var done = 0;
                        if (data.done == null) {
                            $("#hideProjectDone").val(0);
                        } else {
                            $("#hideProjectDone").val(data.done);
                            done = data.done;
                        }
                        $("#slider").ionRangeSlider("update", {
                            from: done
                        })
                        $("#editBudget").val(data.budget);
                        $("#editStatus").val(data.status);
                        if (data.manager == null) {
                            $("#editManager h4").text("未指派管理员");
                            $("#editManager img").attr("src", "/static/img/avatar.png");
                        } else {
                            $("#editManager h4").text(data.manager.userName);
                            $("#editManager img").attr("src", data.manager.avatar);
                        }

                        editor1.html(data.description);
                    }
                })
                $('#myModal8').modal("show");
            });
        });
</script>
</body>
</html>

