$().ready(function () {
// 在键盘按下并释放及提交后验证提交表单
    var modify = $("#modify").validate({
        rules: {
            usercode: {
                required: true,
            },
        },
        messages: {
            usercode: {
                required: "(账号输入不正确,请重新输入)",
            },
        }
    });

    var modifypassword = $("#modify-password").validate({
        rules: {
            password: {
                required: true,
            },
        },
        messages: {
            password: {
                required: "(密码不正确,请重新输入)",
            },
        }
    });

    $("#cs").click(function () {
        if ($("#usercode").val() != "" && $("#newusercode").val() != "") {
            $("#modify").submit();
        }else {
            alert("请输入账号")
        }
    })

    $("#tj").click(function () {
        if ($("#password").val() != "" && $("#newpassword").val() != "") {
            $("#modify-password").submit();
        }else {
            alert("请输入密码")
        }
    })
});





