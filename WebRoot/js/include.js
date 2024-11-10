$(function () {
    $.get("header.jsp",function (data) {
        $("#header").html(data);
    });
    $.get("footer.jsp",function (data) {
        $("#footer").html(data);
    });
});