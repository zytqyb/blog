<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>小破站 | 登录</title>
    <jsp:include page="common/css.jsp"/>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
<div class="container-fluid" style="height: 100%;">
    <div class="login-card">
        <p style="text-align: center; padding: 20px; font-size: 16px">your personal blog , enjoy it</p>
        <form id="login-form" method="post" action="${pageContext.request.contextPath}/login">
            <div class="form-group">
                <label for="usercode">
                    <i class="fa fa-user"></i> 账号
                </label>
                <input type="text" class="form-control" name="usercode" id="usercode" placeholder="请输入账号">
                <label for="password">
                    <i class="fa fa-lock"></i> 密码
                </label>
                <input type="password" class="form-control" name="password" id="password" placeholder="请输入密码">
            </div>
            <div class="row yzm">
                <input type="text" class="form-control input-val" placeholder="请输入验证码">
                <div class="code" style="height: 32px;">
                    <canvas id="canvas" width="150px" height="32px"></canvas>
                </div>
            </div>
            <div class="row">
                <button id="register" type="button" class="btn btn-primary">注册</button>
                <button id="login" type="button" class="btn btn-primary">登录</button>
            </div>
            <div class="row" style="border: none">
                <button type="button" class="btn btn-primary">找回密码</button>
            </div>
        </form>
    </div>
</div>

<!-- 加载 jquery-->
<script src="${pageContext.request.contextPath}/plugins/jquery/jquery.js"></script>
<script src="${pageContext.request.contextPath}/admin/dist/code.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/sweetalert2/dist/sweetalert2.min.js"></script>
<script defer id="ribbon" src="dist/canvas-ribbon.js" size="150" alpha="0.6" zIndex="-1" mobile="true"
        data-click="true">
</script>
<script type="text/javascript" color="0,0,205" opacity='0.7' zIndex="-1" count="99" mobile="true"
        src="dist/canvas-nest.js">
</script>
<script id="ribbon_piao" mobile="true" src="dist/ribbon.js"></script>
<script>

    $(function() {
        code_draw();
        // 点击后刷新验证码
        $("#canvas").on('click', function() {
            code_draw();
        })

        $("#login").on('click', function() {
            // 将输入的内容转为大写，可通过这步进行大小写验证
            var val = $(".input-val").val().toLowerCase();
            // 获取生成验证码值
            var num = $('#canvas').attr('data-code');
            if (val == '') {
                swal.fire({
                    icon: 'error',
                    text: '请填写验证码!',
                    confirmButtonText: 'ok',
                    width: '475px',
                    confirmButtonColor: '#7cd1f9',
                })
            } else if (val == num) {
                $("#login-form").submit();
            } else {
                swal.fire({
                    icon: 'error',
                    text: '验证码错误，请重新填写!',
                    confirmButtonText: 'ok',
                    width: '475px',
                    confirmButtonColor: '#7cd1f9',
                })
                $(".input-val").val('');
            }
        })
    })

</script>
</body>

</html>