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
    <h1>English Learning Assistant <small>by sterne012</small></h1>
</div>
<div class="jumbotron container">
    <h2>英语学习助手-介绍</h2><br>
    <p>选题说明</p>
    <p>   英语学习贯穿整个义务教育过程，并且在大学生活中使用十分广泛。
        读论文、读源码、了解前沿知识、在许多网站上学习……都会非常广泛地应用到英语知识。
        而词汇量低、发音不准成为了非常普遍的问题。
        而市面上大多数的英语学习软件都或多或少存在一些不尽人意的地方：
        翻译软件中广告和推广小视频令人生厌，英语学习软件中缺少查词功能。
        由此，有了自己想要开发一款纯净无广告的英语学习系统的想法。<br>
        除此之外，考虑到可能对其他语种有所需求，本系统计划做好强大的可扩展性，满足其他语言的学习需要（拓展日语、法语等），进行拓展。
    </p>
    <p>需求介绍</p>
    <p>    用户可以进行注册、登录；在系统中查询单词，可以存入自己的生词表进行每日学习，
        学习后单词放入熟词表，学习完毕后可以进行打卡，生成每日学习报告。</p>
    <p></p>
    <p><a class="btn btn-primary btn-lg" href="login.jsp" role="button">Just come!</a></p>
</div>
<%@ include file="copyright.jsp"%>
</body>
</html>