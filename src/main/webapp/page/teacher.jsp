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
            var tid =${pageContext.request.getSession(true).getAttribute("tid")};
            $.ajax({
                url:"${pageContext.request.contextPath}/tfindSelf?tid="+tid,
                success:function (result) {
                    var $tbody = $("#tbody");
                    $tbody.empty();
                    var table = $("<table border='1'cellpadding='0'cellspacing='1' style='width: 80%' class='table table-hover'></table>")
                    var tr =$("<tr></tr>");
                    tr.append("<td><span>工号：</span></td>");
                    tr.append("<td>"+result.tid+"</td>")
                    var tr1 =$("<tr></tr>");
                    tr1.append("<td><span>姓名：</span></td>");
                    tr1.append("<td>"+result.tname+"</td>")
                    var tr2 =$("<tr></tr>");
                    tr2.append("<td><span>密码：</span></td>");
                    tr2.append("<td>"+result.tpassword+"</td>")
                    table.append(tr).append(tr1).append(tr2).appendTo($tbody)
                }
            })
        }
        function updatePassword() {
            var tid =${pageContext.request.getSession(true).getAttribute("tid")};
            $("#myModal").modal({
                backdrop:"static"
            })
            $("#confirm").click(function () {
                var val = $("#password").val();
                var val1 = $("#password1").val();
                if (val1==val&&val1!=""&&val!=""){
                    $.ajax({
                        url:"${pageContext.request.contextPath}/tupdatePassword?tid="+tid+"&password="+val
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
        function findAllCourse() {
            $.ajax({
                url:"${pageContext.request.contextPath}/tfindAllCourse",
                success:function (result) {
                    var $tbody = $("#tbody");
                    $tbody.empty();
                    var table = $("<table border='1'cellpadding='0'cellspacing='1' style='width: 80%' class='table table-hover'></table>")
                    var tr =$("<tr></tr>");
                    var cid;
                    tr.append("<th>课程号</th>")
                        .append("<th>课程名</th>")
                        .append("<th>课程信息</th>")
                        .appendTo(table);
                    $.each(result,function (index, item) {
                        var tr1 =$("<tr></tr>");
                        tr1.append("<td>"+item.cid+"</td>")
                            .append("<td>"+item.cname+"</td>")
                            .append("<td>"+item.cmsg+"</td>")
                            .appendTo(table)
                    })
                    var tr2 =$("<tr></tr>");
                    tr2.append("<td colspan='3'><button onclick='addCourse()'>添加课程</button></td>")
                        .appendTo(table)
                    $tbody.append(table);
                }
            })
        }
        function addCourse() {

            $("#addCourse").modal({
                backdrop:"static"
            })
            $("#cconfirm").click(function () {
                var cname = $("#cname").val();
                var cmsg = $("#cmsg").val();
                $.ajax({
                    url:"${pageContext.request.contextPath}/addCourse?cname="+cname+"&cmsg="+cmsg,
                    success:function () {
                        alert("创建成功！")
                        $("#addCourse").modal('hide')
                    }
                })
            })

        }
        function findstudentmsg() {
            $.ajax({
                url:"${pageContext.request.contextPath}/tfindallstudent",
                success:function (result) {
                    var $tbody = $("#tbody");
                    $tbody.empty();
                    var table = $("<table border='1'cellpadding='0'cellspacing='1' class='table table-hover' style='width: 80%'></table>")
                    var tr =$("<tr></tr>");
                    tr.append("<th>学号</th>")
                        .append("<th>姓名</th>")
                        .append("<th>查看选课情况</th>")
                        .appendTo(table);
                    $.each(result,function (index, item) {
                        var tr1 =$("<tr></tr>");
                        tr1.append("<td>"+item.sid+"</td>")
                            .append("<td>"+item.sname+"</td>")
                            .append($("<td></td>").append($("<button>查看选课情况</button>").attr("class","btn").attr("id",item.sid)))
                            .appendTo(table)
                    })
                    $tbody.append(table);
                }
            })
        }
        $(document).on("click",".btn",function () {
            var sid = $(this).attr("id");
            showstudentcourse(sid)
        })
        function showstudentcourse(sid) {
            $.ajax({
                url:"${pageContext.request.contextPath}/showstudentcourse?sid="+sid,
                success:function (result) {
                    var $tbody = $("#tbody");
                    $tbody.empty();
                    var table = $("<table border='1'cellpadding='0'cellspacing='1' style='width: 80%' class='table table-hover'></table>")
                    var tr =$("<tr></tr>");
                    tr.append("<th>课程号</th>")
                        .append("<th>课程名</th>")
                        .append("<th>分数</th>")
                        .append("<th>打分/修改分数</th>")
                        .appendTo(table);
                    $.each(result,function (index, item) {
                        var tr1 =$("<tr></tr>");
                        tr1.append("<td>"+item.cid+"</td>")
                            .append("<td>"+item.cname+"</td>")
                            .append($("<input type='text' name='grade' >").attr("value",item.cgrade).attr("class","grade").appendTo("<td></td>"))
                            .append($("<td></td>").append($("<button>修改分数/打分</button>").attr("class","btn1").attr("id",item.cid).attr("sid",item.sid)))
                            .appendTo($("<form></form>"))
                            .appendTo(table)
                    })
                    $tbody.append(table);
                }
            })
        }
        var cgrade;
        var cid;
        var sid;
        $(document).on("change",".grade",function () {
             cgrade = $(this).val();
        })
        $(document).on("click",".btn1",function () {
          cid = $(this).attr("id");
          sid = $(this).attr("sid");
            updateGrade();
        })
        function updateGrade() {
            $.ajax({
                url:"${pageContext.request.contextPath}/updategrade?sid="+sid+"&cid="+cid+"&cgrade="+cgrade,
                success:function () {
                    alert("打分或改分成功！")
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
                    <tr ><td><a href="#" onclick="findstudentmsg()">查看学生信息</a></td></tr><br>
                    <tr ><td><a href="#" onclick="findAllCourse()">查看课程</a></td></tr><br>
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
<%--改密码模态框--%>
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
<%--添加课程模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="addCourse">
    <form>
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">添加课程</h4>
                </div>
                <div class="modal-body">
                    课程名:<input type="text" name="newpwd" id="cname" placeholder="请输入课程名" ><br>

                    <br>
                    课程信息:<input type="text" name="newpsw1" id="cmsg" placeholder="请输入课程信息"><br>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="cconfirm">确认</button>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>
