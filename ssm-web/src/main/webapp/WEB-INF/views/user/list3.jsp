<%--
  Created by IntelliJ IDEA.
  User: zhouzheng
  Date: 2024/10/22
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/bootstrap-datepicker.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap-datepicker.js" type="text/javascript"></script>
</head>
<body>


<!-- Add Modal -->
<div aria-labelledby="myModalLabel" class="modal fade" id="addModel" role="dialog"
     tabindex="-1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">用户添加</h4>
            </div>

            <div class="modal-body">
                <form class="form-horizontal" id="addUserForm">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="name">用户名称</label>
                        <div class="col-sm-10">
                            <input class="form-control" id="name" name="name"
                                   placeholder="用户名称" type="text">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label"
                               for="password">用户密码</label>
                        <div class="col-sm-10">
                            <input class="form-control" id="password" name="password"
                                   placeholder="用户密码"
                                   type="password">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label"
                               for="password">用户薪资</label>
                        <div class="col-sm-10">
                            <input class="form-control" id="salary" name="salary"
                                   placeholder="用户薪资"
                                   type="text">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label"
                               for="password">用户生日</label>
                        <div class="col-sm-10">
                            <input class="form-control" id="birthday" name="birthday"
                                   placeholder="用户生日"
                                   type="text">
                        </div>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal" type="button">关闭
                </button>
                <button class="btn btn-primary" id="addUserBtn" type="button">添加</button>
            </div>
        </div>
    </div>
</div>


<div class="container">

    <!--标题部分-->
    <div class="col-md-12">
        <h1>SSM-CRUD</h1>
    </div>

    <!--按钮部分 菜单部分-->
    <div class="col-md-offset-6">
        <button class="btn btn-success" id="addUserModelBtn">添加</button>
        <button class="btn btn-info">搜索</button>
    </div>

    <!--表格数据部分-->
    <div class="col-md-8">
        <table class="table table-striped" id="userTable">
            <thead>
            <tr>
                <th>用户编号</th>
                <th>用户名称</th>
                <th>用户密码</th>
                <th>用户薪资</th>
                <th>用戶生日</th>
                <th>相關操作</th>
            </tr>
            </thead>

            <tbody>

            </tbody>
        </table>
    </div>

    <div class="col-md-8">
        <div class="col-md-6">分頁信息</div>
        <div class="col-md-offset-10">分頁導航條</div>

    </div>
</div>

<script type="text/javascript">
    function initUserTable() {

        // 清空tbody
        $("#userTable tbody").empty();

        $.ajax({
            url: "${pageContext.request.contextPath}/users",
            type: "GET",
            dataType: "json",
            success: function (resp) {
                let users = resp.data;

                $.each(users, function (index, user) {
                    let idTd = $("<td></td>").append(user.id);
                    let nameTd = $("<td></td>").append(user.name);
                    let passwordTd = $("<td></td>").append(user.password);
                    let salaryTd = $("<td></td>").append(user.salary);
                    let birthdayTd = $("<td></td>").append(user.birthday);

                    let actionTd = $("<td></td>");
                    let editBtn = $("<button></button>").addClass("btn btn-primary").append("修改");
                    let deleteBtn = $("<button></button>").addClass("btn btn-danger").append("删除");
                    actionTd.append(editBtn).append(deleteBtn);

                    $("<tr></tr>").append(idTd).append(nameTd).append(passwordTd).append(salaryTd).append(birthdayTd).append(actionTd).appendTo("tbody");
                });

            },
        })
    }

    $(function () {
        initUserTable();


        $("#birthday").datepicker({
            language: 'zh-CN', //语言
            autoclose: true, //选择后自动关闭
            clearBtn: true,//清除按钮
            format: "yyyy-mm-dd"//日期格式
        })

        /*添加的处理*/
        /*$("#addUserBtn").click(function () {

            // name=xxx&password=admin&salary-12.34&birthday=1234-12-12
            let userQueryString = $("#addUserForm").serialize();

            $.ajax({
                url: "



        ${pageContext.request.contextPath}/users",
                type: "POST",
                dataType: "json",
                data: userQueryString,
                success: function (resp) {
                    let code = resp.code;
                    let flag = resp.flag;

                    if (code == 200 && flag == "true") {
                        // 弹窗
                        alert("用户添加成功");

                        // 关闭模态窗
                        $("addModel").modal('hide');

                        // 重新加载数据
                        initUserTable();
                    }
                }
            })
        });*/

        /*打开模态窗体*/
        $("#addUserModelBtn").click(function () {
            // 打开模态窗体
            $("#addModel").modal('show');

            // 清空表单域的数据
            // jquery对象------>DOM对象
            $("#addUserForm")[0].reset();
        });


        /*添加的处理*/
        $("#addUserBtn").click(function () {

            let userJSON = {
                name: $("#name").val(),
                password: $("#password").val(),
                salary: $("#salary").val(),
                birthday: $("#birthday").val()
            }
            let userJSONString = JSON.stringify(userJSON);

            $.ajax({
                url: "${pageContext.request.contextPath}/users",
                type: "POST",
                dataType: "json",
                contentType: "application/json",
                data: userJSONString,
                success: function (resp) {
                    let code = resp.code;
                    let flag = resp.flag;

                    if (code == 200 && flag == "true") {
                        // 弹窗
                        alert("用户添加成功");

                        // 关闭模态窗
                        $("#addModel").modal('hide');

                        // 重新加载数据
                        initUserTable();
                    }
                }
            })
        });


    });
</script>


</body>
</html>
