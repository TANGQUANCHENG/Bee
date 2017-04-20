<%--
  Created by IntelliJ IDEA.
  User: dxkj
  Date: 2016/10/28
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>


<!-- Mirrored from www.zi-han.net/theme/hplus/blog.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:19:47 GMT -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - 文章列表</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="/static/css/animate.min.css" rel="stylesheet">
    <link href="/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <style>
        .ibox{height: 200px;}
    </style>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content  animated fadeInRight blog">
    <div class="ibox-content m-b-sm border-bottom">
        <div class="text-left">
            <button title="Create new cluster" class="btn btn-primary btn-sm J_menuItem" id="toEditArticle"><i class="fa fa-plus"></i> <span class="bold">发表文章</span>
            </button>
        </div>
    </div>
    <div class="row">
<c:forEach var="article" items="${allArticle}" step="1" varStatus="s">
        <div class="col-lg-4">
            <div class="ibox">
                <div class="ibox-content">
                    <a href="/articleController/article/<c:out value="${article.id}"></c:out>" class="btn-link">
                        <h2>
                            <c:out value="${article.title}"></c:out>
                        </h2>
                    </a>
                    <div class="small m-b-xs">
                        <strong>高 晨</strong> <span class="text-muted"><i class="fa fa-clock-o"></i> 3 小时前</span>
                    </div>
                    <p>
                        <c:out value="${article.subtitle}"></c:out>
                    </p>
                    <div class="row">
                        <div class="col-md-6">
                            <h5>标签：</h5>
                            <button class="btn btn-primary btn-xs" type="button">Apple Watch</button>
                            <button class="btn btn-white btn-xs" type="button">速比涛</button>
                        </div>
                        <div class="col-md-6">
                            <div class="small text-right">
                                <h5>状态：</h5>
                                <div><i class="fa fa-comments-o"> </i> 56 评论</div>
                                <i class="fa fa-eye"> </i> 144 浏览
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </c:forEach>

    </div>
</div>
<script src="/static/js/jquery.min.js?v=2.1.4"></script>
<script src="/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/static/js/content.min.js?v=1.0.0"></script>
<script src="/static/js/conttab_child.js"></script>
<script>
    $(document).ready(function(){
        $("#toEditArticle").click(function(){
            //window.location.href="/articleController/toEditArticle"
            addTab("/articleController/toEditArticle","123","新增文章",true);

        });
    });

</script>
</body>


<!-- Mirrored from www.zi-han.net/theme/hplus/blog.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:19:47 GMT -->
</html>

