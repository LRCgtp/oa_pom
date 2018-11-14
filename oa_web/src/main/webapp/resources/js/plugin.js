/**
 * 打开弹出框
 */
function openDialog(div, title){
    $("#" + div).dialog({
        title:title,
        width:700,
        height:600,
        modal:true
    });
}