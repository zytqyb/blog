/* 实现登录框的弹出和隐藏 */
$("#sign").on("click", function (e) {
    $(".login-top").fadeToggle();
    e.stopPropagation();
})

$("#signImg").on("click", function (e) {
    $(".guanli").fadeToggle(function () {
        if ($(".guanli").css("display") === "none") {
            $(".guanli").css("transform", "translateX(150px)");
        }
    });

    $(".guanli").css("transform", "translateX(0)");
    e.stopPropagation();
})

// 点击空白消失
$("#login-form").on("click", function (e) {
    // 阻止冒泡使得单击当初框不会消失
    e.stopPropagation();
})
$(".guanli").on("click", function (e) {
    e.stopPropagation();
})
$(document).on("click", function () {
    $(".login-top").fadeOut();
    $(".guanli").fadeOut(function () {
        $(".guanli").css("transform", "translateX(200px)");
    });

});

// let error = $("#info").html();
// if (error != null && error.length > 0) {
//     $.growl.warning({
//         title: "登录通知",
//         message: "账号或密码错误!"
//     })
// }

$("#login").on("click", function () {
    if ($("#usercode").val() != "" && $("#password").val() != "") {
        $.ajax({
            type: "POST",
            url: "/login",
            data: {method: "ajaxLogin", usercode: $("#usercode").val(), password: $("#password").val()},
            dataType: "json",
            success: function (data) {
                if (data.result == "success") {
                    window.location.reload();
                } else if (data.result == "pawError") {
                    Swal.fire({
                        icon: 'error',
                        text: '密码错误, 请稍后重试',
                        confirmButtonText: 'ok',
                        width: '475px',
                        confirmButtonColor: '#7cd1f9',
                    }).then((result) => {
                        if (result) {
                            window.location.reload();
                        }
                    })
                }else {
                    Swal.fire({
                        icon: 'error',
                        text: '账号未被注册, 请注册后尝试',
                        confirmButtonText: 'ok',
                        width: '475px',
                        confirmButtonColor: '#7cd1f9',
                    }).then((result) => {
                        if (result) {
                            window.location.reload();
                        }
                    })
                }
            },
            error: function (data) {
                Swal.fire({
                    icon: 'error',
                    text: '请求错误',
                    confirmButtonText: 'ok',
                    width: '475px',
                    confirmButtonColor: '#7cd1f9',
                })
            }
        })
    }else {
        Swal.fire({
            icon: 'error',
            text: '账号和密码都必须填写',
            confirmButtonText: 'ok',
            width: '475px',
            confirmButtonColor: '#7cd1f9',
        })
    }

});


// let usercode = $("#usercode");
// let password = $("#password");
// $("#login").click(function () {
//     if (usercode.val() !== "" && password.val() !== "") {
//         $("#login-form").submit();
//     } else if (usercode.val() === "") {
//         $.growl.warning({
//             title: "登录通知",
//             message: "请输入账号!"
//         })
//     } else if (password.val() === "") {
//         $.growl.warning({
//             title: "登录通知",
//             message: "请输入密码!"
//         })
//     }
// })

