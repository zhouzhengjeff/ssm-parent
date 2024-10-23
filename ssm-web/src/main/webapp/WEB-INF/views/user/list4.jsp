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
                               for="salary">用户薪资</label>
                        <div class="col-sm-10">
                            <input class="form-control" id="salary" name="salary"
                                   placeholder="用户薪资"
                                   type="text">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label"
                               for="birthday">用户生日</label>
                        <div class="col-sm-10">
                            <input class="form-control" id="birthday" name="birthday"
                                   placeholder="用户生日"
                                   type="text">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label"
                               for="departmentId">所在部门</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="departmentId" id="departmentId">
                                <option value="">请选择所在部门</option>
                            </select>
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

<!-- Update Modal -->
<div aria-labelledby="myModalLabel" class="modal fade" id="updateModel" role="dialog"
     tabindex="-1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">用户修改</h4>
            </div>

            <div class="modal-body">
                <form class="form-horizontal" id="updateUserForm">
                    <input type="hidden" name="id" id="id_update">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="name_update">用户名称</label>
                        <div class="col-sm-10">
                            <input class="form-control" id="name_update" name="name"
                                   placeholder="用户名称" type="text">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label"
                               for="password_update">用户密码</label>
                        <div class="col-sm-10">
                            <input class="form-control" id="password_update" name="password"
                                   placeholder="用户密码"
                                   type="password">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label"
                               for="salary_update">用户薪资</label>
                        <div class="col-sm-10">
                            <input class="form-control" id="salary_update" name="salary"
                                   placeholder="用户薪资"
                                   type="text">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label"
                               for="birthday_update">用户生日</label>
                        <div class="col-sm-10">
                            <input class="form-control" id="birthday_update" name="birthday"
                                   placeholder="用户生日"
                                   type="text">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label"
                               for="departmentId_update">所在部门</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="departmentId" id="departmentId_update">
                                <option value="">请选择所在部门</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal" type="button">关闭
                </button>
                <button class="btn btn-primary" id="updateUserBtn" type="button">修改</button>
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
    <div class="col-md-offset-10">
        <button class="btn btn-success" id="addUserModelBtn">添加</button>
        <button class="btn btn-info">搜索</button>
    </div>

    <!--表格数据部分-->
    <div class="col-md-12">
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

    <%--分页信息与分页导航信息--%>
    <div class="col-md-12">
        <div class="col-md-6" id="paginationInfo">
        </div>
        <div class="col-md-6" id="paginationNav">
            <nav aria-label="Page navigation">
                <ul class="pagination">

                </ul>
            </nav>
        </div>
    </div>
</div>

<script type="text/javascript">
    let pageNum = 1;
    let pageSize = 3;

    /*初始化用户表格数据*/
    function initUserTable(pageNum, pageSize) {

        // 清空tbody
        $("#userTable tbody").empty();

        $("#paginationInfo").empty();
        $("#paginationNav ul").empty();

        $.ajax({
            url: "${pageContext.request.contextPath}/users/page/" + pageNum + "/" + pageSize,
            type: "GET",
            dataType: "json",
            success: function (resp) {
                console.log(resp)
                let pageInfo = resp.data;
                let users = pageInfo.list;

                $.each(users, function (index, user) {
                    let idTd = $("<td></td>").append(user.id);
                    let nameTd = $("<td></td>").append(user.name);
                    let passwordTd = $("<td></td>").append(user.password);
                    let salaryTd = $("<td></td>").append(user.salary);
                    let birthdayTd = $("<td></td>").append(user.birthday);

                    let actionTd = $("<td></td>");
                    let editBtn =
                        $("<button></button>").addClass("btn btn-primary").append("修改").attr("id", "updateUser_"
                            + user.id).attr("onclick", "updateUser(" + user.id + ")");
                    let deleteBtn =
                        $("<button></button>").addClass("btn btn-danger").append("删除").attr("id", "deleteUser_" +
                            user.id).attr("onclick", "deleteUser(" + user.id + ")");
                    actionTd.append(editBtn).append(deleteBtn);

                    $("<tr></tr>").append(idTd).append(nameTd).append(passwordTd).append(salaryTd).append(birthdayTd).append(actionTd).appendTo("tbody");
                });

                // 分页信息
                $("#paginationInfo").append("共" + pageInfo.total + "条记录 第" + pageInfo.pageNum + "页/共" + pageInfo.pages + "页");

                // TODO 拼接分页导航条
                // 拼接上一页按钮
                if (pageInfo.hasPreviousPage) {
                    let preLiEle = $("<li></li>").appendTo("#paginationNav ul");
                    $("<a></a>").attr("href", "#")
                        .attr("onclick", "toPage(" + pageInfo.prePage + ")")
                        .attr("aria-label", "Previous").append("<span aria-hidden=\"true\">&laquo;</span>").appendTo(preLiEle);
                }


                $.each(pageInfo.navigatepageNums, function (index, pageNum) {

                    // 遍历的页码等于当前页码
                    let liNumEle;
                    if (pageNum === pageInfo.pageNum) {
                        liNumEle = $("<li class=\"active\"></li>").appendTo("#paginationNav ul");
                    } else {
                        liNumEle = $("<li></li>").appendTo("#paginationNav ul");
                    }
                    $("<a></a>").append(pageNum).attr("href", "#")
                        .attr("onclick", "toPage(" + pageNum + ")")
                        .appendTo(liNumEle);
                })

                // 拼接下一页按钮
                if (pageInfo.hasNextPage) {
                    let nextLiEle = $("<li></li>").appendTo("#paginationNav ul");
                    $("<a></a>").attr("href", "#")
                        .attr("onclick", "toPage(" + pageInfo.nextPage + ")")
                        .attr("aria-label", "Next").append("<span aria-hidden=\"true\">&raquo;</span>").appendTo(nextLiEle);
                }
            },
        })
    }

    function toPage(pageNum) {
        initUserTable(pageNum, pageSize)
    }

    /*初始化部门列表*/
    function initDepartmentList() {

        $("select[name='departmentId']").empty();

        $.ajax({
            url: "${pageContext.request.contextPath}/departments",
            type: "GET",
            dataType: "json",
            success: function (resp) {
                let departments = resp.data;

                $.each(departments, function (index, department) {
                    let optionElement = $("<option></option>").append(department.name).attr("value", department.id);
                    $("select[name='departmentId']").append(optionElement);
                })
            }
        })
    }

    /*添加的处理*/
    $("#addUserBtn").click(function () {

        let userJSON = {
            name: $("#name").val(),
            password: $("#password").val(),
            salary: $("#salary").val(),
            birthday: $("#birthday").val(),
            departmentId: $("#departmentId").val()
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

    /*更新的处理*/
    $("#updateUserBtn").click(function () {
        let userJSON = {
            id: $("#id_update").val(),
            name: $("#name_update").val(),
            password: $("#password_update").val(),
            salary: $("#salary_update").val(),
            birthday: $("#birthday_update").val(),
            departmentId: $("#departmentId_update").val()
        }
        let userJSONString = JSON.stringify(userJSON);

        $.ajax({
            url: "${pageContext.request.contextPath}/users",
            type: "PUT",
            dataType: "json",
            contentType: "application/json",
            data: userJSONString,
            success: function (resp) {
                let code = resp.code;
                let flag = resp.flag;

                if (code == 200 && flag == "true") {
                    // 弹窗
                    alert("用户修改成功");

                    // 关闭模态窗
                    $("#updateModel").modal('hide');

                    // 重新加载数据
                    initUserTable();
                }
            }
        })
    });


    $(function () {
        /*初始化用户表格数据*/
        initUserTable(pageNum, pageSize);

        /*日历的初始化*/
        $("input[name='birthday']").datepicker({
            language: 'zh-CN', //语言
            autoclose: true, //选择后自动关闭
            clearBtn: true,//清除按钮
            format: "yyyy-mm-dd"//日期格式
        })

        /*打开模态窗体*/
        $("#addUserModelBtn").click(function () {
            // 打开模态窗体
            $("#addModel").modal('show');

            // 填充部门下拉列表
            initDepartmentList();

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
                birthday: $("#birthday").val(),
                departmentId: $("#departmentId").val()
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

        /*更新的处理*/
        $("#updateUserBtn").click(function () {
            let userJSON = {
                id: $("#id_update").val(),
                name: $("#name_update").val(),
                password: $("#password_update").val(),
                salary: $("#salary_update").val(),
                birthday: $("#birthday_update").val(),
                departmentId: $("#departmentId_update").val()
            }
            let userJSONString = JSON.stringify(userJSON);

            $.ajax({
                url: "${pageContext.request.contextPath}/users",
                type: "PUT",
                dataType: "json",
                contentType: "application/json",
                data: userJSONString,
                success: function (resp) {
                    let code = resp.code;
                    let flag = resp.flag;

                    if (code == 200 && flag == "true") {
                        // 弹窗
                        alert("用户修改成功");

                        // 关闭模态窗
                        $("#updateModel").modal('hide');

                        // 重新加载数据
                        initUserTable();
                    }
                }
            })
        });
    })


    /*删除的处理*/
    function deleteUser(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/users/" + id,
            type: "DELETE",
            dataType: "json",
            success: function (resp) {
                let code = resp.code;
                let flag = resp.flag;
                console.log(code, flag);

                if (code == 200 && flag == "true") {
                    alert("用户删除成功!");
                    // 重新加载数据
                    initUserTable();
                }
            }
        })
    }

    /**/
    function updateUser(id) {

        // 打开模态窗体
        $("#updateModel").modal('show');

        // 填充部门下拉列表
        initDepartmentList();

        // 根据ID查询用户
        $.ajax({
            url: "${pageContext.request.contextPath}/users/" + id,
            type: "GET",
            dataType: "json",
            success: function (resp) {
                $("#id_update").val(resp.data.id);
                $("#name_update").val(resp.data.name);
                $("#password_update").val(resp.data.password);
                $("#salary_update").val(resp.data.salary);
                $("#birthday_update").val(resp.data.birthday);
                $("#departmentId_update").val(resp.data.departmentId);
            }
        })

        // 清空表单域的数据
        $("#addUserForm")[0].reset();
    }


</script>


</body>
</html>
