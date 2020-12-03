

$(function () {

    // 实现分页按钮判断
    function flip(rs) {
        if (rs.is(".disabled")) {
            rs.click(function (e) {
                e.preventDefault();
            })
        }
    }
    flip($("#previous"));
    flip($("#next"));

    let usertable = $(".usertable");
    $("#usertable").on("click", function (e) {
        if (!$(usertable).hasClass("show")) {
            $(usertable).addClass("show");
        }else {
            $(usertable).removeClass("show");
        }
        e.stopPropagation();
    })

    $(document).on("click", function () {
        if ($(usertable).hasClass("show")) {
            $(usertable).removeClass("show");
        }
    })

})



