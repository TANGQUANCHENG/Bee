<%--
  Created by IntelliJ IDEA.
  User: dxkj
  Date: 2016/11/10
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>请重新登录</title>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico">
    <link href="/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

    <link href="/static/css/animate.min.css" rel="stylesheet">
    <link href="/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <script>if (window.top !== window.self) {
        window.top.location = window.location;
    }</script>

</head>

<body class="gray-bg">

<div class="lock-word animated fadeInDown">
</div>
<div class="middle-box text-center lockscreen animated fadeInDown">
    <div>
        <div class="m-b-md">
            <img alt="image" class="img-circle circle-border" src="/static/img/a1.jpg">
        </div>
        <h3>Beaut-zihan</h3>
        <p>您需要再次输入密码</p>
        <form class="m-t" role="form" action="#">
            <div class="form-group">
                <input type="password" class="form-control" placeholder="******" required="">
            </div>
            <button type="submit" class="btn btn-primary block full-width">登录到BEE</button>
        </form>
    </div>
</div>
<script src="/static/js/jquery.min.js?v=2.1.4"></script>
<script src="/static/js/bootstrap.min.js?v=3.3.6"></script>
</body>
</html>

