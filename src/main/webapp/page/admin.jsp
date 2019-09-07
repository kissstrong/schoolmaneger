<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/4 0004
  Time: 8:23
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
            var aid =${pageContext.request.getSession(true).getAttribute("aid")};
            $.ajax({
                url:"${pageContext.request.contextPath}/afindSelf?aid="+aid,
                success:function (result) {
                    var $tbody = $("#tbody");
                    $tbody.empty();
                    var table = $("<table border='1'cellpadding='0'cellspacing='1' style='width: 80%' class='table table-hover'></table>")
                    var tr =$("<tr></tr>");
                    tr.append("<td><span>工号：</span></td>");
                    tr.append("<td>"+result.aid+"</td>")
                    var tr1 =$("<tr></tr>");
                    tr1.append("<td><span>姓名：</span></td>");
                    tr1.append("<td>"+result.aname+"</td>")
                    var tr2 =$("<tr></tr>");
                    tr2.append("<td><span>密码：</span></td>");
                    tr2.append("<td>"+result.apassword+"</td>")
                    table.append(tr).append(tr1).append(tr2).appendTo($tbody)
                }
            })
        }
        function updatePassword() {
            var aid =${pageContext.request.getSession(true).getAttribute("aid")};
            $("#myModal").modal({
                backdrop:"static"
            })
            $("#confirm").click(function () {
                var val = $("#password").val();
                var val1 = $("#password1").val();
                if (val1==val&&val1!=""&&val!=""){
                    $.ajax({
                        url:"${pageContext.request.contextPath}/aupdatePassword?aid="+aid+"&password="+val
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
        function findAllteacher() {
            $.ajax({
                url:"${pageContext.request.contextPath}/findAllteacher",
                success:function (result) {
                    var $tbody = $("#tbody");
                    $tbody.empty();
                    var table = $("<table border='1'cellpadding='0'cellspacing='1' class='table table-hover' style='width: 80%'></table>")
                    var tr =$("<tr></tr>");
                    var cid;
                    tr.append("<th>工号</th>")
                        .append("<th>姓名</th>")
                        .appendTo(table);
                    $.each(result,function (index, item) {
                        var tr1 =$("<tr></tr>");
                        tr1.append("<td>"+item.tid+"</td>")
                            .append("<td>"+item.tname+"</td>")
                            .appendTo(table)
                    })
                    var tr2 =$("<tr></tr>");
                    tr2.append("<td colspan='3'><button onclick='addteacher()'>添加教师</button></td>")
                        .appendTo(table)
                    $tbody.append(table);
                }
            })
        }
        function addteacher() {

            $("#addteacher").modal({
                backdrop:"static"
            })
            $("#cconfirm").click(function () {
                var tname = $("#tname").val();
                var tpassword = $("#tpassword").val();
                $.ajax({
                    url:"${pageContext.request.contextPath}/addteacher?tname="+tname+"&tpassword="+tpassword,
                    success:function () {
                        alert("创建成功！")
                        $("#addteacher").modal('hide')
                    }
                })
            })
        }
        function findAllstudent() {
            $.ajax({
                url:"${pageContext.request.contextPath}/findAllstudent",
                success:function (result) {
                    var $tbody = $("#tbody");
                    $tbody.empty();
                    var table = $("<table border='1'cellpadding='0'cellspacing='1' class='table table-hover' style='width: 80%'></table>")
                    var tr =$("<tr></tr>");
                    var cid;
                    tr.append("<th>学号</th>")
                        .append("<th>姓名</th>")
                        .appendTo(table);
                    $.each(result,function (index, item) {
                        var tr1 =$("<tr></tr>");
                        tr1.append("<td>"+item.sid+"</td>")
                            .append("<td>"+item.sname+"</td>")
                            .appendTo(table)
                    })
                    var tr2 =$("<tr></tr>");
                    tr2.append("<td colspan='3'><button onclick='addstudent()'>添加学生</button></td>")
                        .appendTo(table)
                    $tbody.append(table);
                }
            })
        }
        function addstudent() {

            $("#addstudent").modal({
                backdrop:"static"
            })
            $("#sconfirm").click(function () {
                var sname = $("#sname").val();
                var spassword = $("#spassword").val();
                $.ajax({
                    url:"${pageContext.request.contextPath}/addstudent?sname="+sname+"&spassword="+spassword,
                    success:function () {
                        alert("创建成功！")
                        $("#addstudent").modal('hide')
                    }
                })
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
                    <tr ><td><a href="#" onclick="updatePassword()">改密码</a></td></tr><br>
                    <tr><td><a href="#" onclick="findAllteacher()">查询教师</a></td></tr><br>
                    <tr><td><a href="#" onclick="findAllstudent()">查询学生</a></td></tr><br>
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
<%--添加教师模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="addteacher">
    <form>
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">添加教师</h4>
                </div>
                <div class="modal-body">
                    姓名:<input type="text" name="tname" id="tname" placeholder="请输入姓名" ><br>
                    <br>
                    密码:<input type="text" name="tpassword" id="tpassword" placeholder="请输入密码" ><br>
                    <br>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="cconfirm">确认</button>
                </div>
            </div>
        </div>
    </form>
</div>
<%--添加学生模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="addstudent">
    <form>
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">添加学生</h4>
                </div>
                <div class="modal-body">
                    姓名:<input type="text" name="sname" id="sname" placeholder="请输入姓名" ><br>
                    <br>
                    密码:<input type="text" name="spassword" id="spassword" placeholder="请输入密码" ><br>
                    <br>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="sconfirm">确认</button>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>



