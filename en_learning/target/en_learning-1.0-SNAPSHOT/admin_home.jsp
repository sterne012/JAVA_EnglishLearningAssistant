<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="bootstrap.jsp"%>
    <title>Welcome -EN Learning Assistant-</title>
</head>
<body>
<c:if test="${not empty admin}"><%@include file="admin_nav.jsp"%></c:if>
<br><br>
<div class="page-header container">
    <h1>English Learning Assistant<small>  Welcome Admin</small></h1>
</div>
<c:if test="${not empty succ_msg}">
    <div class="container alert alert-success" role="alert">
        Success! 备份时间：${succ_msg}
    </div>
</c:if>
<div class="media container">
    <div class="media-left">
        <img class="media-object" src="img/1.jpg" alt="failed">

    </div>
    <div class="media-body">
        <h3 class="media-heading">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/PageServlet" role="button">Manage word list...</a>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/AdminUserServlet" role="button">Manage user list...</a>
        </h3>
        <p class="text-left">
        <blockquote>
            You’re the only thing I can see<br>
            Then there’s the light<br>
            Came from the deepest darkest storm in my heart<br>
            <footer>Bluish Light</footer>
        </blockquote>
        </p>
    </div>
</div>
<br>
<br>
<div class="media container">
    <div class="media-body">
        <h3 class="media-heading text-right">
            <a class="btn btn-default" href="${pageContext.request.contextPath}/BakServlet" role="button">数据库备份</a>
        </h3>
    </div>
    <div class="media-right">
        <img class="media-object" src="img/2.jpg" alt="failed">
    </div>
</div>
<%@ include file="copyright.jsp"%>
</body>
</html>