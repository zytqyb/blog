<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">

<head>

    <jsp:include page="common/css.jsp"/>

</head>
<body>
<div class="container-fluid">
    <jsp:include page="common/admin_left.jsp"/>

    <div class="kb"></div>

    <main class="main">

        <jsp:include page="common/admin_top.jsp"/>


        <section class="content">
            <div class="container-fluid">
                <div class="wai">
                    <div class="panel panel-default" style="width: 100%">
                        <div class="panel-heading">用户管理</div>
                        <div class="panel-body">
                            <form class="form-inline">
                                <input name="method" value="query" class="input-text" type="hidden">
                                <div class="form-group">
                                    <label for="exampleInputName2">用户昵称:</label>
                                    <input type="text" class="form-control" id="exampleInputName2" name="queryname"
                                           value="${queryname}">
                                    <label style="margin-left: 20px" for="queryUserRole">用户角色:</label>
                                    <select name="queryUserRole" id="queryUserRole" class="form-control"
                                            style="width: 120px;">
                                        <c:if test="${roleList != null }">
                                            <option value="0">--请选择--</option>
                                            <c:forEach var="role" items="${roleList}">
                                                <option
                                                        <c:if test="${role.id == queryUserRole}">selected="selected"</c:if>
                                                        value="${role.id}">${role.roleName}</option>
                                            </c:forEach>
                                        </c:if>
                                    </select>

                                    <input type="hidden" name="pageIndex" value="1">
                                    <button type="submit" class="btn btn-default">查找</button>

                                    <button type="button" class="btn btn-success">（成功）Success</button>
                                </div>

                            </form>
                            <table class="table table-striped table table-striped table-bordered bg">
                                <tr>
                                    <th><input type="checkbox" class="group-checkable" value="null"></th>
                                    <th>用户昵称</th>
                                    <th>用户账号</th>
                                    <th>用户角色</th>
                                    <th>创建时间</th>
                                    <th>修改时间</th>
                                </tr>

                                <C:forEach var="userslist" items="${userList}">
                                    <tr>
                                        <td><input type="checkbox" class="checkboxes" value="${userslist.id}"></td>
                                        <td>${userslist.username}</td>
                                        <td>${userslist.usercode}</td>
                                        <td>${userslist.role}</td>
                                        <td>${userslist.creationDate}</td>
                                        <td>${userslist.modifyDate}</td>
                                    </tr>
                                </C:forEach>
                            </table>

                        </div>
                    </div>
                </div>

            </div>

            <nav aria-label="Page navigation">
                <ul class="pager">
                    <li id="previous" class="previous <c:if test="${currentPageNo <=1}">
                        disabled
                    </c:if>">
                        <a href="${pageContext.request.contextPath}/admin/user?method=query&queryname=${queryname}&queryUserRole=${queryUserRole}&pageIndex=${currentPageNo-1}"><span
                                aria-hidden="true">&larr;</span> 上一页</a>
                    </li>
                    <li id="next" class="next <c:if test="${currentPageNo >= totalPageCount}">
                            disabled
                            </c:if>">
                        <a href="${pageContext.request.contextPath}/admin/user?method=query&queryname=${queryname}&queryUserRole=${queryUserRole}&pageIndex=${currentPageNo+1}">下一页
                            <span aria-hidden="true">&rarr;</span></a>
                    </li>
                </ul>
            </nav>

<%--            <nav aria-label="Page navigation">--%>
<%--                <ul class="pagination">--%>
<%--                    <li>--%>
<%--                        <a href="#" aria-label="Previous">--%>
<%--                            <span aria-hidden="true">&laquo;</span>--%>
<%--                        </a>--%>
<%--                    </li>--%>
<%--                    <%int num = 10;%>--%>
<%--                    <%if (num <= 6) {%>--%>
<%--                        <%for (int i = 1; i <= 6; i++) {%>--%>
<%--                            <li><a href="#"><%=i%></a></li>--%>
<%--                        <%}%>--%>
<%--                    <%} else if (num > 6) {%>--%>
<%--                        <%for (int i = 1; i <= 6; i++) {%>--%>
<%--                            <li><a href="#"><%=i%></a></li>--%>
<%--                        <%}%>--%>
<%--                    <li><a href="#">...</a></li>--%>
<%--                    <%}%>--%>


<%--                    <li>--%>
<%--                        <a href="#" aria-label="Next">--%>
<%--                            <span aria-hidden="true">&raquo;</span>--%>
<%--                        </a>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--            </nav>--%>

        </section>
    </main>
</div>

<script src="/plugins/sweetalert2/dist/sweetalert2.js"></script>


<script>
    let idArray = [];

    $(".checkboxes").click(function () {
        idArray.push(this.value);
        console.log(this.value);
    })

    $("#btn").click(function () {

    })

</script>

</body>
</html>
