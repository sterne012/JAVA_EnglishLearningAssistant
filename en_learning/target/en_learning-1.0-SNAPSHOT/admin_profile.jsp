<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="bootstrap.jsp"%>
    <title>Admin Profile -EN Learning Assistant-</title>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#save").click(function () {
                var passwordText = $("#admin_passwd").val();
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
<c:if test="${not empty admin}"><%@include file="admin_nav.jsp"%></c:if>
<br><br>
<div class="page-header container">
    <h1>English Learning Assistant<small> Admin profile</small>
    </h1>
</div>


<form class="form-horizontal container" action="${pageContext.request.contextPath}/AdminInfoServlet" method="post">
    <c:if test="${not empty profile_msg}">
        <div class="alert alert-success" role="alert">
            <strong>${profile_msg}</strong>
        </div>
    </c:if>
    <div class="form-group">
        <span class="errorMsg" style="color:darkred"></span>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">Admin id</label>
        <div class="col-sm-10">
            <p class="form-control-static">${admin.admin_id}</p>
        </div>
    </div>
    <div class="form-group">
        <label for="admin_passwd" class="col-sm-2 control-label">Password</label>
        <div class="col-sm-10" id="div_admin_passwd">
            <input type="text" class="form-control" value="${admin.admin_passwd}" id="admin_passwd" name="admin_passwd" placeholder="请设置16位内密码">
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