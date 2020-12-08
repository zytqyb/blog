<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>小破站 | 管理后台</title>
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
                        <div class="panel-heading">文章管理</div>
                        <div class="panel-body">
                            <form class="form-inline" method="get" action="${pageContext.request.contextPath}/admin/blog">
                                <input name="method" value="query" class="input-text" type="hidden">
                                <div class="form-group">
                                    <label for="exampleInputName2">文章名称:</label>
                                    <input type="text" class="form-control" id="exampleInputName2" name="title"
                                           value="${title}">
                                    <%-- 给servlet的默认页码 --%>
                                    <input type="hidden" name="pageIndex" value="1">
                                    <button type="submit" class="btn btn-default">查找</button>

                                </div>
                                <div class="addDel">
                                    <button type="button" onclick="$(location).attr('href','/admin/addarticle.jsp')" class="btn btn-success" id="addBtn">
                                        <i class="fa fa-plus"></i>
                                        新增
                                    </button>

                                    <button type="button" class="btn btn-info" onclick="modifyUser()">
                                        <i class="fa fa-edit"></i>
                                        修改
                                    </button>

                                    <button type="button" class="btn btn-danger" onclick="deleteBlog()"><i
                                            class="fa fa-trash-o"></i> 删除
                                    </button>
                                </div>
                            </form>
                            <form id="blogForm" action="${pageContext.request.contextPath}/admin/blog" method="post">
                                <input type="hidden" name="method" value="deleteBlog">
                                <table class="table table-striped table table-striped table-bordered bg">
                                    <tr>
                                        <th><input type="checkbox" class="group-checkable" value="null"></th>
                                        <th>文章标题</th>
                                        <th>文章作者</th>
                                        <th>创建时间</th>
                                        <th>修改时间</th>
                                    </tr>
                                    <c:forEach var="blogList" items="${blogList}">
                                        <tr>
                                            <td><input type="checkbox" name="blogId" value="${blogList.id}"></td>
                                            <td>${blogList.title}</td>
                                            <td>${blogList.username}</td>
                                            <td><fmt:formatDate type="both"  dateStyle="medium" timeStyle="medium" value="${blogList.uploadTime}"/></td>
                                            <td><fmt:formatDate type="both"  dateStyle="medium" timeStyle="medium" value="${blogList.modifyDate}"/></td>
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
<input type="hidden" id="rolePassword" value="${userSession.password}">
<!-- 加载 jquery-->
<script src="${pageContext.request.contextPath}/plugins/jquery/jquery.js"></script>
<!-- 加载 Bootstrap-->
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath}/plugins/jquery_growl/jquery.growl.js"></script>
<script src="${pageContext.request.contextPath}/plugins/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/common.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/admin.js"></script>
<script>

    if (${addBlogRs == 0}) {
        Swal.fire({
            icon: 'error',
            text: '添加失败',
            confirmButtonText: 'ok',
            width: '475px',
            confirmButtonColor: '#7cd1f9',
        }).then((result) => {
            if (result) {
                <%request.getSession().removeAttribute("addBlogRs");%>
            }
        })
    }


    if (${addBlogRs == 1}) {
        Swal.fire({
            icon: 'success',
            text: '添加成功',
            confirmButtonText: 'ok',
            width: '475px',
            confirmButtonColor: '#7cd1f9',
        }).then((result) => {
            if (result) {
                <%request.getSession().removeAttribute("addBlogRs");%>
            }
        })
    }


    if (${ModifyBlogRs == 1}) {
        Swal.fire({
            icon: 'success',
            text: '修改成功',
            confirmButtonText: 'ok',
            width: '475px',
            confirmButtonColor: '#7cd1f9',
        }).then((result) => {
            if (result) {
                <%request.getSession().removeAttribute("ModifyBlogRs");%>
            }
        })
    }

    function deleteBlog() {
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
                text: '请选择需要删除的文章',
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
                text: '请选择一个文章进行修改',
                confirmButtonText: 'ok',
                width: '475px',
                confirmButtonColor: '#7cd1f9',
            })
        } else if (flag > 1) {
            swal.fire({
                icon: 'error',
                text: '只能选择一个文章进行修改',
                confirmButtonText: 'ok',
                width: '475px',
                confirmButtonColor: '#7cd1f9',
            })
        } else {
            $(location).attr('href', '/admin/blog?method=getModifyArticle&id=' + index);
        }
    }
</script>

</body>
</html>
