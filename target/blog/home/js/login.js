 /* 实现登录框的弹出和隐藏 */
    $("#sign").on("click", function (e) {
        $(".login-top").fadeToggle();
        e.stopPropagation();
    })

    // 点击空白消失
    $("#login-form").on("click", function (e) {
        // 阻止冒泡使得单击当初框不会消失
        e.stopPropagation();
    })
    $(document).on("click", function () {
        $(".login-top").fadeOut();
    });

    let error = $("#info").html();
    if (error != null && error.length > 0) {
        $.growl.warning({
            title: "登录通知",
            message: "账号或密码错误!"
        })
    }


    let usercode = $("#usercode");
    let password = $("#password");
    $("#login").click(function () {
        if (usercode.val() !== "" && password.val() !== "") {
            $("#login-form").submit();
        }else if (usercode.val() === "") {
            $.growl.warning({
                title: "登录通知",
                message: "请输入账号!"
            })
        }else if (password.val() === "") {
            $.growl.warning({
                title: "登录通知",
                message: "请输入密码!"
            })
        }
    })

