<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="bootstrap.jsp"%>
    <title>Plan -EN Learning Assistant-</title>
</head>
<body>
<c:if test="${not empty user}"><%@include file="user_nav.jsp"%></c:if>
<c:if test="${empty user}"><%@include file="nav.jsp"%></c:if>

<br><br>
<div class="page-header container">
    <h1>English Learning Assistant<small> Learning Plan</small>
    </h1>
</div>

<form class="form-horizontal container" action="${pageContext.request.contextPath}/DayPlanServlet" method="post">
    <div class="form-group">
        <label class="col-sm-2 control-label">今日单词数</label>
        <div class="col-sm-4">
            <select name="user_words_num" class="form-control">
                <c:if test="${user.user_words_num==10}">
                    <option value="10" selected>10</option>
                    <option value="20" >20</option>
                    <option value="30" >30</option>
                    <option value="40" >40</option>
                    <option value="50" >50</option>
                </c:if>
                <c:if test="${user.user_words_num==20}">
                    <option value="10" >10</option>
                    <option value="20" selected>20</option>
                    <option value="30" >30</option>
                    <option value="40" >40</option>
                    <option value="50" >50</option>
                </c:if>
                <c:if test="${user.user_words_num==30}">
                    <option value="10" >10</option>
                    <option value="20" >20</option>
                    <option value="30" selected>30</option>
                    <option value="40" >40</option>
                    <option value="50" >50</option>
                </c:if>
                <c:if test="${user.user_words_num==40}">
                    <option value="10" >10</option>
                    <option value="20" >20</option>
                    <option value="30" >30</option>
                    <option value="40" selected>40</option>
                    <option value="50" >50</option>
                </c:if>
                <c:if test="${user.user_words_num==50}">
                    <option value="10" >10</option>
                    <option value="20" >20</option>
                    <option value="30" >30</option>
                    <option value="40" >40</option>
                    <option value="50" selected>50</option>
                </c:if>

            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">单词抽选方式</label>
        <div class="col-sm-10">
            <c:if test="${user.user_sel==1}">
            <label class="radio-inline">
                <input type="radio" name="user_sel" value="1" checked> 1.词库字典序正序（从a开始）
            </label>
            <label class="radio-inline">
                <input type="radio" name="user_sel" value="2"> 2.词库字典序倒序（从z开始）
            </label>
            <label class="radio-inline">
                <input type="radio" name="user_sel" value="3"> 3.词频最高优先
            </label>
            <label class="radio-inline">
                <input type="radio" name="user_sel"  value="4"> 4.随机抽取
            </label>
            </c:if>

            <c:if test="${user.user_sel==2}">
                <label class="radio-inline">
                    <input type="radio" name="user_sel" value="1" > 1.词库字典序正序（从a开始）
                </label>
                <label class="radio-inline">
                    <input type="radio" name="user_sel" value="2" checked> 2.词库字典序倒序（从z开始）
                </label>
                <label class="radio-inline">
                    <input type="radio" name="user_sel" value="3"> 3.词频最高优先
                </label>
                <label class="radio-inline">
                    <input type="radio" name="user_sel"  value="4"> 4.随机抽取
                </label>
            </c:if>

            <c:if test="${user.user_sel==3}">
                <label class="radio-inline">
                    <input type="radio" name="user_sel" value="1" > 1.词库字典序正序（从a开始）
                </label>
                <label class="radio-inline">
                    <input type="radio" name="user_sel" value="2"> 2.词库字典序倒序（从z开始）
                </label>
                <label class="radio-inline">
                    <input type="radio" name="user_sel" value="3" checked> 3.词频最高优先
                </label>
                <label class="radio-inline">
                    <input type="radio" name="user_sel"  value="4"> 4.随机抽取
                </label>
            </c:if>

            <c:if test="${user.user_sel==4}">
                <label class="radio-inline">
                    <input type="radio" name="user_sel" value="1" > 1.词库字典序正序（从a开始）
                </label>
                <label class="radio-inline">
                    <input type="radio" name="user_sel" value="2"> 2.词库字典序倒序（从z开始）
                </label>
                <label class="radio-inline">
                    <input type="radio" name="user_sel" value="3"> 3.词频最高优先
                </label>
                <label class="radio-inline">
                    <input type="radio" name="user_sel"  value="4" checked> 4.随机抽取
                </label>
            </c:if>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <a class="btn btn-default" href="${pageContext.request.contextPath}/home.jsp" id="back">Back</a>
            <button type="submit" class="btn btn-primary" id="save">Save</button>
        </div>
    </div>
    <c:if test="${not empty msg}">
        <div class="alert alert-success" role="alert">
            Success!<a class="alert-link" href="${pageContext.request.contextPath}/DayServlet"> now begin...</a>
        </div>
    </c:if>
</form>
</body>
</html>