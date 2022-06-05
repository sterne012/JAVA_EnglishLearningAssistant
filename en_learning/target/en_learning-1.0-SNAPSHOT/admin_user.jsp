<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="bootstrap.jsp"%>
    <title>User Manage -EN Learning Assistant-</title>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">
        $(function () {
        if (document.getElementById("manage") != null) {
            //管理员
            document.getElementById("manage").onclick = function () {
                document.getElementById("list").submit();
            }
        }
    });
    </script>
</head>
<body>
<c:if test="${not empty admin}"><%@include file="admin_nav.jsp"%></c:if>

<br><br>
<div class="page-header container">
    <h1>English Learning Assistant<small>  User List</small>
        <div class="text-right">
            <form class="navbar-form" action="${pageContext.request.contextPath}/AdminUserSelServlet" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" id="user_id" name="user_id" placeholder="Search id...">
                <button type="submit" class="btn btn-default">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                <c:if test="${not empty admin}">
                    <a type="submit" class="btn btn-default" href="javascript:void(0)" id="manage">
                        Manage</a>
                </c:if>
                </div>
            </form>
        </div>

    </h1>
</div>

<form id="list" action="${pageContext.request.contextPath}/AdminUserDisplayServlet" method="post">
<div class="table-responsive container">
    <c:if test="${not empty add_fail_msg}">
        <div class="alert alert-danger" role="alert">
            Error: 请检查是否成功选中用户
        </div>
    </c:if>
    <table class="table table-hover">
        <tr>
            <th>check</th>
            <th>id</th>
            <th>password</th>
            <th>name</th>
            <th>注册时间</th>
            <th>累计学习天数</th>
            <th>每日单词数</th>
            <th>单词选取方式</th>
        </tr>
        <c:forEach items="${users}" var="users" varStatus="s">
            <tr>
                <td><label>
                    <input type="radio" name="user" value="${users.user_id}">
                </label></td>
                <td>${users.user_id}</td>
                <td>${users.user_passwd}</td>
                <td>${users.user_name}</td>
                <td>${users.user_date}</td>
                <td>${users.user_learn}</td>
                <td>${users.user_words_num}</td>
                <td>${users.user_sel}</td>
            </tr>
        </c:forEach>

    </table>
</div>
</form>
<%@ include file="copyright.jsp"%>
</body>
</html>