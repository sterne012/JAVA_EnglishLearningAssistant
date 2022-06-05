<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@ include file="bootstrap.jsp"%>
    <title>Profile -EN Learning Assistant-</title>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#delete").click(function (){
                if($("#hideword").val()!=null){
                if(confirm("确定删除单词吗？")){
                    document.getElementById("form").action="${pageContext.request.contextPath}/AdminWordDelServlet";
                    document.getElementById("form").submit();
                }
                }
                else{
                    $("span.errorMsg").text("Error：未添加的单词不能删除！");
                    return false;
                }
            });

            $("#save").click(function () {
                var wordText = $("#word").val();
                if(wordText==null){
                    $("span.errorMsg").text("Error：单词不能为空！");
                    return false;
                }
                var wordPatt = /^\w{1,40}$/;
                if(!wordPatt.test(wordText)) {
                    $("span.errorMsg").text("Error：单词格式不合法");
                    return false;
                }
                var freText = $("#frequency").val();
                var frePatt = /^\d{1,99999}$/;
                if(!frePatt.test(freText)) {
                    $("span.errorMsg").text("Error：词频必须为非负整数");
                    return false;
                }
                $("span.errorMsg").text("");
            });
        });
    </script>
</head>
<body>
<c:if test="${not empty admin}"><%@include file="admin_nav.jsp"%></c:if>
<br><br>
<div class="page-header container">
    <h1>English Learning Assistant<small> My profile</small>
    </h1>
</div>


<form id="form" class="form-horizontal container" action="${pageContext.request.contextPath}/AdminWordUpdateServlet" method="post">
    <c:if test="${not empty profile_msg}">
        <div class="alert alert-success" role="alert">
            <strong>${profile_msg}</strong>
        </div>
    </c:if>
    <div class="form-group">
        <span class="errorMsg" style="color:darkred"></span>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">word</label>
        <c:if test="${not empty word}">
        <div class="col-sm-10">
            <input type="hidden" name="word" id="hideword" value="${word.word}">
            <p class="form-control-static">${word.word}</p>
        </div>
        </c:if>
        <c:if test="${empty word}">
            <div class="col-sm-10">
                <input type="text" class="form-control" id="word" name="word">
            </div>
        </c:if>
    </div>
    <div class="form-group">
        <label for="symbol" class="col-sm-2 control-label">symbol</label>
        <div class="col-sm-10" id="div_symbol">
            <input type="text" class="form-control" value="${word.symbol}" id="symbol" name="symbol">
        </div>
    </div>
    <div class="form-group">
        <label for="trans" class="col-sm-2 control-label">translate</label>
<%--        不显示中文是为什么呢--%>
        <div class="col-sm-10" id="div_trans">
            <input type="text" class="form-control" value="${word.trans}" id="trans" name="trans">
        </div>
    </div>
    <div class="form-group">
        <label for="frequency" class="col-sm-2 control-label">frequency</label>
        <div class="col-sm-10" id="div_frequency">
            <input type="text" class="form-control" value="${word.frequency}" id="frequency" name="frequency">
        </div>
    </div>


    <br>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <a class="btn btn-link" href="${pageContext.request.contextPath}/PageServlet">Back</a>
            <button type="submit" class="btn btn-primary" id="save">Save</button>
            <a type="submit" class="btn btn-default" href="javascript:void(0)" id="delete">Delete</a>
        </div>
    </div>
</div>

</form>

<%@ include file="copyright.jsp"%>
</body>
</html>