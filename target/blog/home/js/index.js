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


/* 实现右侧导航栏3个按钮的切换 */
$("#right-qh li").click(function () {
    let tabContent = $(".tab-content");
    $(this).addClass("qh").siblings().removeClass("qh");
    $(tabContent).find(".wz-pane").fadeOut(500);
    $(tabContent).find(".wz-pane").eq($(this).index()).fadeIn(500);
});

function flip(rs) {
    if (rs.is(".disabled")) {
        rs.click(function (e) {
            e.preventDefault();
        })
    }
}
flip($("#previous"));
flip($("#next"));

$(window).scroll(function () {
    if ($(this).scrollTop() > 300) {
        $(".back-to-top").css("top", "-220px");
    }else {
        $(".back-to-top").css("top", "-900px");
    }
})

$(".back-to-top").click(function () {
    if ($(window).scrollTop() > 0) {
        $("html,body").stop().animate({ scrollTop: 0 }, 600);
    }
})

// 切换


// $("#fl a").click(function (e) {
//     toggle($("#fl ul"), $("#fl a i"));
// });






// 切换组成二级菜单是否显示
function toggle(nav, icon) {
    if (!$(nav).hasClass("nav-sub")) {
        $(nav).addClass("nav-sub");
        $(icon).css("transform", "rotate(90deg)");
    } else {
        $(nav).removeClass("nav-sub");
        $(icon).css("transform", "rotate(0)");
    }
}

