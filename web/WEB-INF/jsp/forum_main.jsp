<%--
  Created by IntelliJ IDEA.
  User: dxkj
  Date: 2016/10/27
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>


<!-- Mirrored from www.zi-han.net/theme/hplus/forum_main.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:19:47 GMT -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>H+ 后台主题UI框架 - 论坛</title>
    <link href="/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="/static/css/animate.min.css" rel="stylesheet">
    <link href="/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="row">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="wrapper wrapper-content animated fadeInRight">

                    <div class="ibox-content m-b-sm border-bottom">
                        <div class="p-xs">
                            <div class="pull-left m-r-md">
                                <i class="fa fa-globe text-navy mid-icon"></i>
                            </div>
                            <h2>欢迎来到H+论坛</h2>
                            <span>你可以自由选择你感兴趣的话题。</span>
                        </div>
                    </div>

                    <div class="ibox-content forum-container">

                        <div class="forum-title">
                            <div class="pull-right forum-desc">
                                <samll>总帖子数： 320,800</samll>
                            </div>
                            <h3>主版</h3>
                        </div>

                        <c:forEach var="topic" items="${allTopics}" step="1" varStatus="s">
                            <div class="forum-item active">
                                <div class="row">
                                    <div class="col-sm-9">
                                        <div class="forum-icon">
                                            <c:if test="${s.index==0}">
                                                <i class="fa fa-shield"></i>
                                            </c:if>
                                            <c:if test="${s.index==1}">
                                                <i class="fa fa-bolt"></i>
                                            </c:if>
                                            <c:if test="${s.index==2}">
                                                <i class="fa fa-calendar"></i>
                                            </c:if>
                                            <c:if test="${s.index==3}">
                                                <i class="fa fa-star"></i>
                                            </c:if>
                                        </div>
                                        <a href="/articleController/articleList" class="forum-item-title " >
                                            <c:out value="${topic.title}"></c:out></a>
                                        <div class="forum-sub-title">【官方活动】非你“慕”属——你是慕课网的真爱“粉”吗？</div>
                                    </div>
                                    <div class="col-sm-1 forum-info">
                                        <span class="views-number">
                                            1216
                                        </span>
                                        <div>
                                            <small>浏览</small>
                                        </div>
                                    </div>
                                    <div class="col-sm-1 forum-info">
                                        <span class="views-number">
                                            368
                                        </span>
                                        <div>
                                            <small>话题</small>
                                        </div>
                                    </div>
                                    <div class="col-sm-1 forum-info">
                                        <span class="views-number">
                                            140
                                        </span>
                                        <div>
                                            <small>帖子</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/static/js/jquery.min.js?v=2.1.4"></script>
<script src="/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/static/js/plugins/peity/jquery.peity.min.js"></script>
<script src="/static/js/content.min.js?v=1.0.0"></script>
</body>


<!-- Mirrored from www.zi-han.net/theme/hplus/forum_main.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:19:48 GMT -->
</html>

