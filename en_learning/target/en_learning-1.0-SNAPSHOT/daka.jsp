<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="bootstrap.jsp"%>
    <title>Daka -EN Learning Assistant-</title>
</head>
<body>
<c:if test="${not empty user}"><%@include file="user_nav.jsp"%></c:if>
<c:if test="${empty user}"><%@include file="nav.jsp"%></c:if>

<br><br>
<div class="page-header container">
    <h1>English Learning Assistant<small> 学习打卡</small>
    </h1>
</div>

<div class="media container">
    <div id="carousel-example-generic" class="media-left carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
            <li data-target="#carousel-example-generic" data-slide-to="4"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="img/3.jpg" alt="...">
                <div class="carousel-caption">
                    <h2>打卡成功</h2>
                    <p>
                        <b>${user.user_name}</b><br>
                        累计打卡天数：${user.user_learn+1}<br>
                        今日学习单词：${user.user_learned}
                    </p>
                </div>
            </div>
            <div class="item">
                <img src="img/5.jpg" alt="...">
                <div class="carousel-caption">
                    <h2>打卡成功</h2>
                    <p>
                        <b>${user.user_name}</b><br>
                        累计打卡天数：${user.user_learn+1}<br>
                        今日学习单词：${user.user_learned}
                    </p>
                </div>
            </div>
            <div class="item">
                <img src="img/4.jpg" alt="...">
                <div class="carousel-caption">
                    <h2>打卡成功</h2>
                    <p>
                        <b>${user.user_name}</b><br>
                        累计打卡天数：${user.user_learn+1}<br>
                        今日学习单词：${user.user_learned}
                    </p>
                </div>
            </div>
            <div class="item">
                <img src="img/6.jpg" alt="...">
                <div class="carousel-caption">
                    <h2>打卡成功</h2>
                    <p>
                        <b>${user.user_name}</b><br>
                        累计打卡天数：${user.user_learn+1}<br>
                        今日学习单词：${user.user_learned}
                    </p>
                </div>
            </div>
            <div class="item">
                <img src="img/7.jpg" alt="...">
                <div class="carousel-caption">
                    <h2>打卡成功</h2>
                    <p>
                        <b>${user.user_name}</b><br>
                        累计打卡天数：${user.user_learn+1}<br>
                        今日学习单词：${user.user_learned}
                    </p>
                </div>
            </div>

        </div>
        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

</div>
<div class="media container">
    <blockquote>
        You’re the only thing I can see<br>
        Then there’s the light<br>
        Came from the deepest darkest storm in my heart<br>
        <footer>Bluish Light</footer>
    </blockquote>
    <a type="button" class="btn btn-primary" href="${pageContext.request.contextPath}/DayServlet">再学一会！</a>
    <a type="button" class="btn btn-default" href="${pageContext.request.contextPath}/learn.jsp">修改学习计划</a>
    <a type="button" class="btn btn-default" href="${pageContext.request.contextPath}/DakaServlet">退出</a>
</div>

<%@ include file="copyright.jsp"%>
</body>
</html>