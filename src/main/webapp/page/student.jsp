<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/4 0004
  Time: 8:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-3.1.0.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
<html>
<head>
    <style>
        #table{
            padding-top: 0;
        }
    </style>
    <title>Title</title>
    <script>
    function findMsg() {
            var sid =${pageContext.request.getSession(true).getAttribute("sid")};
        $.ajax({
            url:"${pageContext.request.contextPath}/sfindSelf?sid="+sid,
            success:function (result) {
                var $tbody = $("#tbody");
                $tbody.empty();
                var table = $("<table border='1'cellpadding='0'cellspacing='1' class='table table-hover' style='width: 80%'></table>")
                var tr =$("<tr></tr>");
                tr.append("<td><span>学号：</span></td>");
                tr.append("<td>"+result.sid+"</td>")
                var tr1 =$("<tr></tr>");
                tr1.append("<td><span>姓名：</span></td>");
                tr1.append("<td>"+result.sname+"</td>")
                var tr2 =$("<tr></tr>");
                tr2.append("<td><span>密码：</span></td>");
                tr2.append("<td>"+result.spassword+"</td>")
                table.append(tr).append(tr1).append(tr2).appendTo($tbody)
            }
        })
    }
    function findSelectedCourse() {
             var sid =${pageContext.request.getSession(true).getAttribute("sid")};
           $.ajax({
            url:"${pageContext.request.contextPath}/findSelectedCourse?sid="+sid,
            success:function (result) {
                var $tbody = $("#tbody");
                $tbody.empty();
                var table = $("<table border='1'cellpadding='0'cellspacing='1' class='table table-hover' style='width: 80%'></table>")
                var tr =$("<tr></tr>");
                tr.append("<th>课程号</th>")
                    .append("<th>课程名</th>")
                    .append("<th>课程成绩</th>").appendTo(table);
                $.each(result,function (index, item) {
                    var tr1 =$("<tr></tr>");
                    tr1.append("<td>"+item.cid+"</td>")
                        .append("<td>"+item.cname+"</td>")
                        .append("<td>"+item.cgrade+"</td>").appendTo(table)
                })
                $tbody.append(table);
            }
        })
    }
    function updatePassword() {
        var sid =${pageContext.request.getSession(true).getAttribute("sid")};
        $("#myModal").modal({
            backdrop:"static"
        })
        $("#confirm").click(function () {
            var val = $("#password").val();
            var val1 = $("#password1").val();
            if (val1==val&&val1!=""&&val!=""){
                $.ajax({
                    url:"${pageContext.request.contextPath}/updatePassword?sid="+sid+"&password="+val
                })
                $('#myModal').modal('hide')
                alert("密码已更改，请重新登陆")
                window.location.href="${pageContext.request.contextPath}/index.jsp"
            }else {
                alert("两次密码输入不一致或为空，请重新输入");
                $("#password").val("");
                $("#password1").val("");

            }

        })
    }
    function chooseCourse() {
        var sid =${pageContext.request.getSession(true).getAttribute("sid")};
        $.ajax({
            url:"${pageContext.request.contextPath}/findCourse",
            success:function (result) {
                var $tbody = $("#tbody");
                $tbody.empty();
                var table = $("<table border='1'cellpadding='0'cellspacing='1' class='table table-hover' style='width: 80%'></table>")
                var tr =$("<tr></tr>");
                var cid;
                tr.append("<th>课程号</th>")
                    .append("<th>课程名</th>")
                    .append("<th>课程信息</th>")
                    .append("<th>选课</th>")
                    .appendTo(table);
                $.each(result,function (index, item) {
                    var tr1 =$("<tr></tr>");
                    cid = item.cid;
                    tr1.append("<td>"+item.cid+"</td>")
                        .append("<td>"+item.cname+"</td>")
                        .append("<td>"+item.cmsg+"</td>")
                        .append($("<button >加入学习</button>").attr("id",cid).attr("class","sbtn").appendTo($("<td></td>")))
                        .appendTo(table)

                })
                $tbody.append(table);
            }
        })
    }
    $(document).on("click",".sbtn",function () {
        var id = $(this).attr("id");
        joinstudy(id)
    })
    function joinstudy(cid) {
        var sid =${pageContext.request.getSession(true).getAttribute("sid")};
        alert("选课")
        $.ajax({
            url:"${pageContext.request.contextPath}/joinstudy?sid="+sid+"&cid="+cid,
            success:function (result) {
                alert("加入成功！")
            }
        })

    }

    </script>
</head>
<body >
<table  border="1" cellpadding="0" width="100%" style="height: 100%" >
    <div class="container-fluid"></div>
    <tr>
        <div class="col-md-4">
            <td width="30%" >
                <table  cellpadding="0"cellspacing="0" style="padding-top: auto" width="100%" id="table" class='table table-hover'>
                <tr><td><a href="${pageContext.request.contextPath}">返回主页面</a></td></tr>
                <tr ><td><a href="#" onclick="findMsg()">查看个人信息</a></td></tr><br>
                <tr ><td><a href="#" onclick="findSelectedCourse()">查看选课情况</a></td></tr><br>
                <tr ><td><a href="#" onclick="chooseCourse()">选课</a></td></tr><br>
                <tr ><td><a href="#" onclick="updatePassword()">改密码</a></td></tr><br>
            </table>
        </td>
       </div>
        <div class="col-md-8">
        <td id="tbody" width="70%">

        </td>
        </div>
    </tr>
    </div>
</table>

<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
    <form>
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">更改密码</h4>
                </div>
                <div class="modal-body">
                    新密码:<input type="text" name="newpwd" id="password" placeholder="请输入新密码" ><br>
                    <span id="span1"></span>
                    <br>
                    确认密码:<input type="text" name="newpsw1" id="password1" placeholder="请确认新密码密码"><br>
                    <span id="span2" ></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="confirm">确认</button>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>
