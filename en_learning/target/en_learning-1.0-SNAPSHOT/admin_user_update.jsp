<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@ include file="bootstrap.jsp"%>
    <title>User Profile -EN Learning Assistant-</title>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#delete").click(function (){
                if(confirm("确定注销用户吗？")){
                    document.getElementById("form").action="${pageContext.request.contextPath}/AdminUserDelServlet";
                    document.getElementById("form").submit();
                }
            });

            $("#save").click(function () {
                var passwordText = $("#user_passwd").val();
                var passwordPatt = /^\w{1,16}$/;
                if(!passwordPatt.test(passwordText)) {
                    $("span.errorMsg").text("Error：密码不合法，请检查输入");
                    return false;
                }
                var nameText = $("#user_name").val();
                var namePatt = /^\w{1,20}$/;
                if(!namePatt.test(nameText)) {
                    $("span.errorMsg").text("Error：用户昵称最大为20位");
                    return false;
                }
                var learnText = $("#user_learn").val();
                var learnPatt = /^\d{1,1000}$/;
                if(!learnPatt.test(learnText)) {
                    $("span.errorMsg").text("Error：累计学习天数为非负整数！");
                    return false;
                }
                var wordsText = $("#user_words_num").val();
                var wordsPatt = /^[1-5]0$/;
                if(!wordsPatt.test(wordsText)) {
                    $("span.errorMsg").text("Error：每日单词数为10/20/30/40/50");
                    return false;
                }
                var selText = $("#user_sel").val();
                var selPatt = /^[1-4]$/;
                if(!selPatt.test(selText)) {
                    $("span.errorMsg").text("Error：单词抽选方式取值范围1-4");
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
    <h1>English Learning Assistant<small> User profile</small>
    </h1>
</div>


<form id="form" class="form-horizontal container" action="${pageContext.request.contextPath}/AdminUserUpdateServlet" method="post">
    <c:if test="${not empty profile_msg}">
        <div class="alert alert-success" role="alert">
            <strong>${profile_msg}</strong>
        </div>
    </c:if>
    <div class="form-group">
        <span class="errorMsg" style="color:darkred"></span>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">user id</label>
        <div class="col-sm-10">
            <input type="hidden" id="user_id" name="user_id" value="${user.user_id}">
            <p class="form-control-static">${user.user_id}</p>
        </div>
    </div>
    <div class="form-group">
        <label for="user_passwd" class="col-sm-2 control-label">password</label>
        <div class="col-sm-10" id="div_user_passwd">
            <input type="text" class="form-control" value="${user.user_passwd}" id="user_passwd" name="user_passwd">
        </div>
    </div>
    <div class="form-group">
        <label for="user_name" class="col-sm-2 control-label">name</label>
        <div class="col-sm-10" id="div_user_name">
            <input type="text" class="form-control" value="${user.user_name}" id="user_name" name="user_name">
        </div>
    </div>
    <div class="form-group">
        <label for="user_date" class="col-sm-2 control-label">注册时间</label>
        <div class="col-sm-10" id="div_user_date">
            <input type="text" class="form-control" value="${user.user_date}" id="user_date" name="user_date">
        </div>
    </div>
    <div class="form-group">
        <label for="user_date" class="col-sm-2 control-label">累计学习天数</label>
        <div class="col-sm-10" id="div_user_learn">
            <input type="text" class="form-control" value="${user.user_learn}" id="user_learn" name="user_learn">
        </div>
    </div>
    <div class="form-group">
        <label for="user_date" class="col-sm-2 control-label">每日单词数</label>
        <div class="col-sm-10" id="div_user_words_num">
            <input type="text" class="form-control" value="${user.user_words_num}" id="user_words_num" name="user_words_num">
        </div>
    </div>
    <div class="form-group">
        <label for="user_date" class="col-sm-2 control-label">单词抽选方式</label>
        <div class="col-sm-10" id="div_user_sel">
            <input type="text" class="form-control" value="${user.user_sel}" id="user_sel" name="user_sel">
            <label>（1=词库字典序正序（从a开始）；2=词库字典序倒序（从z开始）；3=词频最高优先；4=随机抽取）</label>
        </div>
    </div>

    <br>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <a class="btn btn-link" href="${pageContext.request.contextPath}/AdminUserServlet">Back</a>
            <button type="submit" class="btn btn-primary" id="save">Save</button>
            <button type="submit" class="btn btn-default" id="delete">Delete</button>
        </div>
    </div>
</div>

</form>

<%@ include file="copyright.jsp"%>
</body>
</html>