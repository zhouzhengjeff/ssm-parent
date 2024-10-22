<%--
  Created by IntelliJ IDEA.
  User: zhouzheng
  Date: 2024/10/21
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary btn-lg active" role="button">新增</button>
            <button class="btn btn-danger btn-lg active" role="button">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="userTable">
                <thead>
                <tr>
                    <th>用户编号</th>
                    <th>用户名称</th>
                    <th>用户密码</th>
                    <th>用户薪资</th>
                    <th>用户生日</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6" id="pageInfo">

        </div>

        <div class="col-md-6" id="pageNav">

        </div>
    </div>
</div>

<script type="text/javascript">

    function buildUserTable(resp) {
        $("#userTable tbody").empty()

        let users = resp.data.list
        $.each(users, function (index, user) {
            let userIdTD = $("<td></td>").append(user.id);
            let userNameTD = $("<td></td>").append(user.name);
            let userPasswordTD = $("<td></td>").append(user.password);
            let userSalaryTD = $("<td></td>").append(user.salary);
            let userBirthdayTD = $("<td></td>").append(new Date(user.birthday).toLocaleDateString());
            let userEditTD = $("<td></td>").append(
                $("<a></a>").attr("href", "edit/" + user.id).text("编辑")
            ).append(" ").append(
                $("<a></a>").attr("href", "delete/" + user.id).text("删除")
            )

            $("<tr></tr>").append(userIdTD).append(userNameTD).append(userPasswordTD).append(userSalaryTD)
                .append(userBirthdayTD).append(userEditTD).appendTo("#userTable tbody")
        })
    }

    function buildPageInfo(resp) {
        $("#pageInfo").empty()
        const pageNum = resp.data.pageNum
        const total = resp.data.total
        const pages = resp.data.pages

        let pageInfo = "当前第" + pageNum + "页，总共" + total + "条记录，共" + pages + "页"
        $("#pageInfo").append(pageInfo)
    }

    function toPage(pageNum) {

        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/users/page/" + pageNum + "/3",
            dataType: "json",
            success: function (resp) {

                buildUserTable(resp);

                buildPageInfo(resp);

                buildPageNav(resp);
            }
        })
    }

    function buildPageNav(resp) {
        $("#pageNav").empty()

        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (resp.data.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            //为元素添加点击翻页的事件
            firstPageLi.click(function () {
                toPage(1);
            });
            prePageLi.click(function () {
                toPage(resp.data.pageNum - 1);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if (resp.data.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                toPage(resp.data.pageNum + 1);
            });
            lastPageLi.click(function () {
                toPage(resp.data.pages);
            });
        }


        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(resp.data.navigatepageNums, function (index, item) {

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (resp.data.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                toPage(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#pageNav");


    }

    $(function () {
        let pageNum = 1
        toPage(pageNum);
    })
</script>


</body>
</html>
