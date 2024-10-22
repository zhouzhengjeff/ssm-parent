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

    <%--导入全局js文件--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.js"></script>

    <script type="text/javascript">
        $(function () {
            // 发送异步请求查询数据展示成表格
            findAll();
        })

        function findAll() {
            $.ajax({
                url: "${pageContext.request.contextPath}/users",
                type: "GET",
                dataType: "json",
                success: function (resp) {
                    // 解析数据 生成表格
                    let users = resp.data;
                    for (let i = 0; i < users.length; i++) {
                        let user = users[i];

                        let tr = "<tr><td>" + user.id + "</td><td>" + user.name + "</td><td>" + user.password +
                            "</td><td>" + user.salary + "</td><td>" + user.birthday + "</td><td><a href='edit/" +
                            user.id + "'>编辑</a>&nbsp;&nbsp;<a onclick='removeUser(" + user.id +
                            ")' href='#'>删除</a></td></tr>"

                        $("tbody").append(tr);
                    }
                }
            })
        }

        function removeUser(id) {
            $.ajax({
                url: "${pageContext.request.contextPath}/users/delete/" + id,
                type: "GET",
                dataType: "json",
                success: function (resp) {
                    if (resp.flag == "true" && resp.code == 200) {
                        alert("删除成功!");
                        $("tbody").empty()
                        findAll()
                    }
                }
            })
        }


    </script>

</head>
<body>

<table class="table table-condensed">
    <thead>
    <tr>
        <th>编号</th>
        <th>姓名</th>
        <th>密码</th>
        <th>薪资</th>
        <th>生日</th>
        <th>动作</th>
    </tr>
    </thead>

    <tbody>

    </tbody>
</table>

<br>

<form>
    <div class="form-group">
        <label for="exampleInputEmail1">Email address</label>
        <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1">Password</label>
        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
    </div>
    <div class="form-group">
        <label for="exampleInputFile">File input</label>
        <input type="file" id="exampleInputFile">
        <p class="help-block">Example block-level help text here.</p>
    </div>
    <div class="checkbox">
        <label>
            <input type="checkbox"> Check me out
        </label>
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
</form>

</body>
</html>
