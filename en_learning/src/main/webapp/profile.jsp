<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="bootstrap.jsp"%>
    <title>Profile -EN Learning Assistant-</title>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript">
            $(function () {
                $("#save").click(function () {
                    var passwordText = $("#user_passwd").val();
                    var passwordPatt = /^\w{1,16}$/;
                    if(!passwordPatt.test(passwordText)) {
                        $("span.errorMsg").text("Error：密码不合法，请检查输入");
                        return false;
                    }
                    $("span.errorMsg").text("");
                });
            });
        </script>
</head>
<body>
<c:if test="${not empty user}"><%@include file="user_nav.jsp"%></c:if>
<c:if test="${empty user}"><%@include file="nav.jsp"%></c:if>
<br><br>
<div class="page-header container">
    <h1>English Learning Assistant<small> My profile</small>
    </h1>
</div>


<form class="form-horizontal container" action="${pageContext.request.contextPath}/UserInfoServlet" method="post">
    <c:if test="${not empty profile_msg}">
        <div class="alert alert-success" role="alert">
            <strong>${profile_msg}</strong>
        </div>
    </c:if>
    <div class="form-group">
        <span class="errorMsg" style="color:darkred"></span>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">User id</label>
        <div class="col-sm-10" id="div_user_id">
            <p class="form-control-static">${user.user_id}</p>
        </div>
    </div>
    <div class="form-group">
        <label for="user_name" class="col-sm-2 control-label">User name</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" value="${user.user_name}" id="user_name" name="user_name" placeholder="昵称~">
        </div>
    </div>
    <div class="form-group">
        <label for="user_passwd" class="col-sm-2 control-label">Password</label>
        <div class="col-sm-10" id="div_user_passwd">
            <input type="text" class="form-control" value="${user.user_passwd}" id="user_passwd" name="user_passwd" placeholder="请设置16位内密码">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Sign date</label>
        <div class="col-sm-10" id="div_user_date">
            <p class="form-control-static">${user.user_date}</p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">累计打卡天数</label>
        <div class="col-sm-10" id="div_user_learn">
            <p class="form-control-static">${user.user_learn}</p>
        </div>
    </div>
    <br>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default" id="save">Save</button>
        </div>
    </div>

</form>

<%@ include file="copyright.jsp"%>
</body>
</html>