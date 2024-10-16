<%--
  Created by IntelliJ IDEA.
  User: zhouzheng
  Date: 2024/10/16
  Time: 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table id="" cellspacing="0" cellpadding="" border="1">
    <thead>
    <tr>
        <th>部门编号</th>
        <th>部门名称</th>
        <th>部门位置</th>
        <th>相关操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="department" items="${departmentList}">
        <tr>
            <td>${department.id}</td>
            <td>${department.name}</td>
            <td>${department.location}</td>
            <td><a href="${pageContext.request.contextPath}/departments/edit/${department.id}">修改</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
