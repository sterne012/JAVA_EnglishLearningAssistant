<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="bootstrap.jsp"%>
    <title>Skilled Word List -EN Learning Assistant-</title>

    <script>
        function rank_re(word){
            word=unescape(word);
            word=word.replace(/[ ]/g,"");//去空格
            if(confirm("confirm:将"+word+"移回生词表？")){
                window.location.href="${pageContext.request.contextPath}/List_ReServlet?word="+word;
            }
        }
    </script>
</head>
<body>
<c:if test="${not empty user}"><%@include file="user_nav.jsp"%></c:if>
<c:if test="${empty user}"><%@include file="nav.jsp"%></c:if>

<br><br>
<div class="page-header container">
    <h1>English Learning Assistant<small> Skilled Word List</small>
    </h1>
</div>

<div class="table-responsive container">
    <c:if test="${not empty rank_re}">
        <div class="alert alert-success" role="alert">
            Success!
        </div>
    </c:if>
    <table class="table table-hover">
        <tr>
            <th>status</th>
            <th>word</th>
            <th>symbol</th>
            <th>trans</th>
            <th>add date</th>
            <th>skilled date</th>
        </tr>
        <c:forEach items="${words}" var="words" varStatus="s">
        <tr>
            <td>
                <a class="btn btn-default btn-xs" type="submit" href="javascript:rank_re(escape('${words.word}'));">
                    <span class="glyphicon glyphicon-repeat" aria-hidden="true"></span>
                </a>
            </td>
            <td>${words.word}</td>
            <td>${words.symbol}</td>
            <td>${words.trans}</td>
            <td>${words.add_date}</td>
            <td>${words.del_date}</td>
        </tr>
        </c:forEach>

    </table>
</div>
<%@ include file="copyright.jsp"%>
</body>
</html>