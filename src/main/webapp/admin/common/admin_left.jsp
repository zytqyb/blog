<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<aside class="aside" style="min-height: 880px">
    <div class="logo-top">
        <img src="img/logo.png" alt="logo">
        <span>My blog</span>
    </div>
    <div class="user-tx">
        <img src="img/avatar5.png" alt="头像" width="34px" height="34px">
    </div>
    <ul class="left-nav">
        <li class="nav-header">管理模块</li>
        <li><a href="${pageContext.request.contextPath}/admin/AdminServlet">文章管理</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/user?method=query">用户管理</a></li>
        <li><a href="#">友链管理</a></li>
        <li class="nav-header">系统管理</li>
        <li><a href="#">信息配置</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/modify.jsp">修改密码</a></li>
        <li><a href="${pageContext.request.contextPath}/logout">安全退出</a></li>
    </ul>
</aside>