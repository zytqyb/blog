<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="main-header">

    <ul class="main-nav">
        <li>
            <a href="javascript:;">
                <i class="fa fa-bars"></i>
            </a>
        </li>
    </ul>

    <ul class="main-nav">
        <li>
            <a href="${pageContext.request.contextPath}/index.jsp">
                <i class="fa fa-paper-plane"></i>
                博客首页
            </a>
        </li>

        <li>
            <a id="usertable" href="javascript:;">
                <i class="glyphicon glyphicon-user"></i>
                作者
            </a>
            <div class="dropdown-menu dropdown-menu-right usertable">
                <a href="">
                    <span>
                        <i class="fa fa-lock"></i>
                        账号
                     </span>
                    <span>${userSession.usercode}</span>
                </a>
                <a href="">
                    <span>
                        <i class="fa fa-user-secret"></i>
                        身份
                     </span>
                    <c:if test="${userSession.role == 1}">
                        <span>系统管理员</span>
                    </c:if>
                    <c:if test="${userSession.role == 2}">
                        <span>博客管理员</span>
                    </c:if>
                    <c:if test="${userSession.role == 3}">
                        <span>普通用户</span>
                    </c:if>
                </a>
                <a href="">
                    <span>
                        <i class="fa fa-info-circle"></i>
                        登录时间
                     </span>
                    <span>${time}</span>
                </a>
            </div>
        </li>
    </ul>
</header>
