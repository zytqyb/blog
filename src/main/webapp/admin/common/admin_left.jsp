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
        <li class="nav-header">Dashboard</li>
        <li>
            <a href="#">
                <i class="nav-icon fa fa-dashboard"></i>
                <p>Dashboard</p>
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/admin/addarticle.jsp">
                <i class="nav-icon fa fa fa-pencil-square-o"></i>
                <p>发布博客</p>
            </a>
        </li>
        <li class="nav-header">管理模块</li>
        <li>
            <a href="#">
                <i class="fa fa-list-alt nav-icon"></i>
                <p>文章管理</p>
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/admin/user?method=query">
                <i class="fa fa-user nav-icon"></i>
                <p>用户管理</p>
            </a>
        </li>
        <li>
            <a href="#">
                <i class="fa fa-heart nav-icon"></i>
                <p>友链管理</p>
            </a>
        </li>

        <li class="nav-header">系统管理</li>
        <li>
            <a href="#">
                <i class="fa fa-wrench nav-icon"></i>
                <p>信息配置</p>
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/admin/modify.jsp">
                <i class="fa fa-user-secret nav-icon"></i>
                <p>修改密码</p>
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/logout">
                <i class="fa fa-sign-out nav-icon"></i>
                <p>安全退出</p>
            </a>
        </li>
    </ul>
</aside>