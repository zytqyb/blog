<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 头部 -->
<header id="header" class="header-top navbar-fixed-top container">
    <!-- 首页logo -->
    <div class="header-logo">
        <a href="${pageContext.request.contextPath}/index.jsp">
            <i class="glyphicon glyphicon-home" aria-hidden="true"></i>
            <span>邱同学的小破站</span>
        </a>
    </div>


    <!-- 顶部导航栏 -->
    <div class="top-nav">

        <!-- 搜索框 -->
        <form class="top-form" action="javascript:">
            <div class="top-ss">
                <input id="ssk" name="title" type="search" placeholder="输入关键词搜索...">
                <a href="index.jsp?title=${title}"><i class="glyphicon glyphicon-search"></i></a>
            </div>
        </form>

        <!-- 右侧登录等按钮 -->
        <ul>
            <!-- 登录按钮 -->
            <li>
                <a id="sign" href="javascript:" class="dropdown-toggle">
                    <i class="glyphicon glyphicon-user"></i>
                    <span class="caret"></span>
                </a>
                <!-- 登录框 -->
                <form style="display: none" class="login-top" id="login-form"
                      action="${pageContext.request.contextPath}/login" method="post">
                    <div class="form-group">
                        <label for="usercode">用户名</label>
                        <input class="form-control" type="text" name="usercode" id="usercode" placeholder="用户名或电子邮箱">
                    </div>
                    <div class="form-group">
                        <label for="password">密码</label>
                        <input class="form-control" type="password" name="password" id="password" placeholder="密码">
                    </div>
                    <button class="an" type="button" value="登录" id="login">登录</button>
                    <div style="display: none" id="info" class="info">${error}</div>
                </form>
                <!-- 登录框结束 -->
            </li>

        </ul>
    </div>
</header>
<!-- 头部结束 -->