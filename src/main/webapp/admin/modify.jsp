<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="zh-CN">

<head>

    <jsp:include page="common/css.jsp"/>
    <script src="./js/pwdmodify.js"></script>
</head>
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
                                    <div>${message}</div>
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
</body>
</html>
