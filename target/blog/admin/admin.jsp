<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>

    <jsp:include page="common/css.jsp"/>
    <script src="${pageContext.request.contextPath}/admin/js/admin.js"></script>
</head>

<body>
<div style="display: none" id="info" class="info">${success}</div>
<div class="container-fluid">

    <jsp:include page="common/admin_left.jsp"/>

    <div class="kb"></div>

    <main class="main">
        <jsp:include page="common/admin_top.jsp"/>


        <div class="content">
            <div class="container-fluid">
                <div class="card-header">
                    <h3>管理首页</h3>
                </div>
            </div>
        </div>


        <div class="rn">
            <div class="small-box" style="background: #17a2b8">
                <div class="inner">
                    <h3>新增文章</h3>
                    <p>记心中所想</p>
                </div>
                <a href="#">let's go </a>
            </div>
            <div class="small-box" style="background: #28a745">
                <div class="inner">
                    <h3>总文章数</h3>
                    <p>统计文章数量</p>
                </div>
                <a href="#">let's go </a>
            </div>
            <div class="small-box" style="background: #007bff">
                <div class="inner">
                    <h3>功能维护中</h3>
                    <p>收到的评论数</p>
                </div>
                <a href="#">let's go </a>
            </div>
        </div>

        <div class="rn">
            <div class="small-box" style="background: #ffc107">
                <div class="inner">
                    <h3>分类数量</h3>
                    <p>进行分类管理</p>
                </div>
                <a href="#">let's go </a>
            </div>
            <div class="small-box" style="background: #dc3545">
                <div class="inner">
                    <h3>标签总量</h3>
                    <p>文章标签的管理</p>
                </div>
                <a href="#">let's go </a>
            </div>
            <div class="small-box" style="background: #343a40">
                <div class="inner">
                    <h3>友情链接</h3>
                    <p>管理友链</p>
                </div>
                <a href="#">let's go </a>
            </div>
        </div>

    </main>

</div>
<script src="/plugins/sweetalert2/dist/sweetalert2.js"></script>
<script>
    var success = $("#info").html();
    if (success != null && success.length > 0) {
        Swal.fire({
            icon: 'success',
            text: '欢迎您的登录:${username}',
            confirmButtonText: 'ok',
            width: '475px',
            confirmButtonColor: '#7cd1f9',

        }).then((result) => {
            if (result) {
                <%request.getSession().removeAttribute("success");%>
            }
        })
    }
</script>
</body>

</html>