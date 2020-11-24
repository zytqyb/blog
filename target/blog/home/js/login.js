
    /* 实现登录框的弹出和隐藏 */

    $("#sign").click(function(e) {
        $(".login-top").fadeToggle();
    });

    // 点击空白消失
    
    var error = $("#info").html();
    if (error != null && error.length > 0) {
        $.growl.warning({
            title: "登录通知",
            message: "账号或密码错误!"
        })
    }


    var usercode = $("#usercode");
    var password = $("#password");
    $("#login").click(function () {
        if (usercode.val() != "" && password.val() != "") {
            $("#login-form").submit();
        }else if (usercode.val() == "") {
            $.growl.warning({
                title: "登录通知",
                message: "请输入账号!"
            })
        }else if (password.val() == "") {
            $.growl.warning({
                title: "登录通知",
                message: "请输入密码!"
            })
        }
    })

