<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="bootstrap.jsp"%>
    <title>Sign -EN Learning Assistant-</title>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">
        $(function () {
        $("#sign").click(function () {
            var usernameText = $("#user_id").val();
            var usernamePatt = /^\d{10}$/;
            if(!usernamePatt.test(usernameText)) {
                $("span.errorMsg").text("Error：用户名不合法，请检查输入");
                return false;
            }

            var passwordText = $("#user_passwd").val();
            var passwordPatt = /^\w{1,16}$/;
            if(!passwordPatt.test(passwordText)) {
                $("span.errorMsg").text("Error：密码不合法，请检查输入");
                return false;
            }
            var nameText = $("#user_name").val();
            var namePatt = /^\w{1,20}$/;
            if(!namePatt.test(nameText)) {
                $("span.errorMsg").text("Error：用户昵称最大为20位");
                return false;
            }
            $("span.errorMsg").text(""); //合法将不合法信息去除
        });
    });

    </script>
</head>
<body>
<%@include file="nav.jsp"%>

<br><br>
<div class="page-header container">
    <h1>English Learning Assistant<small>  Sign up now!</small></h1>
</div>


<form class="form-horizontal container" id="registerForm" action="${pageContext.request.contextPath}/SignServlet" method="post">
    <div class="form-group">
        <span class="errorMsg" style="color:darkred"></span>
    </div>
    <div class="form-group">
        <label for="user_id" class="col-sm-2 control-label">User id</label>

        <div class="col-sm-10" id="div_user_id">
            <input type="text" class="form-control" id="user_id" name="user_id" placeholder="请设置10位数字id">
        </div>
    </div>
    <div class="form-group">
        <label for="user_passwd" class="col-sm-2 control-label">Password</label>
        <div class="col-sm-10" id="div_user_passwd">
            <input type="text" class="form-control" id="user_passwd" name="user_passwd" placeholder="请设置16位内密码">
        </div>
    </div>
    <div class="form-group">
        <label for="user_name" class="col-sm-2 control-label">User name</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="user_name" name="user_name" placeholder="昵称~">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <a class="btn btn-default" href="${pageContext.request.contextPath}/login.jsp" id="back">Back</a>
            <input type="submit" class="btn btn-default" id="sign" value="Sign">
        </div>
    </div>
    <c:if test="${not empty sign_msg}">
        <div class="alert alert-success" role="alert">
            Success!<a class="alert-link" href="${pageContext.request.contextPath}/login.jsp"> to login...</a>
        </div>
    </c:if>
    <c:if test="${not empty fail_msg}">
        <div class="alert alert-danger" role="alert">
            <strong>Failed:该id可能已被注册，请尝试其他id</strong>
        </div>
    </c:if>
</form>
<%@ include file="copyright.jsp"%>
</body>
</html>