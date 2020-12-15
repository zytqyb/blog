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
                    <div class="panel panel-default" style="width: 100%; position: relative">
                        <div class="panel-heading">修改文章</div>
                        <div class="panel-body" style="overflow: hidden; padding-bottom: 50px">
                            <form id="addArticle" class="form-inline" action="${pageContext.request.contextPath}/admin/blog"
                                  method="post" style="min-height: 850px;">
                                <input name="method" value="ModifyBlog" class="input-text" type="hidden">
                                <input type="hidden" name="id" value="${blog.id}">
                                <div class="form-group">
                                    <input type="text" class="form-control col-sm-6" placeholder="请输入文章标题" name="title"
                                           style="width: 50%; height: 38px" value="${blog.title}">
                                    <input type="text" class="form-control col-sm-6" placeholder="请填入文章头图url"
                                           name="photo"
                                           style="width: 50%; height: 38px" value="${blog.photo}">
                                    <img width="100%" height="300px" id="img" src="" alt="文章头图" style="display: none; border-radius: 4px;">
                                    <input type="text" class="form-control col-sm-6" placeholder="请输入文章摘要(用于首页展示)"
                                           name="content100"
                                           style="width: 50%; height: 38px" value="${blog.content100}">
                                    <input type="text" class="form-control col-sm-6" value="${blog.username}"
                                           readonly="readonly" placeholder="作者" name="username"
                                           style="width: 50%; height: 38px">
                                    <select name="category" id="blogCategoryId"
                                            class="form-control wid100"
                                            style="margin-top: 5px; height:38px">
                                        <option value="1">Java</option>
                                        <option value="2">JavaScript</option>
                                        <option value="3">Css</option>
                                        <option value="4">Html</option>
                                        <option value="5">数据库</option>
                                        <option value="6">JavaWeb</option>
                                    </select>
                                    <%-- editor.md编辑器 --%>

                                    <div id="my-editormd" style="max-height: 800px; overflow: hidden">
                                        <textarea id="my-editormd-markdown-doc" name="my-editormd-markdown-doc"
                                                  style="display:none;">${blog.content}</textarea>
                                    </div>

                                </div>

                            </form>

                        </div>
                        <button class="addan btn btn-success"
                                onclick="$('#addArticle').submit()">修改
                        </button>
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
            height: "80%",
            path: "/plugins/editormd/lib/",
            saveHTMLToTextarea: true//注意3：这个配置，方便post提交表单
        });

        // 修改文章失败提示
        if (${ModifyBlogRs == 0}) {
            Swal.fire({
                icon: 'error',
                text: '修改失败, 请稍后重试',
                confirmButtonText: 'ok',
                width: '475px',
                confirmButtonColor: '#7cd1f9',
            }).then((result) => {
                if (result) {
                    <%request.getSession().removeAttribute("ModifyBlogRs");%>
                }
            })
        }

        if ($("#img").attr("src") != "") {
            $("#img").show();
        }

        // 切换文章头图是否显示
        $("input[name='photo']").on("blur", function () {
            $("#img").attr("src", $(this).val());
            if ($("#img").attr("src") == "") {
                $("#img").hide();
            }else {
                $("#img").show();
            }
        })
    });


</script>
</body>
</html>
