<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="bootstrap.jsp"%>
    <title>Login -EN Learning Assistant-</title>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#login").click(function () {
                //1 获取用户名输入框里的内容
                var usernameText = $("#user_id").val();
                //2 创建正则表达式对象
                var usernamePatt = /^\d{10}$/;
                //3 使用test方法验证
                if(!usernamePatt.test(usernameText)) {
                    //4 提示用户结果
                    $("span.errorMsg").text("Error：用户名不合法，请检查输入");
                    return false; // 让其不跳转
                }

                //1 获取密码输入框里的内容
                var passwordText = $("#user_passwd").val();
                //2 创建正则表达式对象
                var passwordPatt = /^\w{1,16}$/;
                //3 使用test方法验证
                if(!passwordPatt.test(passwordText)) {
                    //4 提示用户结果
                    $("span.errorMsg").text("Error：密码不合法，请检查输入");
                    return false; // 让其不跳转
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
    <h1>English Learning Assistant<small>  Please Login</small></h1>
</div>


<form class="form-horizontal container" action="${pageContext.request.contextPath}/LoginServlet" method="post">
    <div class="form-group">
        <span class="errorMsg" style="color:darkred"></span>
    </div>
    <div class="form-group" id="user_id_group">
        <label for="user_id" class="col-sm-2 control-label">User id</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="user_id" name="user_id" placeholder="id">
        </div>
    </div>
    <div class="form-group" id="user_passwd_group">
        <label for="user_passwd" class="col-sm-2 control-label">Password</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="user_passwd" name="user_passwd" placeholder="Password">
        </div>
    </div>
    <div class="form-group" >
        <div class="col-sm-offset-2 col-sm-10">
            <div class="checkbox">
                <label>
                    <input type="checkbox"> Remember me
                </label>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default" id="login">Login</button>
            <a class="btn btn-link" href="${pageContext.request.contextPath}/signup.jsp" id="signup">Sign up now
                <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a>
            <a class="btn btn-link" href="${pageContext.request.contextPath}/admin_login.jsp" id="admin_login">Admin
                <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a>
        </div>
    </div>
    <c:if test="${not empty login_msg}">
    <div class="alert alert-danger" role="alert">
        <strong>${login_msg}</strong>
    </div>
    </c:if>

</form>
<%@ include file="copyright.jsp"%>
</body>
</html>