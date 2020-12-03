<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>小破站 | 发布文章</title>
    <jsp:include page="${pageContext.request.contextPath}/admin/common/css.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/editormd/css/editormd.css">

</head>
<body>
<div class="container-fluid">
    <jsp:include page="${pageContext.request.contextPath}/admin/common/admin_left.jsp"/>



    <main class="main">

        <jsp:include page="${pageContext.request.contextPath}/admin/common/admin_top.jsp"/>


        <section class="content">
            <div class="container-fluid">
                <div class="wai">
                    <div class="panel panel-default" style="width: 100%">
                        <div class="panel-heading">发布文章</div>
                        <div class="panel-body">
                            <form id="addArticle" class="form-inline" action="${pageContext.request.contextPath}/blog" method="post" style="min-height: 850px;">
                                <input name="method" value="addArticle" class="input-text" type="hidden">
                                <div class="form-group">
                                    <input type="text" class="form-control col-sm-6" placeholder="请输入文章标题" name="title"
                                           style="width: 50%; height: 38px">
                                    <input type="text" class="form-control col-sm-6" placeholder="请填入文章头图url" name="photo"
                                           style="width: 50%; height: 38px">
                                    <input type="text" class="form-control col-sm-6" placeholder="请输入文章摘要(用于首页展示)" name="content100"
                                           style="width: 50%; height: 38px">
                                    <input type="text" class="form-control col-sm-6" value="${userSession.username}" readonly = "readonly" placeholder="作者" name="username"
                                           style="width: 50%; height: 38px">
                                    <select name="category" id="blogCategoryId"
                                            class="form-control wid100"
                                            style="margin-top: 5px; height:38px">
                                        <option value="1">Mysql</option>
                                        <option value="2">Java</option>
                                        <option value="3">JavaScript</option>
                                    </select>
                                    <%-- editor.md编辑器 --%>

                                    <div id="my-editormd">
                                        <textarea id="my-editormd-markdown-doc" name="my-editormd-markdown-doc" style="display:none;"></textarea>
                                    </div>

                                </div>

                            </form>
                            <button class="btn btn-success" style="margin-left: 1000px" onclick="$('#addArticle').submit()">添加</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

</div>

<!-- 加载 jquery-->
<script src="${pageContext.request.contextPath}/plugins/jquery/jquery.js"></script>
<!-- 加载 Bootstrap-->
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath}/plugins/jquery_growl/jquery.growl.js"></script>
<script src="${pageContext.request.contextPath}/plugins/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/common.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/admin.js"></script>
<script src="${pageContext.request.contextPath}/plugins/editormd/editormd.js"></script>
<script type="text/javascript">
    $(function () {
        let editor = editormd("my-editormd", {
            width: "100%",
            height: "85%",
            path: "/plugins/editormd/lib/",
            saveHTMLToTextarea : true//注意3：这个配置，方便post提交表单
        });

        if (${result == false}) {
            Swal.fire({
                icon: 'error',
                text: '添加失败',
                confirmButtonText: 'ok',
                width: '475px',
                confirmButtonColor: '#7cd1f9',
            }).then((result) => {
                if (result) {
                    <%request.getSession().removeAttribute("result");%>
                }
            })
        }

        if (${result == true}) {
            Swal.fire({
                icon: 'success',
                text: '添加成功',
                confirmButtonText: 'ok',
                width: '475px',
                confirmButtonColor: '#7cd1f9',
            }).then((result) => {
                if (result) {
                    <%request.getSession().removeAttribute("result");%>
                }
            })
        }
    });

</script>
</body>
</html>
