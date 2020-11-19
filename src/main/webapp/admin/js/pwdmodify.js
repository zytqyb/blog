var oldpassword = null;
var newpassword = null;
var tj = null;
$(function () {
    oldpassword = $("#oldpassword");
    newpassword = $("#newpassword");
    tj = $("#tj");
    // ʹ��ajax��֤���������͵�¼�������Ƿ����
    oldpassword.on("blur", function () {
        $.ajax({
            type: "GET",
            url: "/admin/user",
            data: {method: "pwdmodify", oldpassword: oldpassword.val()},
            dataType: "json",
            success: function (data) {
                if (data.result == "true") { //��������ȷ
                    validateTip(oldpassword.prev(), {"color": "green", "margin-bottom": "5px"}, imgYes + "��������ȷ", true)
                } else if (data.result == "false") { //���������벻��ȷ
                    validateTip(oldpassword.prev(), {"color": "red", "margin-bottom": "5px"}, imgNo + "ԭ�������벻��ȷ", false)
                } else if (data.result == "sessionerror") { // Session����
                    validateTip(oldpassword.prev(), {
                        "color": "red",
                        "margin-bottom": "5px"
                    }, imgNo + "��ǰ�û�session����, �����µ�¼", false)
                } else if (data.result == "error") { // ����������Ϊ��
                    validateTip(oldpassword.prev(), {"color": "red", "margin-bottom": "5px"}, imgNo + "�����������", false)
                }
            },
            error: function (data) {
                // �������
                validateTip(oldpassword.prev(), {"color": "red", "margin-bottom": "5px"}, imgNo + "�������", false)
            }
        })
    }).on("focus", function () {
        validateTip(oldpassword.prev(), {"color": "red", "margin-bottom": "5px"}, imgNo + "�����������", false)
    });

    // ��֤������Ŀ�����
    newpassword.on("focus", function () {
        validateTip(newpassword.prev(), {"color": "#666666"}, "* ���볤�ȱ����Ǵ��ڵ���6С��20", false);
    }).on("blur", function () {
        if (newpassword.val() != null && newpassword.val().length >= 6 && newpassword.val().length < 20) {
            validateTip(newpassword.prev(), {"color": "green"}, imgYes + "�������", true);
        } else {
            validateTip(newpassword.prev(), {"color": "red"}, imgNo + "�������벻���Ϲ淶������������", false);
        }
    });


    tj.on("click", function () {
        oldpassword.blur();
        newpassword.blur();
        if (oldpassword.attr("status") == "true" && newpassword.attr("status") == "true") {
            if (confirm("ȷ��Ҫ�޸����룿")) {
                $("#modify-password").submit();
            }
        }

    });

});