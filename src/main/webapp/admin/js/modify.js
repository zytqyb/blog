$().ready(function () {
// �ڼ��̰��²��ͷż��ύ����֤�ύ��
    var modify = $("#modify").validate({
        rules: {
            usercode: {
                required: true,
            },
        },
        messages: {
            usercode: {
                required: "(�˺����벻��ȷ,����������)",
            },
        }
    });

    var modifypassword = $("#modify-password").validate({
        rules: {
            password: {
                required: true,
            },
        },
        messages: {
            password: {
                required: "(���벻��ȷ,����������)",
            },
        }
    });

    $("#cs").click(function () {
        if ($("#usercode").val() != "" && $("#newusercode").val() != "") {
            $("#modify").submit();
        }else {
            alert("�������˺�")
        }
    })

    $("#tj").click(function () {
        if ($("#password").val() != "" && $("#newpassword").val() != "") {
            $("#modify-password").submit();
        }else {
            alert("����������")
        }
    })
});





