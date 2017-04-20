<%--
  Created by IntelliJ IDEA.
  User: dxkj
  Date: 2016/11/21
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="a" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

    <link href="/static/css/animate.min.css" rel="stylesheet">
    <link href="/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="/static/js/plugins/fancybox/jquery.fancybox.css" rel="stylesheet">
    <style>
        .fancybox img{
            height: auto;width: 100%;
        }
    </style>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div class="file-manager">
                        <h5>显示：</h5>
                        <a href="file_manager.html#" class="file-control active">所有</a>
                        <a href="file_manager.html#" class="file-control">文档</a>
                        <a href="file_manager.html#" class="file-control">视频</a>
                        <a href="file_manager.html#" class="file-control">图片</a>
                        <div class="hr-line-dashed"></div>
                        <button class="btn btn-primary btn-block" id="toUpload">上传文件</button>
                        <div class="hr-line-dashed"></div>
                        <h5>文件夹</h5>
                        <ul class="folder-list" style="padding: 0">
                            <li><a href="javascript:void(0)"><i class="fa fa-folder"></i> 文件</a>
                            </li>
                            <li><a href="javascript:void(0)"><i class="fa fa-folder"></i> 图片</a>
                            </li>
                            <li><a href="javascript:void(0)"><i class="fa fa-folder"></i> Web页面</a>
                            </li>
                            <li><a href="javascript:void(0)"><i class="fa fa-folder"></i> 插图</a>
                            </li>
                            <li><a href="javascript:void(0)"><i class="fa fa-folder"></i> 电影</a>
                            </li>
                            <li><a href="javascript:void(0)"><i class="fa fa-folder"></i> 书籍</a>
                            </li>
                        </ul>
                        <h5 class="tag-title">标签</h5>
                        <ul class="tag-list" style="padding: 0">
                            <li><a href="javascript:void(0)">爱人</a>
                            </li>
                            <li><a href="javascript:void(0)">工作</a>
                            </li>
                            <li><a href="javascript:void(0)">家庭</a>
                            </li>
                            <li><a href="javascript:void(0)">孩子</a>
                            </li>
                            <li><a href="javascript:void(0)">假期</a>
                            </li>
                            <li><a href="javascript:void(0)">音乐</a>
                            </li>
                            <li><a href="javascript:void(0)">照片</a>
                            </li>
                            <li><a href="javascript:void(0)">电影</a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-9 animated fadeInRight">
            <div class="row">
                <div class="col-sm-12">

                    <c:forEach var="file" items="${allFiles}" step="1" varStatus="s">

                        <a:parseDate value="${file.date}" var="parsedEmpDate" pattern="yyyyMMddHHmmss"/>
                        <div class="file-box">
                            <div class="file">
                                <a class="fancybox" data-fancybox-group="gallery" href="/static/uploadImage/<c:out value="${file.fullName}"></c:out>">
                                    <span class="corner"></span>
                                    <c:choose>
                                        <c:when test="${file.type==1}">
                                            <div class="image">
                                                <img alt="image" class="img-responsive"
                                                     src="/static/uploadImage/<c:out value="${file.fullName}"></c:out>">
                                            </div>
                                        </c:when>
                                        <c:when test="${file.type==2}">
                                            <div class="icon">
                                                <i class="fa fa-music"></i>
                                            </div>
                                        </c:when>
                                        <c:when test="${file.type==3}">
                                            <div class="icon">
                                                <i class="img-responsive fa fa-film"></i>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="icon">
                                                <i class="fa fa-bar-chart-o"></i>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="file-name">
                                        <c:out value="${file.name}"></c:out>
                                        <br/>
                                        <small>添加时间：<a:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                                                                  value="${parsedEmpDate}"/></small>
                                    </div>
                                </a>
                            </div>

                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/static/js/jquery.min.js?v=2.1.4"></script>
<script src="/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/static/js/content.min.js?v=1.0.0"></script>
<script src="/static/js/plugins/fancybox/jquery.fancybox.js"></script>
<script>
    $(document).ready(function () {
        $(".file-box").each(function () {
            animationHover(this, "pulse")
        })
        $(".fancybox").fancybox();
        $("#toUpload").click(function () {
            window.location.href="/uploadController/dropZone"
        });
    });
</script>
</body>
</html>

