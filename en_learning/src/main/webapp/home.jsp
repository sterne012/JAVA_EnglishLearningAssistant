<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="bootstrap.jsp"%>
    <title>Welcome -EN Learning Assistant-</title>
</head>
<body>
<c:if test="${not empty user}"><%@include file="user_nav.jsp"%></c:if>
<c:if test="${empty user}"><%@include file="nav.jsp"%>></c:if>
<br><br>
<div class="page-header container">
    <h1>English Learning Assistant<small>  Welcome</small></h1>
</div>

<div class="media container">
    <div class="media-left">
        <img class="media-object" src="img/1.jpg" alt="failed">

    </div>
    <div class="media-body">
        <h3 class="media-heading">
            要开始今天的学习吗？
            <a class="btn btn-default" href="${pageContext.request.contextPath}/learn.jsp" role="button">修改学习计划</a>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/DayServlet" role="button">开始
                <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a>
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

        <h3 class="media-heading text-right">也许复习一下更好...
            <a class="btn btn-default" href="${pageContext.request.contextPath}/List2Servlet" role="button">复习</a>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/TestServlet" role="button">自测一下</a>
        </h3>
        <br>
        <p class="text-right">
            目前计划：${user.user_words_num} words per day<br>
            今日已学：${user.user_learned}
        </p>
    </div>
    <div class="media-right">
            <img class="media-object" src="img/2.jpg" alt="failed">
    </div>
</div>
<%@ include file="copyright.jsp"%>
</body>
</html>