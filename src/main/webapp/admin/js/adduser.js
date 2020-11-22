$(function () {
    let addUserName = $("#addUserName");
    addUserName.blur(function () {
        if (addUserName.val().length < 2 || addUserName.val().length > 20) {
            validateTip(addUserName.prev(), {
                "color": "red",
                "margin-bottom": "5px"
            }, imgNo + "用户昵称必须大于或者等于俩个字符&&小于20个字符", false)
        } else {
            validateTip(addUserName.prev(), {"color": "green", "margin-bottom": "5px"}, imgYes + "用户昵称可用", true);
        }
    })

    // 验证账号是否重复以及是否符合规范
    let addUserCode = $("#addUserCode");
    addUserCode.focus(function () {
        validateTip(addUserCode.prev(), {"color": "#666666"}, "* 登录账号长度必须是大于等于6小于20", false);
    }).blur(function () {
        $.ajax({
            type: "post",
            url: "/admin/user",
            data: {method: "codeAdd", addUserCode: addUserCode.val()},
            dataType: "json",
            success: function (data) {
                if (addUserCode.val().length !== 0) {
                    if (data.result === "yes") { // 如果账号不重复
                        validateTip(addUserCode.prev(), {
                            "color": "green",
                            "margin-bottom": "5px"
                        }, imgYes + "账号未被注册", true)
                    } else { // 如果输入账号和数据库内有重复
                        validateTip(addUserCode.prev(), {
                            "color": "red",
                            "margin-bottom": "5px"
                        }, imgNo + "账号已被注册", false)
                    }
                } else {
                    validateTip(addUserCode.prev(), {
                        "color": "red",
                        "margin-bottom": "5px"
                    }, imgNo + "账号不符合规范，请重新输入", false)
                }


            },
            error: function (data) {
                // 请求出错
                validateTip(addUserCode.prev(), {"color": "red", "margin-bottom": "5px"}, imgNo + "请求出错", false)
            }
        })
    });

    // 验证密码是否符合规范
    let addPassword = $("#addPassword");
    let newAddPassword = $("#newAddPassword");
    addPassword.focus(function () {
        validateTip(addPassword.prev(), {"color": "#666666"}, "* 密码长度必须是大于等于6小于20", false);
    }).blur(function () {
        if (addPassword.val().length < 6 || addPassword.val().length > 20) {
            validateTip(addPassword.prev(), {"color": "red", "margin-bottom": "5px"}, imgNo + "密码不符合规范，请重新输入", false)
        } else {
            validateTip(addPassword.prev(), {"color": "green"}, imgYes + "密码可用", true);
        }
    });
    // 验证二次密码是否和第一次密码相同
    newAddPassword.blur(function () {
        if (newAddPassword.val() != null && newAddPassword.val() === addPassword.val()) {
            validateTip(newAddPassword.prev(), {"color": "green"}, imgYes + "再次输入登录密码正确", true);
        } else {
            validateTip(newAddPassword.prev(), {
                "color": "red",
                "margin-bottom": "5px"
            }, imgNo + "再次输入登录密码错误，请重新输入", false)
        }
    });

    let addUserBtn = $("#addUserBtn");
    addUserBtn.click(function () {
        addUserName.blur();
        addUserCode.blur();
        addPassword.blur();
        newAddPassword.blur();
        if (addUserName.attr("status") && addUserCode.attr("status") && addPassword.attr("status") && newAddPassword.attr("status")) {
            Swal.fire({
                title: '确定添加吗？',
                icon: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                text: "确认要添加这个用户吗?",
                confirmButtonText: '确定添加',
                width: '475px',
                reverseButtons: true,
                confirmButtonColor: '#e64942',
                cancelButtonColor: '#efefef',
            }).then((result) => {
                if (result.value) {
                    $("#addForm").submit();
                }
            })
        }

    });


})