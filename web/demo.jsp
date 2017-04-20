<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="a" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>


<!-- Mirrored from www.zi-han.net/theme/hplus/code_editor.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:19:41 GMT -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>代码编辑器</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="/static/css/animate.min.css" rel="stylesheet">
    <link href="/static/css/plugins/codemirror/codemirror.css" rel="stylesheet">
    <link href="/static/css/plugins/codemirror/ambiance.css" rel="stylesheet">
    <link href="/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox ">

                <div class="ibox-title">
                    <h5>基本编辑器</h5>

                </div>
                <div class="ibox-content">
                    <textarea id="code1">
                        taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
                        taglib prefix="a" uri="http://java.sun.com/jsp/jstl/fmt"
    -------------------------------------------------------------------------------------------------------
                    <h3>数字格式化:120000.2309</h3>
                    <c:set var="balance" value="120000.2309"/>
                        <a:formatNumber value="${balance}" type="currency"/>
                        格式化数字 (1): <fmt:formatNumber value="${balance}"
                                                     type="currency"/>
                    <a:formatNumber type="number" maxIntegerDigits="3" value="${balance}"/>
                    格式化数字 (2): <fmt:formatNumber type="number"
                                                    maxIntegerDigits="3" value="${balance}"/>

                    <a:formatNumber type="number" maxFractionDigits="3" value="${balance}"/>
                    格式化数字 (3): <fmt:formatNumber type="number"
                                                    maxFractionDigits="3" value="${balance}"/>

                    <a:formatNumber type="number" groupingUsed="false" value="${balance}"/>
                    格式化数字 (4): <fmt:formatNumber type="number"
                                                    groupingUsed="false" value="${balance}"/>

                    <a:formatNumber type="percent" maxIntegerDigits="3" value="${balance}"/>
                    格式化数字 (5): <fmt:formatNumber type="percent"
                                                    maxIntegerDigits="3" value="${balance}"/>

                    <a:formatNumber type="percent" minFractionDigits="10" value="${balance}"/>
                    格式化数字 (6): <fmt:formatNumber type="percent"
                                                    minFractionDigits="10" value="${balance}"/>

                    <a:formatNumber type="percent" maxIntegerDigits="3" value="${balance}"/>
                    格式化数字 (7): <fmt:formatNumber type="percent"
                                                    maxIntegerDigits="3" value="${balance}"/>

                    <a:formatNumber type="number" pattern="###.###E0" value="${balance}"/>
                    格式化数字 (8): <fmt:formatNumber type="number"
                                                    pattern="###.###E0" value="${balance}"/>

                    <a:setLocale value="en_US"/><a:formatNumber value="${balance}" type="currency"/>
                    美元 :<fmt:setLocale value="en_US"/><fmt:formatNumber value="${balance}" type="currency"/>


        -------------------------------------------------------------------------------------------------------

                    <h3>数字解析:1250003.350</h3>
                    <c:set var="balance" value="1250003.350"/>
                    <a:parseNumber var="i" type="number" value="${balance}"/>
                    <fmt:parseNumber var="i" type="number" value="${balance}"/>
                    数字解析 (1) : <c:out value="${i}"/>

                    <a:parseNumber var="i" integerOnly="true" type="number" value="${balance}"/>
                    <fmt:parseNumber var="i" integerOnly="true" type="number" value="${balance}"/>
                    数字解析 (2) : <c:out value="${i}"/>

        -------------------------------------------------------------------------------------------------------

                    <h3>日期格式化:当前时间</h3>

                    <b:set var="now" value="<%=new java.util.Date()%>"/>
                    <c:set var="now" value="<%=new java.util.Date()%>"/>

                    <a:formatDate type="time" value="${now}"/>
                    日期格式化 (1): <fmt:formatDate type="time"
                                                  value="${now}"/>

                    <a:formatDate type="date" value="${now}"/>
                    日期格式化 (2): <fmt:formatDate type="date"
                                                  value="${now}"/>

                    <a:formatDate type="both" value="${now}"/>
                    日期格式化 (3): <fmt:formatDate type="both"
                                                  value="${now}"/>

                    <a:formatDate type="both" dateStyle="short" timeStyle="short" value="${now}"/>
                    日期格式化 (4): <fmt:formatDate type="both"
                                                  dateStyle="short" timeStyle="short"
                                                  value="${now}"/>

                    <a:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${now}"/>
                    日期格式化 (5): <fmt:formatDate type="both"
                                                  dateStyle="medium" timeStyle="medium"
                                                  value="${now}"/>

                    <a:formatDate type="both" dateStyle="long" timeStyle="long" value="${now}"/>

                    日期格式化 (6): <fmt:formatDate type="both"
                                                  dateStyle="long" timeStyle="long"
                                                  value="${now}"/>

                    <a:formatDate pattern="yyyy-MM-dd" value="${now}"/>
                    日期格式化 (7): <fmt:formatDate pattern="yyyy-MM-dd"
                                                  value="${now}"/>

        -------------------------------------------------------------------------------------------------------
                    <h3>日期解析:20-10-2015</h3>
                    <c:set var="now" value="20-10-2015"/>
                    <a:parseDate value="${now}" var="parsedEmpDate" pattern="dd-MM-yyyy"/>
                    <fmt:parseDate value="${now}" var="parsedEmpDate"
                                   pattern="dd-MM-yyyy"/>
                    解析后的日期为: <c:out value="${parsedEmpDate}"/>

                    <c:set var="str" value="20161213"/>
                    <a:parseDate value="${str}" var="parsedEmpDate1" pattern="yyyyMMdd"/>
                    <c:out value="${parsedEmpDate1}"></c:out>
                    <a:formatDate value="${parsedEmpDate1}" pattern="yyyy年MM月dd日"></a:formatDate>
        -------------------------------------------------------------------------------------------------------
                        异常捕获
                      <b:catch var="catchException">
                          int m = 5 / 0;(java代码)
                      </b:catch>
                      <b:if test="$ {catchException != null}">
                      异常为 : $ {catchException} <br/>
                      发生了异常: $ {catchException.message}
                      </b:if>
                      <c:catch var="catchException">
                          <% int x = 5 / 0;%>
                      </c:catch>
                      <c:if test="${catchException != null}">
                      异常为 : ${catchException} <br/>
                      发生了异常: ${catchException.message}
                      </c:if>

          -------------------------------------------------------------------------------------------------------

                     <b:forEach var="i" begin="1" end="5">
                        Item <b:out value="$ {i}"/>
                    </b:forEach>

                    <c:forEach var="i" begin="1" end="5">
                        Item <c:out value="${i}"/>
                    </c:forEach>
            -------------------------------------------------------------------------------------------------------

                   <b:forTokens items="google,runoob,taobao" delims="," var="name">
                        <b:out value="${name}"/>

                   </b:forTokens>

                    <c:forTokens items="google,runoob,taobao" delims="," var="name">
                        <c:out value="${name}"/>

                   </c:forTokens>
            -------------------------------------------------------------------------------------------------------
                    <b:url var="myURL" value="main.jsp">
		                <b:param name="name" value="Runoob"/>
		                <b:param name="url" value="www.runoob.com"/>
	                </b:url>

                    <c:url var="myURL" value="main.jsp">
		             <c:param name="name" value="Runoob"/>
		             <c:param name="url" value="www.runoob.com"/>
	                </c:url>
                        <a href="/<c:out value="${myURL}"/>">测试</a>
                    </textarea>
                </div>
            </div>
        </div>
    </div>

</div>
<script src="/static/js/jquery.min.js?v=2.1.4"></script>
<script src="/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/static/js/plugins/peity/jquery.peity.min.js"></script>
<script src="/static/js/plugins/codemirror/codemirror.js"></script>
<script src="/static/js/plugins/codemirror/mode/javascript/javascript.js"></script>
<script>
    $(document).ready(function () {
        var editor_one = CodeMirror.fromTextArea(document.getElementById("code1"), {
            lineNumbers: true,
            matchBrackets: true,
            styleActiveLine: true,
            theme: "ambiance"
        });
    });

    var person = function () {

        this.name = "Tom";
        this.age = 14;
    }
    person.prototype.say = function () {
        return this.name;
    }
    var man = new person();

    console.log(man.say());

</script>
</body>
https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx47e684de2ececbdc&redirect_uri=www.baidu.com&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect
</html>
https://api.weixin.qq.com/sns/oauth2/access_token?appid=wx47e684de2ececbdc&secret=87b28fd519dac892a1b568163844ce7f&code=0218Luz81BKsiS1wC6A81Chaz818Luzi&grant_type=authorization_code