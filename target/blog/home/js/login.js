$(function () {
    var error = $("#info").html();
    if (error != null && error.length > 0) {
        $.growl.warning({
            title: "��¼֪ͨ",
            message: "�˺Ż��������!"
        })
    }


    var usercode = $("#usercode");
    var password = $("#password");
    $("#login").click(function () {
        if (usercode.val() != "" && password.val() != "") {
            $("#login-form").submit();
        }else if (usercode.val() == "") {
            $.growl.warning({
                title: "��¼֪ͨ",
                message: "�������˺�!"
            })
        }else if (password.val() == "") {
            $.growl.warning({
                title: "��¼֪ͨ",
                message: "����������!"
            })
        }
    })

})