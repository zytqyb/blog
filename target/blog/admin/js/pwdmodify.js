var oldpassword = null;
var newpassword = null;
var tj = null;
$(function () {
    oldpassword = $("#oldpassword");
    newpassword = $("#newpassword");
    tj = $("#tj");
    // 使用ajax验证输入的密码和登录的密码是否相等
    oldpassword.on("blur", function () {
        $.ajax({
            type: "GET",
            url: "/admin/user",
            data: {method: "pwdmodify", oldpassword: oldpassword.val()},
            dataType: "json",
            success: function (data) {
                if (data.result == "true") { //旧密码正确
                    validateTip(oldpassword.prev(), {"color": "green", "margin-bottom": "5px"}, imgYes + "旧密码正确", true)
                } else if (data.result == "false") { //旧密码输入不正确
                    validateTip(oldpassword.prev(), {"color": "red", "margin-bottom": "5px"}, imgNo + "原密码输入不正确", false)
                } else if (data.result == "sessionerror") { // Session过期
                    validateTip(oldpassword.prev(), {
                        "color": "red",
                        "margin-bottom": "5px"
                    }, imgNo + "当前用户session过期, 请重新登录", false)
                } else if (data.result == "error") { // 旧密码输入为空
                    validateTip(oldpassword.prev(), {"color": "red", "margin-bottom": "5px"}, imgNo + "请输入旧密码", false)
                }
            },
            error: function (data) {
                // 请求出错
                validateTip(oldpassword.prev(), {"color": "red", "margin-bottom": "5px"}, imgNo + "请求出错", false)
            }
        })
    }).on("focus", function () {
        validateTip(oldpassword.prev(), {"color": "red", "margin-bottom": "5px"}, imgNo + "请输入旧密码", false)
    });

    // 验证新密码的可用性
    newpassword.on("focus", function () {
        validateTip(newpassword.prev(), {"color": "#666666"}, "* 密码长度必须是大于等于6小于20", false);
    }).on("blur", function () {
        if (newpassword.val() != null && newpassword.val().length >= 6 && newpassword.val().length < 20) {
            validateTip(newpassword.prev(), {"color": "green"}, imgYes + "密码可用", true);
        } else {
            validateTip(newpassword.prev(), {"color": "red"}, imgNo + "密码输入不符合规范，请重新输入", false);
        }
    });


    tj.on("click", function () {
        oldpassword.blur();
        newpassword.blur();
        if (oldpassword.attr("status") == "true" && newpassword.attr("status") == "true") {
            if (confirm("确定要修改密码？")) {
                $("#modify-password").submit();
            }
        }

    });

});