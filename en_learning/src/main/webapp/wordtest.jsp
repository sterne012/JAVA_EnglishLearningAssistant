<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="bootstrap.jsp"%>
    <title>Test -EN Learning Assistant-</title>

</head>
<body>
<c:if test="${not empty user}"><%@include file="user_nav.jsp"%></c:if>
<c:if test="${empty user}"><%@include file="nav.jsp"%></c:if>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
    $(function () {
        $("#check").click(function () {
            var ans=document.getElementsByName("word_answer");
            var inp=document.getElementsByName("word");
            for(var i=0;i<ans.length;i++){
                if(ans[i].value.trim()==inp[i].value.trim()){
                    alert(i+1+":正确，"+ans[i].value.trim());
                }
                else{
                    alert(i+1+":错误，"+ans[i].value.trim());
                }
            }
        });
    });

</script>

<br><br>
<div class="page-header container">
    <h1>English Learning Assistant<small>  Word test</small></h1>
</div>

<%--还没写校验--%>
<form class="form-horizontal container" action="#" method="post">
    <c:forEach items="${words}" var="words" varStatus="s">
    <div class="form-group">
        <div class="col-sm-2" >
            <input type="hidden" name="word_answer" value="${words.word}">
            <input type="text" class="form-control" name="word" placeholder="输入单词">
        </div>
        <label class="col-sm-10">${words.trans}</label>

    </div>
    </c:forEach>
    <br>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <a class="btn btn-default" href="${pageContext.request.contextPath}/home.jsp" id="back">Back</a>
            <button  class="btn btn-primary" id="check">Check</button>
        </div>
    </div>

</form>


</body>
</html>