/// <reference path="D:\typings\jquery\jquery.d.ts" />

// var header = document.getElementById('header');

// var container = document.getElementById('wai')

// var main = document.getElementById('main')


// /* 监听浏览器窗口的大小变化 */
// window.onresize = function(){
//     header.style.width = container.offsetWidth + 'px';
// }


/* 实现顶部搜索框获取焦点后边框变化 */
// $("#ssk").focus(function() {
//     $("#ssk").css("")
// })


/* 实现登录框的弹出和隐藏 */
$("#sign").click(function() {
    $(".login-top").fadeToggle();
});


/* 实现右侧导航栏3个按钮的切换 */
var li = $("#right-qh li");

$(li).click(function () {
    $(this).addClass("qh").siblings().removeClass("qh");
    $(".tab-content").find(".wz-pane").fadeOut(500);
    $(".tab-content").find(".wz-pane").eq($(this).index()).fadeIn(500);
});



$("#fl a").click(function () {
    $("#fl ul").fadeToggle();
    $("#fl a i").toggle();
});

