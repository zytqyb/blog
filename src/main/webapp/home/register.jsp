<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
</head>
<body>
    <form action="/adduser" method="post">
        <h1>用户昵称</h1>
        <input type="text" name="username">
        <h1>用户账号</h1>
        <input type="text" name="usercode">
        <h1>用户密码</h1>
        <input type="password" name="password">
        <input type="submit">
        <h1>${error}</h1>
    </form>
</body>
</html>
