<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 头部 -->
<div class="back-to-top" style="background: url(/home/img/scroll.png);"></div>
<header id="header" class="header-top navbar-fixed-top container">
    <!-- 首页logo -->
    <div class="header-logo">
        <a href="${pageContext.request.contextPath}/index.jsp">
            <i class="fa-fw fa fa-home" aria-hidden="true"></i>
            <span>邱同学的小破站</span>
        </a>
    </div>


    <!-- 顶部导航栏 -->
    <div class="top-nav">

        <!-- 搜索框 -->
        <form class="top-form" action="javascript:">
            <div class="top-ss">
                <input class="form-control" id="ssk" name="title" type="search" required placeholder="输入关键词搜索...">
                <button type="submit" style="padding: 0;outline-offset:-6px; margin-left: 1px"
                        class="transparent btn btn-sm"><i class="glyphicon glyphicon-search"></i></button>
            </div>
        </form>

        <!-- 右侧登录等按钮 -->
        <ul>
            <!-- 登录按钮 -->
            <li class="sign <c:if test="${userSession != null}" >hidden</c:if>">
                <a id="sign" href="javascript:">
                    <i class="fa fa-user"></i>
                    <span class="caret"></span>
                </a>
                <!-- 登录框 -->
                <form style="display: none" class="login-top" id="login-form">
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
            <!-- 登录后 -->
            <li id="Avatar" class="Avatar">
                <div>
                    <a id="signImg" href="javascript:">
                        <span>${userSession.username} <i class="caret"></i></span>
                        <img class="img-circle img-40px" src="https://q.qlogo.cn/g?b=qq&nk=1713684374&s=100" alt="">
                    </a>
                </div>
                <ul class="guanli" style="display: none">
                    <li class="guanlitop">
                        <p>下午好, ${userSession.username}</p>
                    </li>
                    <li>
                        <a href="/admin/addarticle.jsp">
                            <i class="fa fa-edit"></i>
                            新建文章
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="fa fa-edit"></i>
                            文章管理
                        </a>
                    </li>
                    <li style="margin-bottom: 10px">
                        <a href="/admin/admin.jsp">
                            <i class="fa fa-edit"></i>
                            后台管理
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li style="margin-bottom: 10px">
                        <a href="/logout">
                            退出
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</header>
<!-- 头部结束 -->