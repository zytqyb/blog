<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>小破站 | 管理后台</title>
    <jsp:include page="common/css.jsp"/>
</head>
<body>

<div class="container-fluid fl">

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
                <a href="/admin/addarticle.jsp">let's go </a>
            </div>
            <div class="small-box" style="background: #28a745">
                <div class="inner">
                    <h3>总文章数</h3>
                    <p>统计文章数量</p>
                </div>
                <a href="/admin/blog?method=query">let's go </a>
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
                    <h3>功能维护中</h3>
                    <p>文章标签的管理</p>
                </div>
                <a href="#">let's go </a>
            </div>
            <div class="small-box" style="background: #343a40">
                <div class="inner">
                    <h3>功能维护中</h3>
                    <p>管理友链</p>
                </div>
                <a href="#">let's go </a>
            </div>
        </div>

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
<script src="/plugins/sweetalert2/dist/sweetalert2.js"></script>
<script>

    if (${success != null}) {
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