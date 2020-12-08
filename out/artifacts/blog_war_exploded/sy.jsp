<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>小破站-首页</title>
    <%-- 导入css --%>
    <jsp:include page="home/common/css.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/jquery-ui/jquery-ui.css">
    <!-- choose one -->

</head>

<body>
<div class="pmd" style=""></div>
<div class="container" style="height: 100%">
    <%-- 头部导航栏 --%>
    <jsp:include page="home/common/header.jsp"/>
    <%-- 头部导航栏结束 --%>
    <%-- 左侧导航条 --%>
    <jsp:include page="home/common/left.jsp"/>
    <%-- 左侧导航条 --%>
    <!-- 主体部分 -->
    <main id="main" class="main-zhong row">
        <div class="main-box">
            <!-- 内容区头部 -->
            <header class="main-top">
                <h1>邱同学的小破站</h1>
                <span>" 记住,无论以后遇到什么,都不要对这个世界失去希望 "</span>
            </header>
            <!-- 主要内容区 -->
            <div class="center-part">
                <%--                <ol style="display: none;" class="breadcrumb">--%>
                <%--                    <li><a href="#">首页</a></li>--%>
                <%--                    <li><a href="#">Library</a></li>--%>
                <%--                    <li class="active">Data</li>--%>
                <%--                </ol>--%>
                <!--首页输出文章-->
                <div class="blog-post">
                    <c:forEach var="blogList" items="${blogList}">
                        <div class="single-post panel sypanel">
                            <div class="index-post-img">
                                <a href="${pageContext.request.contextPath}/index.jsp?method=getArticle&id=${blogList.id}">
                                    <!-- 展示文章头图 -->
                                    <img class="post-img" src="${blogList.photo}" alt="头图">
                                </a>
                                    <div class="article-data" style="max-height: 200px">
                                        <a href="${pageContext.request.contextPath}/index.jsp?method=getArticle&id=${blogList.id}">
                                        <h2>${blogList.title}</h2>
                                        </a>
                                        <p>
                                                ${blogList.content100}
                                        </p>
                                        <div class="line"></div>
                                        <div class="list-inline">
                                            <li>
                                                <i class="fa fa-user"></i>
                                                <a href="javascript:">${blogList.username}</a>
                                            </li>
                                            <li>
                                                <i class="fa fa-calendar"></i>
                                                <a href="javascript:">
                                                    <fmt:formatDate type="both"
                                                                    value="${blogList.uploadTime}" />
                                                </a>
                                            </li>
                                        </div>
                                    </div>

                            </div>
                        </div>
                    </c:forEach>
                </div>


                <!-- 分页 -->
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <%-- 上一页 --%>
                        <li id="previous" class="<c:if test="${currentPageNo <=1}">
                        disabled
                        </c:if>">
                            <a href="index.jsp?title=${title}&CategoryId=${queryCategoryId}&pageIndex=${currentPageNo-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <%
                            int totalPageCount = (int) request.getAttribute("totalPageCount");
                            int currentPageNo = (int)request.getAttribute("currentPageNo");
                            for (int i = 1; i <= totalPageCount; i++) {
                        %>

                        <li class="<%if (currentPageNo == i){%>active<%}%>">
                        <%-- 跳转页数 --%>
                        <a href="index.jsp?title=${title}&CategoryId=${queryCategoryId}&pageIndex=<%=i%>"><%=i%></a></li>
                        <%}%>

                        <li id="next" class="<c:if test="${currentPageNo >= totalPageCount}">
                            disabled
                            </c:if>">
                            <a href="index.jsp?title=${title}&CategoryId=${queryCategoryId}&pageIndex=${currentPageNo+1}" >
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- 分页结束 -->
            </div>
            <!-- 主要内容区结束 -->
        </div>
        <!-- 右侧导航栏 -->
        <jsp:include page="home/common/right.jsp"/>
        <!-- 右侧导航栏结束 -->
    </main>
</div>



<script src="${pageContext.request.contextPath}/plugins/jquery/jquery.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jquery_growl/jquery.growl.js"></script>
<script src="${pageContext.request.contextPath}/plugins/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jquery-ui/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/plugins/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/home/js/index.js"></script>
<script src="${pageContext.request.contextPath}/home/js/login.js"></script>

<%--<script src="${pageContext.request.contextPath}/js/bg/a7.js"></script>--%>
<script>
    if (<%=session.getAttribute("userSession") == null%>) {
        $("#Avatar").css("display", "none");
    }

    <!--复制弹框-->
    document.body.oncopy = function() {layer.msg('复制成功，若要转载请务必保留本文链接！');};
</script>
</body>

</html>