var path = $("#path").val();
var imgYes = "<img width='15px' src='/admin/img/y.png'/>";
var imgNo = "<img width='15px' src='/admin/img/n.png'/>";
/**
 * ��ʾ��Ϣ��ʾ
 * element:��ʾ��ʾ��Ϣ��Ԫ�أ�font��
 * css����ʾ��ʽ
 * tipString:��ʾ��Ϣ
 * status��true/false --��֤�Ƿ�ͨ��
 */
function validateTip(element,css,tipString,status){
    element.css(css);
    element.html(tipString);
    element.next().attr("status",status);
}
