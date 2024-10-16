<%--
  Created by IntelliJ IDEA.
  User: zhouzheng
  Date: 2024/10/16
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/departments/edit" method="POST">
    <input type="hidden" name="id" value="${department.id}">
    <input type="text" name="name" value="${department.name}"/>
    <input type="text" name="location" value="${department.location}"/>
    <input type="submit" value="更新">
</form>
</body>
</html>
