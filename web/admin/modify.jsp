<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


        <div class="content">
            <div class="container-fluid">
                <div class="card-header">
                    <h3>修改密码</h3>
                </div>
            </div>
        </div>


        <section class="content">
            <div class="container-fluid">
                <div class="wai">
                    <div class="panel panel-default">
                        <div class="panel-heading">基本信息</div>
                        <div class="panel-body">
                            <form action="/admin/user" id="modify-user" method="post" class="modify">
                                <input type="hidden" name="method" value="saveuser">
                                <div class="form-group">
                                    <label for="usercode">原账号</label>
                                    <p></p>
                                    <input type="text" name="usercode" id="usercode" class="form-control"
                                           placeholder="请输入登录账号">
                                    <label for="newusercode">新账号</label>
                                    <p></p>
                                    <input type="text" name="newusercode" id="newusercode" class="form-control"
                                           placeholder="请输入新登陆账号">
                                </div>
                                <div class="form-bottom">
                                    <button id="cs" type="button" class="btn btn-danger">确定修改</button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading">修改密码</div>
                        <div class="panel-body">
                            <form action="/admin/user" id="modify-password" method="post" class="modify">
                                <input type="hidden" name="method" value="savepwd">
                                <div class="form-group">
                                    <div>
                                        <label for="oldpassword">原密码</label>
                                        <p></p>
                                        <input type="password" name="oldpassword" id="oldpassword" class="form-control"
                                               placeholder="请输入原密码">
                                        <p></p>
                                    </div>
                                    <div>
                                        <label for="newpassword">新密码</label>
                                        <p></p>
                                        <input type="password" name="newpassword" id="newpassword" class="form-control"
                                               placeholder="请输入新密码">
                                        <p></p>
                                    </div>

                                </div>
                                <div class="form-bottom">
                                    <button id="tj" type="button" class="btn btn-danger">确定修改</button>
                                </div>
                            </form>
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
<script src="js/pwdmodify.js"></script>
<script>
    if (${message == "修改密码成功"}) {
        swal.fire({
            icon: 'success',
            text: '密码修改成功,请重新登录2妙后自动跳转!',
            confirmButtonText: 'ok',
            width: '475px',
            confirmButtonColor: '#7cd1f9',
        }).then((result) => {
            setTimeout('delayer()', 2000);
            //这里实现延迟5秒跳转
        })
        setTimeout('delayer()', 2000);
        //这里实现延迟5秒跳转
    }

    function delayer(){
        window.location = "/admin/login.jsp";
    }

</script>
</body>
</html>
