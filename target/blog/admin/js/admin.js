$(function () {


    // ʵ�ַ�ҳ��ť�ж�
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



