<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>小破站 | 发布文章</title>
    <jsp:include page="common/css.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/editormd/css/editormd.css">

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
                        <div class="panel-heading">发布文章</div>
                        <div class="panel-body">
                            <form class="form-inline" method="post" style="min-height: 850px;">
                                <input name="method" value="addArticle" class="input-text" type="hidden">
                                <div class="form-group">
                                    <input type="text" class="form-control col-sm-6" placeholder="请输入文章标题" name="title"
                                           style="width: 50%; height: 38px">
                                    <input type="text" class="form-control col-sm-6" placeholder="文章标签可以为空" name="title"
                                           style="width: 50%; height: 38px">
                                    <select name="blogCategoryId" id="blogCategoryId"
                                            class="form-control wid100"
                                            style="margin-top: 5px; height:38px">
                                        <option value="1">Mysql</option>
                                        <option value="2">Java</option>
                                        <option value="3">JavaScript</option>
                                        <option value="4">杂谈</option>
                                    </select>
                                    <%-- editor.md编辑器 --%>

                                    <div id="my-editormd">
                                        <textarea id="my-editormd-markdown-doc" name="my-editormd-markdown-doc" style="display:none;"></textarea>
                                    </div>


                                </div>
                            </form>
                            <button id="cs">123</button>
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
<script src="js/common.js"></script>
<script src="js/admin.js"></script>
<script src="${pageContext.request.contextPath}/plugins/editormd/editormd.js"></script>
<script type="text/javascript">
    $(function () {
        let editor = editormd("my-editormd", {
            width: "100%",
            height: "85%",
            path: "/plugins/editormd/lib/",
            saveHTMLToTextarea : true//注意3：这个配置，方便post提交表单
        });
        $("#cs").click(function () {
            alert(editor.getMarkdown())
            alert(editor.getHTML()) ;
        })
               // 获取 Textarea 保存的 HTML 源码
    });

</script>
</body>
</html>
