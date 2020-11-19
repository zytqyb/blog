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



})



