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
    <link href="${pageContext.request.contextPath}/static/css/bootstrap-table.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/bootstrap-datepicker.css" rel="stylesheet">


    <style>
        .mr10 { margin-right: 10px; }
        .alert {
            padding: 0 14px;
            margin-bottom: 0;
            display: inline-block;
        }
    </style>

    <script src="${pageContext.request.contextPath}/static/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap-table.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap-datepicker.js" type="text/javascript"></script>
</head>
<body>


<%--<!-- Add Modal -->
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
</div>--%>

<%--<div class="container">

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

        </table>
    </div>
</div>--%>
<div class="container">
    <h1>CRUD Table</h1>
    <p class="toolbar">
        <a class="create btn btn-secondary" href="javascript:">Create Item</a>
        <span class="alert"></span>
    </p>
    <table id="userTable"></table>
</div>



<script type="text/javascript">
    $(function () {
        // 初始化表格
        $("#userTable").bootstrapTable({
            method: 'get',
            toolbar: '.toolbar',  //工具按钮用哪个容器
            striped: true,   //是否显示行间隔色
            cache: false,   //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,   //是否显示分页（*）
            sortable: false,   //是否启用排序
            sortOrder: "asc",   //排序方式
            pageNumber: 1,   //初始化加载第一页，默认第一页
            pageSize: 3,   //每页的记录行数（*）
            pageList: [3, 6, 9, 12], //可供选择的每页的行数（*）
            url: "${pageContext.request.contextPath}/users/findPage",//这个接口需要处理bootstrap table传递的固定参数
            queryParamsType: '', //默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort。设置为 '' 在这种情况下传给服务器的参数为：pageSize,pageNumber
            //queryParams: queryParams,//前端调用服务时，会默认传递上边提到的参数，如果需要添加自定义参数，可以自定义一个函数返回请求参数
            sidePagination: "server",  //分页方式：client客户端分页，server服务端分页（*）
            //search: true,   //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: true,
            //showColumns: true,   //是否显示所有的列
            //showRefresh: true,   //是否显示刷新按钮
            minimumCountColumns: 2,  //最少允许的列数
            clickToSelect: true,  //是否启用点击选中行
            searchOnEnterKey: true,
            columns: [{
                field: 'id',
                title: '用户编号',
                align: 'center'
            }, {
                field: 'name',
                title: '用户名称',
                align: 'center'
            }, {
                field: 'password',
                title: '用户密码',
                align: 'center'
            }, {
                field: 'salary',
                title: '用户薪资',
                align: 'center',
            }, {
                field: 'birthday',
                title: '用户生日',
                align: 'center',
                formatter: function (value, row, index) {
                    //通过formatter可以自定义列显示的内容
                    //value：当前field的值，即id
                    //row：当前行的数据
                    return new Date(value).toLocaleString();
                }
            }]
        });
    })
</script>


</body>
</html>
