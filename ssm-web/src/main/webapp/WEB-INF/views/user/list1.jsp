<%--
  Created by IntelliJ IDEA.
  User: zhouzheng
  Date: 2024/10/21
  Time: 8:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/js/jquery-3.7.1.min.js"></script>

    <%--导入全局样式文件--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap-table.min.css">


    <%--导入全局js文件--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap-table.min.js"></script>


    <script type="text/javascript">
        function initTable() {
            $.ajax({
                url: '${pageContext.request.contextPath}/users',
                success: function (resp) {
                    $("#userTable").bootstrapTable({
                        data: resp.data,
                        pagination: true,
                        search: true,
                        pageNumber: 1,   //初始化加载第一页，默认第一页
                        pageSize: 10,    //每页的记录行数
                        pageList: [10, 25, 50, 100, 'All'],
                        columns: [{
                            field: 'id',
                            title: '用户编号'
                        }, {
                            field: 'name',
                            title: '用户名称'
                        }, {
                            field: 'password',
                            title: '用户密码'
                        }, {
                            field: 'salary',
                            title: '用户薪资'
                        }, {
                            field: 'birthday',
                            title: '用户生日',
                            formatter: function (value, row, index) {
                                return new Date(value).toLocaleDateString();
                            }
                        }, {
                            title: "相关动作",
                            formatter: function (value, row, index) {
                                return '<a href="${pageContext.request.contextPath}/user/delete/' + row.id
                                    + '">删除</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/user/edit/' +
                                    row.id + '">编辑</a>';
                            }
                        }]
                    });
                }
            })
        }


        // TODO 利用Bootstap-Table组件自动生成表格
        $(function () {
            initTable();
        });

    </script>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <table id="userTable" class="table table-condensed"></table>
        </div>
    </div>

    <div class="row">
        <div class="col-md-offset-8">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>


</body>
</html>
