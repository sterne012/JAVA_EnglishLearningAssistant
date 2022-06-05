<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="bootstrap.jsp"%>
    <title>Library -EN Learning Assistant-</title>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script>
        //nb!
        function play(word){
            word=unescape(word);
            word=word.replace(/[ ]/g,"");
            var media_list=document.getElementsByName("vocal_"+word);
            var media=media_list[0];
            media.load();
            media.play();
        }
        $(function (){
            // $("#vocal").click(function (){
            //     var media=$("#media")[0];
            //     media.load();
            //     media.play();
            // });
            //第一个框=全选
            document.getElementById("all").onclick=function () {
                var cbs = document.getElementsByName("word");
                for (var i = 0; i < cbs.length; i++) {
                    //设置cbs状态等于all的状态
                    cbs[i].checked = this.checked;
                }
            }

            if(document.getElementById("manage")!=null){
                //管理员
                document.getElementById("manage").onclick=function (){
                    document.getElementById("lib").action="${pageContext.request.contextPath}/AdminWordServlet";
                    document.getElementById("lib").submit();
                }
            }

            if(document.getElementById("AddToList")!=null) {
                //点添加的按钮
                document.getElementById("AddToList").onclick = function () {
                    document.getElementById("lib").action="${pageContext.request.contextPath}/SelWordServlet";
                    document.getElementById("lib").submit();
                }
            }


        });
    </script>
</head>
<body>
<c:if test="${not empty user}"><%@include file="user_nav.jsp"%></c:if>
<c:if test="${not empty admin}"><%@include file="admin_nav.jsp"%></c:if>
<c:if test="${empty user && empty admin}"><%@include file="nav.jsp"%>></c:if>

<br><br>
<div class="page-header container">
    <h1>English Learning Assistant<small> library</small></h1>
        <div class="text-right">
            <form class="navbar-form" action="${pageContext.request.contextPath}/PageServlet" method="post">
                <div class="input-group">
                    <c:if test="${empty ch_msg}">
                        <span class="input-group-addon">
                            <input type="radio" name="optionsRadios" id="radio1" value="English" checked>
                        </span>
                        <input type="text" class="form-control" name="EnInp" placeholder="English" value="${en_query}">

                        <span class="input-group-addon">
                            <input type="radio" name="optionsRadios" id="radio2" value="Chinese">
                        </span>
                        <input type="text" class="form-control" name="ChInp" placeholder="Chinese" value="${ch_query}">
                    </c:if>
                    <c:if test="${not empty ch_msg}">
                        <span class="input-group-addon">
                            <input type="radio" name="optionsRadios"  value="English" >
                        </span>
                        <input type="text" class="form-control" name="EnInp" placeholder="English" value="${en_query}">

                        <span class="input-group-addon">
                            <input type="radio" name="optionsRadios"  value="Chinese" checked>
                        </span>
                        <input type="text" class="form-control" name="ChInp" placeholder="Chinese" value="${ch_query}">
                    </c:if>
                </div>

                <button type="submit" class="btn btn-default">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                <c:if test="${not empty admin}">
                    <a type="submit" class="btn btn-default" href="javascript:void(0)" id="manage">
                        Manage</a>
                    <a type="submit" class="btn btn-default" href="${pageContext.request.contextPath}/admin_word_update.jsp" id="NewWord">
                        Add new word</a>
                </c:if>
                <c:if test="${not empty user}">
                <a type="submit" class="btn btn-default" href="javascript:void(0)" id="AddToList">
                    Add to List</a>
                </c:if>
                </div>
            </form>

</div>

<form id="lib" method="post">
<div class="table-responsive container">
    <c:if test="${not empty add_msg}">
        <div class="alert alert-success" role="alert">
                ${add_msg} <a href="${pageContext.request.contextPath}/List1Servlet" class="alert-link"> Go to word list...</a>
        </div>
    </c:if>
    <c:if test="${not empty add_fail_msg}">
    <div class="alert alert-danger" role="alert">
            Error: 请检查单词是否成功勾选
    </div>
    </c:if>
    <c:if test="${not empty duplicate_msg}">
        <div class="alert alert-danger" role="alert">
            Error: 被选中单词已在用户表中存在
        </div>
    </c:if>
    <table class="table table-hover">
        <tr>
            <th><label>
                <input type="checkbox" id="all">
            </label></th>
            <th>word</th>
            <th>symbol</th>
            <th>vocal</th>
            <th>trans</th>
            <th>frequency</th>
            <th>img</th>
        </tr>
        <c:forEach items="${pb.list}" var="words" varStatus="s">
            <tr>
                <td><label>
                    <input type="checkbox" name="word" value="${words.word}">
                </label></td>
                <td>${words.word}</td>
                <td>${words.symbol}</td>
                <td><a id="vocal" href="javascript:play(escape('${words.word}'))">
                    <span class="glyphicon glyphicon-volume-up" aria-hidden="true"></span>
                    <audio id="media" name="vocal_${words.word.trim()}" src="word/${words.word.trim()}.mp3"></audio>
                </a></td>
                <td>${words.trans}</td>
                <td>${words.frequency}</td>
                <td><img src="word/${words.word.trim()}.png" ></td>
            </tr>
        </c:forEach>
    </table>
    <nav aria-label="Page navigation" class="text-right">
        <p>total words: ${pb.totalCount}</p>
        <ul class="pagination">
<%--            <<符号--%>
                <c:if test="${pb.currentPage-1>=1}">
                    <li>
                        <a href="${pageContext.request.contextPath}/PageServlet?currentPage=${pb.currentPage-1}&rows=50&EnInp=${en_query}&ChInp=${ch_query}&optionsRadios=1" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${pb.currentPage-1<1}">
                    <li class="disabled">
                        <a aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
<%--            1...3456....114514--%>
            <c:if test="${pb.currentPage-3>1}">
                <li><a href="${pageContext.request.contextPath}/PageServlet?currentPage=1&rows=50&EnInp=${en_query}&ChInp=${ch_query}&optionsRadios=1">1</a></li>
                <li><a>...</a></li>
            </c:if>
            <c:forEach begin="${pb.currentPage-3>0?pb.currentPage-3:1}"
                       end="${pb.currentPage+3<=pb.totalPage?pb.currentPage+3:pb.totalPage}"
                       var="i">
                <c:if test="${pb.currentPage==i}">
                    <li class="active"><a href="${pageContext.request.contextPath}/PageServlet?currentPage=${i}&rows=50&EnInp=${en_query}&ChInp=${ch_query}&optionsRadios=1" >${i}</a></li>
                </c:if>
                <c:if test="${pb.currentPage!=i}">
                <li><a href="${pageContext.request.contextPath}/PageServlet?currentPage=${i}&rows=50&EnInp=${en_query}&ChInp=${ch_query}&optionsRadios=1" >${i}</a></li>
                </c:if>
            </c:forEach>
            <c:if test="${pb.currentPage+3<pb.totalPage}">
                <li><a>...</a></li>
                <li><a href="${pageContext.request.contextPath}/PageServlet?currentPage=${pb.totalPage}&rows=50&EnInp=${en_query}&ChInp=${ch_query}&optionsRadios=1">${pb.totalPage}</a></li>
            </c:if>

<%--            >>>>>--%>
            <c:if test="${pb.currentPage+1<=pb.totalPage}">
            <li>
                <a href="${pageContext.request.contextPath}/PageServlet?currentPage=${pb.currentPage+1}&rows=50&EnInp=${en_query}&ChInp=${ch_query}&optionsRadios=1" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
            </c:if>
            <c:if test="${pb.currentPage+1>pb.totalPage}">
                <li class="disabled">
                    <a aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
        </ul>
    </nav>
</div>
</form>
<%@ include file="copyright.jsp"%>
</body>
</html>