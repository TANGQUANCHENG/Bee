<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<!-- Mirrored from www.zi-han.net/theme/hplus/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:18:23 GMT -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>code 0</title>
    <link rel="shortcut icon" href="/static/Horde.ico">
    <link href="static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="static/css/animate.min.css" rel="stylesheet">
    <link href="static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="static/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->
    <script>if (window.top !== window.self) {
        window.top.location = window.location;
    }</script>
    <style>

        body {
            padding-top: 100px;
            background: linear-gradient(125deg, #228fbd, #918597, #4f5555, #fffef9);
            background-size: 800% 800%;

            -webkit-animation: AnimationName 11s ease infinite;
            -moz-animation: AnimationName 11s ease infinite;
            -o-animation: AnimationName 11s ease infinite;
            animation: AnimationName 11s ease infinite;
        }

        @-webkit-keyframes AnimationName {
            0% {
                background-position: 97% 0%
            }
            50% {
                background-position: 4% 100%
            }
            100% {
                background-position: 97% 0%
            }
        }

        @-moz-keyframes AnimationName {
            0% {
                background-position: 97% 0%
            }
            50% {
                background-position: 4% 100%
            }
            100% {
                background-position: 97% 0%
            }
        }

        @-o-keyframes AnimationName {
            0% {
                background-position: 97% 0%
            }
            50% {
                background-position: 4% 100%
            }
            100% {
                background-position: 97% 0%
            }
        }

        @keyframes AnimationName {
            0% {
                background-position: 97% 0%
            }
            50% {
                background-position: 4% 100%
            }
            100% {
                background-position: 97% 0%
            }
        }
        #user_login{
            background-color: #3e4145;
            border-color: #3e4145;
        }
    </style>
</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>

            <h1 class="logo-name">Be</h1>

        </div>
        <h3>welcome</h3>

        <form class="m-t" role="form" action="/userinfo/login" id="login_form">
            <div class="form-group">
                <input type="text" name="userName" class="form-control" placeholder="用户名" required="">
            </div>
            <div class="form-group">
                <input type="password" name="password" class="form-control" placeholder="密码" required="">
            </div>
            <button type="button" class="btn btn-primary block full-width m-b" id="user_login">
                <i class="fa fa-user"></i>&emsp;
                登 录
            </button>


            <p class="text-muted text-center"><a href="login.html#">
                <small>忘记密码了？</small>
            </a> | <a href="/static/register/register.html">注册一个新账号</a>
            </p>

        </form>
    </div>
</div>
<script src="/static/js/jquery.min.js?v=2.1.4"></script>
<script src="/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/static/js/plugins/toastr/toastr.min.js"></script>
<script>
    $(document).ready(function () {
        toastr.options = {
            "closeButton": true,
            "debug": false,
            "progressBar": true,
            "positionClass": "toast-bottom-center",
            "onclick": null,
            "showDuration": "400",
            "hideDuration": "1000",
            "timeOut": "7000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }

//        toastr.warning("这是一条警告消息");
//        toastr.success("这是一条警告消息");
//        toastr.error("这是一条警告消息");
//        toastr.info("这是一条警告消息");

        $("#user_login").click(function () {

            var  btn = $(this);
            simpleLoad(btn, true);
            login();
        });
    });
    function simpleLoad(btn, state) {
        if (state) {
            btn.children().removeClass("fa-user");
            btn.children().addClass("fa-spinner");
            btn.children().addClass("fa-spin");
            btn.contents().last().replaceWith("&emsp;验证中")
        }else {
            setTimeout(function () {
                btn.children().removeClass("fa-spinner");
                btn.children().addClass("fa-user");
                btn.children().removeClass("fa-spin");
                btn.contents().last().replaceWith("&emsp;登录")
            }, 500)
        }
    }
    function login() {
        $.post("/userinfo/login", $("#login_form").serialize(), function (data) {
            if (data.success) {
                toastr.success(data.message);
                window.location.href = "/bee/index"
            } else {
                var btn=$("#user_login");
                simpleLoad(btn, false)
                toastr.error(data.message,"错误提示")
            }
        });
    }
</script>
<script type="text/javascript">
    document.onkeydown = keyDownSearch;
    function keyDownSearch(e) {
        // 兼容FF和IE和Opera    
        var theEvent = e || window.event;
        var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
        if (code == 13) {
            login();//具体处理函数
            return false;
        }
        return true;
    }
</script>
</body>
<!-- Mirrored from www.zi-han.net/theme/hplus/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:18:23 GMT -->
</html>
