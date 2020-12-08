var addUserName = $("#addUserName");
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
var addUserCode = $("#addUserCode");
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
var addPassword = $("#addPassword");
var newAddPassword = $("#newAddPassword");
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
    if (newAddPassword.val() != "" && newAddPassword.val() === addPassword.val()) {
        validateTip(newAddPassword.prev(), {"color": "green"}, imgYes + "再次输入登录密码正确", true);
    } else {
        validateTip(newAddPassword.prev(), {
            "color": "red",
            "margin-bottom": "5px"
        }, imgNo + "再次输入登录密码错误，请重新输入", false)
    }
});

function adduser() {
    addUserName.blur();
    addUserCode.blur();
    addPassword.blur();
    newAddPassword.blur();
    if (addUserName.attr("status") == "true" && addUserCode.attr("status") == "true" && addPassword.attr("status") == "true" && newAddPassword.attr("status") == "true") {
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
}

function deleteUser() {
    let flag = false;
    let idArray = document.getElementsByName("userId");
    for (let i = 0; i < idArray.length; i++) {
        if (idArray[i].checked) {
            flag = true;
            break;
        }
    }
    if (flag) {
        Swal.fire({
            title: '确定删除吗？',
            icon: 'warning',
            showCancelButton: true,
            cancelButtonText: '取消',
            text: "确认要删除选中的这些数据吗?",
            confirmButtonText: '确定删除',
            width: '475px',
            reverseButtons: true,
            confirmButtonColor: '#e64942',
            cancelButtonColor: '#efefef',
        }).then((result) => {
            if (result.value) {
                $("#blogForm").submit();
            }
        })
    } else {
        swal.fire({
            icon: 'error',
            text: '请选择需要删除的用户',
            confirmButtonText: 'ok',
            width: '475px',
            confirmButtonColor: '#7cd1f9',
        })
    }
}

function modifyUser() {
    let flag = 0;
    let index;
    let idArray = document.getElementsByName("userId");
    for (let i = 0; i < idArray.length; i++) {
        if (idArray[i].checked) {
            flag++;
            index = idArray[i].value;
        }
        if (flag > 1) {
            break;
        }
    }
    if (flag === 0) {
        swal.fire({
            icon: 'error',
            text: '请选择一个用户进行修改',
            confirmButtonText: 'ok',
            width: '475px',
            confirmButtonColor: '#7cd1f9',
        })
    } else if (flag > 1) {
        swal.fire({
            icon: 'error',
            text: '只能选择一个用户进行修改',
            confirmButtonText: 'ok',
            width: '475px',
            confirmButtonColor: '#7cd1f9',
        })
    } else {
        modifyUsers(index);
        $('#modifyUser').modal();
        $("#modifyUserBtn").click(function () {
            if ($("#rolePassword").val() === $("#modifyPassword").val() && $("#rolePassword").val() != "") {

                if ($("#modifyPassword").val() === $("#newModifyPassword").val()) {
                    $("#modifyForm").submit();
                }else {
                    validateTip($("#newModifyPassword").prev(), {
                        "color": "red",
                        "margin-bottom": "5px"
                    }, imgNo + "俩次密码不一样,请重新输入", false)
                }
            }else {

                validateTip($("#modifyPassword").prev(), {
                    "color": "red",
                    "margin-bottom": "5px"
                }, imgNo + "管理员密码错误,请重试", false)
            }
        })
    }
}

function modifyUsers(index) {
    $.ajax({
        type: "post",
        url: "/admin/user",
        data: {method: "getModifyUser", id: index},
        dataType: "json",
        success: function (data) {
            $("#modifyUserName").val(data.username);
            $("#modifyUserCode").val(data.usercode);
        },
        error: function (data) {
            swal.fire({
                icon: 'error',
                text: '请求失败!',
                confirmButtonText: 'ok',
                width: '475px',
                confirmButtonColor: '#7cd1f9',
            })
        }
    })
}