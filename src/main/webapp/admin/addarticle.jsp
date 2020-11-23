<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">

<head>
    <jsp:include page="common/css.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/editormd/css/editormd.css">

</head>
<body>
<div id="test-editor">
    <textarea style="display:none;">
        ### 关于 Editor.md
        **Editor.md** 是一款开源的、可嵌入的 Markdown 在线编辑器（组件），基于 CodeMirror、jQuery 和 Marked 构建。
    </textarea>
</div>
<script src="${pageContext.request.contextPath}/plugins/editormd/editormd.js"></script>
<script type="text/javascript">
    $(function () {
        let editor = editormd("test-editor", {
            width: "100%",
            height: "100%",
            path: "${pageContext.request.contextPath}/plugins/editormd/lib/"
        });
    });
</script>
</body>
</html>
