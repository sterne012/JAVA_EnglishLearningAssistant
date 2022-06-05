<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="bootstrap.jsp"%>
    <title>Admin Login -EN Learning Assistant-</title>
    <script type="text/javascript" src="js/jquery.js"></script>
</head>
<body>
<%@include file="nav.jsp"%>

<br><br>
<div class="page-header container">
    <h1>English Learning Assistant<small>  Admin Login</small></h1>
</div>


<form class="form-horizontal container" action="${pageContext.request.contextPath}/AdminLoginServlet" method="post">
    <div class="form-group">
        <span class="errorMsg" style="color:darkred"></span>
    </div>
    <div class="form-group" id="admin_id_group">
        <label for="admin_id" class="col-sm-2 control-label">Admin id</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="admin_id" name="admin_id" placeholder="id">
        </div>
    </div>
    <div class="form-group" id="admin_passwd_group">
        <label for="admin_passwd" class="col-sm-2 control-label">Password</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="admin_passwd" name="admin_passwd" placeholder="Password">
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
            <button type="submit" class="btn btn-success" id="login">Admin Login</button>
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