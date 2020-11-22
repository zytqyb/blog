<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <form class="form-inline" method="post">
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
                                    <%-- 给servlet的默认页码 --%>
                                    <input type="hidden" name="pageIndex" value="1">
                                    <button type="submit" class="btn btn-default">查找</button>

                                </div>
                                <div class="addDel">
                                    <button type="button" class="btn btn-success" id="addBtn" data-toggle="modal"
                                            data-target="#adduser"><i class="fa fa-plus"></i>
                                        新增
                                    </button>
                                    <!-- 添加用户弹出模态框 -->
                                    <div class="modal fade" id="adduser" tabindex="-1" role="dialog"
                                         aria-labelledby="addModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close"><span aria-hidden="true">&times;</span>
                                                    </button>
                                                    <h4 class="modal-title" id="addModalLabel">添加用户</h4>
                                                </div>
                                                <%-- 模态框内容 --%>
                                                <div class="modal-body">
                                                    <form></form>
                                                    <form id="addForm"
                                                          action="${pageContext.request.contextPath}/admin/user"
                                                          method="post">
                                                        <input type="hidden" name="method" value="addUser">
                                                        <div class="form-group">
                                                            <label for="addUserName">用户昵称</label>
                                                            <p></p>
                                                            <input type="text" class="form-control wid100"
                                                                   id="addUserName" name="addUserName"
                                                                   placeholder="请输入用户昵称">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="addUserCode">登录账号</label>
                                                            <p></p>
                                                            <input type="text" class="form-control wid100"
                                                                   id="addUserCode" name="addUserCode"
                                                                   placeholder="请输入登录账号">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="addPassword">登录密码</label>
                                                            <p></p>
                                                            <input type="password" class="form-control wid100"
                                                                   id="addPassword" name="addPassword"
                                                                   placeholder="请输入登录密码">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="newAddPassword">再次输入登录密码</label>
                                                            <p></p>
                                                            <input type="password" class="form-control wid100"
                                                                   id="newAddPassword" name="newAddPassword"
                                                                   placeholder="请输入登录密码">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="addRole">用户角色</label>
                                                            <p></p>
                                                            <select name="addRole" id="addRole"
                                                                    class="form-control wid100"
                                                                    style="margin-top: 5px;">
                                                                <option value="1">普通用户</option>
                                                                <option value="2">博客管理员</option>
                                                                <option value="3">系统管理员</option>
                                                            </select>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">
                                                        取消
                                                    </button>
                                                    <button type="button" class="btn btn-primary" id="addUserBtn">添加
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <button type="button" class="btn btn-info" onclick="modifyUser()">
                                        <i class="fa fa-edit"></i>
                                        修改
                                    </button>
                                    <!-- 修改用户弹出模态框 -->
                                    <div class="modal fade" id="modifyUser" tabindex="-1" role="dialog"
                                         aria-labelledby="modifyModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close"><span aria-hidden="true">&times;</span>
                                                    </button>
                                                    <h4 class="modal-title" id="modifyModalLabel">修改用户</h4>
                                                </div>
                                                <%-- 模态框内容 --%>
                                                <div class="modal-body">
                                                    <form></form>
                                                    <form id="modifyForm"
                                                          action="${pageContext.request.contextPath}/admin/user"
                                                          method="post">
                                                        <input type="hidden" name="method" value="modifyUser">

                                                        <div class="form-group">
                                                            <label for="modifyUserCode">登录账号</label>
                                                            <p></p>
                                                            <input type="text" class="form-control wid100"
                                                                   id="modifyUserCode" name="modifyUserCode"
                                                                   placeholder="请输入登录账号" value="" readonly = "readonly">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="modifyUserName">用户昵称</label>
                                                            <p></p>
                                                            <input type="text" class="form-control wid100"
                                                                   id="modifyUserName" name="modifyUserName"
                                                                   placeholder="请输入用户昵称" value="">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="modifyPassword">登录密码</label>
                                                            <p></p>
                                                            <input type="password" class="form-control wid100"
                                                                   id="modifyPassword" name="modifyPassword"
                                                                   placeholder="请输入登录密码" value="">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="newModifyPassword">再次输入登录密码</label>
                                                            <p></p>
                                                            <input type="password" class="form-control wid100"
                                                                   id="newModifyPassword" name="newModifyPassword"
                                                                   placeholder="请输入登录密码">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="addRole">用户角色</label>
                                                            <p></p>
                                                            <select name="modifyRole" id="modifyRole"
                                                                    class="form-control wid100"
                                                                    style="margin-top: 5px;">
                                                                <option value="1">普通用户</option>
                                                                <option value="2">博客管理员</option>
                                                                <option value="3">系统管理员</option>
                                                            </select>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">
                                                        取消
                                                    </button>
                                                    <button type="button" class="btn btn-primary" id="modifyUserBtn">
                                                        修改
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <button type="button" class="btn btn-danger" onclick="deleteUser()"><i
                                            class="fa fa-trash-o"></i> 删除
                                    </button>
                                </div>
                            </form>
                            <form id="blogForm" action="${pageContext.request.contextPath}/admin/user" method="post">
                                <input type="hidden" name="method" value="deleteUser">
                                <table class="table table-striped table table-striped table-bordered bg">
                                    <tr>
                                        <th><input type="checkbox" class="group-checkable" value="null"></th>
                                        <th>用户昵称</th>
                                        <th>用户账号</th>
                                        <th>用户角色</th>
                                        <th>创建时间</th>
                                        <th>修改时间</th>
                                    </tr>
                                    <c:forEach var="userslist" items="${userList}">
                                        <tr>

                                            <td><input type="checkbox" name="blogId" value="${userslist.id}"></td>
                                            <td>${userslist.username}</td>
                                            <td>${userslist.usercode}</td>
                                            <c:if test="${userslist.role == 1}">
                                                <td>系统管理员</td>
                                            </c:if>
                                            <c:if test="${userslist.role == 2}">
                                                <td>博客管理员</td>
                                            </c:if>
                                            <c:if test="${userslist.role == 3}">
                                                <td>普通用户</td>
                                            </c:if>
                                            <td>${userslist.creationDate}</td>
                                            <td>${userslist.modifyDate}</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </form>
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

        </section>
    </main>
</div>


<script src="${pageContext.request.contextPath}/admin/js/adduser.js"></script>

<script>
    if (${addResult != null}) {
        swal.fire({
            icon: 'success',
            text: '添加成功!',
            confirmButtonText: 'ok',
            width: '475px',
            confirmButtonColor: '#7cd1f9',
        }).then((result) => {
            <%request.getSession().removeAttribute("addResult");%>
        })
    }

    if (${modifyResult != null}) {
        swal.fire({
            icon: 'success',
            text: '修改成功!',
            confirmButtonText: 'ok',
            width: '475px',
            confirmButtonColor: '#7cd1f9',
        }).then((result) => {
            <%request.getSession().removeAttribute("modifyResult");%>
        })
    }

    function deleteUser() {
        let flag = false;
        let idArray = document.getElementsByName("blogId");
        for (let i = 0; i < idArray.length; i++) {
            if (idArray[i].checked) {
                flag = true;
                break;
            }
        }
        if (flag) {
            Swal.fire({
                title: '确定删除吗？',
                icon: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                text: "确认要删除选中的这些数据吗?",
                confirmButtonText: '确定删除',
                width: '475px',
                reverseButtons: true,
                confirmButtonColor: '#e64942',
                cancelButtonColor: '#efefef',
            }).then((result) => {
                if (result.value) {
                    $("#blogForm").submit();
                }
            })
        } else {
            swal.fire({
                icon: 'error',
                text: '请选择需要删除的用户',
                confirmButtonText: 'ok',
                width: '475px',
                confirmButtonColor: '#7cd1f9',
            })
        }
    }

    function modifyUser() {
        let flag = 0;
        let index;
        let idArray = document.getElementsByName("blogId");
        for (let i = 0; i < idArray.length; i++) {
            if (idArray[i].checked) {
                flag++;
                index = idArray[i].value;
            }
            if (flag > 1) {
                break;
            }
        }
        if (flag === 0) {
            swal.fire({
                icon: 'error',
                text: '请选择一个用户进行修改',
                confirmButtonText: 'ok',
                width: '475px',
                confirmButtonColor: '#7cd1f9',
            })
        } else if (flag > 1) {
            swal.fire({
                icon: 'error',
                text: '只能选择一个用户进行修改',
                confirmButtonText: 'ok',
                width: '475px',
                confirmButtonColor: '#7cd1f9',
            })
        } else {
            modifyUsercs(index);
            $('#modifyUser').modal();
            $("#modifyUserBtn").click(function () {
                $("#modifyForm").submit();
            })
        }
    }

    function modifyUsercs(index) {
        $.ajax({
            type: "post",
            url: "/admin/user",
            data: {method: "getModifyUser", id: index},
            dataType: "json",
            success: function (data) {
                $("#modifyUserName").val(data.username);
                $("#modifyUserCode").val(data.usercode);
                $("#modifyPassword").val(data.password);
            },
            error: function (data) {
                swal.fire({
                    icon: 'error',
                    text: '请求失败!',
                    confirmButtonText: 'ok',
                    width: '475px',
                    confirmButtonColor: '#7cd1f9',
                })
            }
        })
    }

</script>

</body>
</html>
