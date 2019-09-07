<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/4 0004
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-3.1.0.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript">

</script>

<body style="background-color: #2e6da4">
<div class="container" style="background-color: #2e6da4">
    <div class="row">
        <div class="col-md-4" style="height: 100px"><img src="${pageContext.request.contextPath}/img/4.png" width="%100"></div>
        <div class="col-md-8" style="height: 100px;">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>
                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="${pageContext.request.contextPath}/img/1.png" >
                    </div>
                    <div class="item">
                        <img src="${pageContext.request.contextPath}/img/2.png" >
                    </div>
                    <div class="item">
                        <img src="${pageContext.request.contextPath}/img/3.png" alt="...">
                    </div>
                </div>
                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div></div>
    </div>
</div>
</body>
</html>
