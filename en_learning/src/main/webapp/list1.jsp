<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="bootstrap.jsp"%>
    <title>Word List -EN Learning Assistant-</title>

    <script>
        function rank_move(word){
            //弹框提示
            word=unescape(word);
            word=word.replace(/[ ]/g,"");//去空格
            if(confirm("confirm:将"+word+"移到熟词表？")){
                window.location.href="${pageContext.request.contextPath}/List_MoveServlet?word="+word;
            }
        }
        function rank_up(word,rank){
            word=unescape(word);
            word=word.replace(/[ ]/g,"");
            if(rank==10) {
                alert("rank最大为10");
            }
            else{
                window.location.href="${pageContext.request.contextPath}/List_UpServlet?word="+word;
            }
        }
        function rank_down(word,rank){
            word=unescape(word);
            word=word.replace(/[ ]/g,"");
            if(rank==0){
                alert("rank最小为0");
            }
            else{
                window.location.href="${pageContext.request.contextPath}/List_DownServlet?word="+word;
            }
        }

    </script>
</head>
<body>
<c:if test="${not empty user}"><%@include file="user_nav.jsp"%></c:if>
<c:if test="${empty user}"><%@include file="nav.jsp"%></c:if>

<br><br>
<div class="page-header container">
    <h1>English Learning Assistant<small> Word List</small>
    </h1>
</div>

<from id="list" action="${pageContext.request.contextPath}/List_MoveServlet" method="post">
<div class="table-responsive container">
    <c:if test="${not empty begin_msg}">
        <div class="alert alert-success" role="alert">
            Success!<br>
            your base plan: ${user.user_words_num} words per day; <a  class="alert-link" href="${pageContext.request.contextPath}/learn.jsp">here to revise...</a>
        </div>
    </c:if>
    <c:if test="${not empty rank_move}">
        <div class="alert alert-success" role="alert">
                Success! Today learned words=${user.user_learned}! <a href="${pageContext.request.contextPath}/List2Servlet" class="alert-link"> Go to skilled word list...</a>
        </div>
    </c:if>
    <c:if test="${not empty rank_up}">
        <div class="alert alert-success" role="alert">
            Success rank up!
        </div>
    </c:if>
    <c:if test="${not empty rank_down}">
        <div class="alert alert-success" role="alert">
            Success rank down!
        </div>
    </c:if>
<%--    daka:完成学习数时触发--%>
    <c:if test="${not empty daka}">
        <div class="alert alert-success" role="alert">
            <a  class="alert-link" href="${pageContext.request.contextPath}/daka.jsp">已完成学习目标，点这里打卡</a>
        </div>
    </c:if>
    <table class="table table-hover">
        <tr>
            <th>status</th>
            <th>rank</th>
            <th>word</th>
            <th>symbol</th>
            <th>vocal</th>
            <th>trans</th>
            <th>add date</th>
        </tr>

        <c:forEach items="${words}" var="words" varStatus="s">
        <tr>
            <td>
                <%--                学会了--%>
                <a class="btn btn-default btn-xs" type="submit" id="learned" href="javascript:rank_move(escape('${words.word}'));">
                    <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                </a>
            </td>
            <td>
                <%--                rank加--%>
                <a class="btn btn-default btn-xs" type="submit" id="rankup" href="javascript:rank_up(escape('${words.word}'),${words.rank})">
                    <span class="glyphicon glyphicon-triangle-top" aria-hidden="true"></span>
                </a>
                ${words.rank}
                <%--                rank减--%>
                <a class="btn btn-default btn-xs" type="submit" id="rankdown" href="javascript:rank_down(escape('${words.word}'),${words.rank})">
                    <span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span>
                </a>
            </td>
            <td>${words.word}</td>
            <td>${words.symbol}</td>
<%--            发音--%>
            <td><button>
                <span class="glyphicon glyphicon-volume-up" aria-hidden="true"></span>
            </button></td>
            <td>${words.trans}</td>
            <td>${words.add_date}</td>
        </tr>
        </c:forEach>

    </table>
</div>
</from>
<%@ include file="copyright.jsp"%>
</body>
</html>