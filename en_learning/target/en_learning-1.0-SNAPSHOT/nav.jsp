<%--
  Created by IntelliJ IDEA.
  User: 86138
  Date: 2022/5/8
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<nav class="navbar navbar-default  navbar-fixed-top navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">
                <img src="img/ico.jpg" href="index.jsp" width="35" height="25">
            </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/index.jsp">Home <span class="sr-only">(current)</span></a></li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Begin learning! <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/PageServlet">library...</a></li>
                        <li role="separator" class="divider"></li>
                        <li class="disabled"><a href="#">word list</a></li>
                        <li class="disabled"><a href="#">skilled word list</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left" action="${pageContext.request.contextPath}/PageServlet" method="post">
                <div class="form-group">
                    <input type="hidden" name="optionsRadios" id="radio1" value="English">
                    <input type="text" class="form-control" placeholder="Quick search.." name="EnInp" value="${en_query}">
                </div>
                <button type="submit" class="btn btn-default">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/login.jsp">Login</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>