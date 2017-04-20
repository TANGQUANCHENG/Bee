<%--
  Created by IntelliJ IDEA.
  User: dxkj
  Date: 2016/11/8
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>


<!-- Mirrored from www.zi-han.net/theme/hplus/basic_gallery.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:20:06 GMT -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="/static/js/plugins/fancybox/jquery.fancybox.css" rel="stylesheet">
  <%--  <link href="/static/js/plugins/fancybox/jquery.fancybox-thumbs.css" rel="stylesheet">--%>
    <link href="/static/css/animate.min.css" rel="stylesheet">
    <link href="/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>画廊
                        <small>用户所上传的所有图片</small>
                    </h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="basic_gallery.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="basic_gallery.html#">选项1</a>
                            </li>
                            <li><a href="basic_gallery.html#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <c:forEach var="image" items="${allImages}" step="1" varStatus="s">
                        <a class="fancybox" data-fancybox-group="gallery"
                           title="<c:out value="${image}"></c:out>"
                           href="/static/uploadImage/<c:out value="${image}"></c:out>" >
                            <img alt="image" src="/static/uploadImage/<c:out value="${image}"></c:out>"/>
                        </a>
                    </c:forEach>
                </div>
            </div>
        </div>

    </div>
</div>
<script src="/static/js/jquery.min.js?v=2.1.4"></script>
<script src="/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/static/js/plugins/peity/jquery.peity.min.js"></script>
<script src="/static/js/content.min.js?v=1.0.0"></script>
<script src="/static/js/plugins/fancybox/jquery.fancybox.js"></script>
<%--<script src="/static/js/plugins/fancybox/jquery.fancybox-thumbs.js"></script>--%>
<script>
    $(document).ready(function () {

        $(".fancybox").fancybox();
    });
</script>
</body>
</html>

