
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-3.1.0.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
<script>
    $(function () {
        $("#tbtn").click(function () {
            var role ="teacher"
            login(role)
        })
        $("#sbtn").click(function () {
            var role ="student"
            login(role)
        })
        $("#abtn").click(function () {
            var role ="admin"
            login(role)
        })
    })
    function login(role) {
        $('#myModal').modal({
            backdrop:"static"
        })
        $("#login").click(function () {
            var name = $("#name").val();
            var passowrd = $("#password").val();
            $.ajax({
                url:"${pageContext.request.contextPath}/"+role+"?name="+name+"&password="+passowrd,
                success:function (result) {
                   if (result=="error"){
                       alert("密码或用户名错误，请重新输入")
                       $("#name").val("");
                       $("#password").val("");
                   }else {
                       window.location.href="${pageContext.request.contextPath}/page/"+result+".jsp";
                   }
                }
            })
        })
    }
</script>
<body background="${pageContext.request.contextPath}/img/bg.jpg">
<div class="container">
    <div class="row">
        <div class="navbar-header">
            <button type="button" class="btn btn-primary btn-lg"  id="tbtn">
                教师登录
            </button>
            <button type="button" class="btn btn-primary btn-lg"  id="abtn">
                管理员登录
            </button>
            <button type="button" class="btn btn-primary btn-lg" id="sbtn">
                学生登录
            </button>
        </div>
    </div>
    <div class="row" style="height: fit-content" >
       <h1 align="center">欢迎来到盐城工学院教务处系统</h1>
        <div class="col-md-12">
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
<!-- 登录模态框 -->
<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
    <form>
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">用户登录</h4>
            </div>
            <div class="modal-body">
                姓名:<input type="text" name="name" id="name" placeholder="请输入姓名" ><br>
                <span id="span1"></span>
                <br>
                密码:<input type="text" name="name" id="password" placeholder="请输入密码"><br>
                <span id="span2" ></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="login">登录</button>
            </div>
        </div>
    </div>
    </form>
</div>
</body>
</html>
