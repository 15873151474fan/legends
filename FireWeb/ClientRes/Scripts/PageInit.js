/// <reference path="jquery-ui.min.js" />
$(function () {
    SetUIButton(); //    SetUITabs()
});
/*写成函数是方便回调*/
function SetUIButton() {
    $(".ui_btn").button();
}
function SetUITabs() {
    $(".ui_tabs").tabs();
}